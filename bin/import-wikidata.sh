#!/bin/bash
set -e

ENV="${1:?Usage: $0 <env> <path-to-truthy.nt.gz>}"
DUMP_FILE="${2:?Usage: $0 <env> <path-to-truthy.nt.gz>}"

if [ ! -f "$DUMP_FILE" ]; then
  echo "File not found: $DUMP_FILE"
  exit 1
fi

START_TIME=$(date +%s)

elapsed() {
  local now=$(date +%s)
  local secs=$((now - START_TIME))
  local h=$((secs / 3600))
  local m=$(( (secs % 3600) / 60 ))
  local s=$((secs % 60))
  printf "%dh%02dm%02ds" $h $m $s
}

log() {
  echo "[$(elapsed)] $1"
}

NEO4J_AUTH=$(kubectl get secret neo4j-wikidata-auth-${ENV} -n dpsrv -o jsonpath="{.data.neo4j-wikidata-auth-${ENV}}" | base64 -d)
NEO4J_USER="${NEO4J_AUTH%%/*}"
NEO4J_PASSWORD="${NEO4J_AUTH#*/}"

POD=$(kubectl get pod -n dpsrv -l app=neo4j-${ENV} -o jsonpath='{.items[0].metadata.name}')

log "Waiting for neo4j-${ENV} to be ready..."
kubectl wait --for=condition=Ready pod/"$POD" -n dpsrv --timeout=120s

cypher() {
  kubectl exec -n dpsrv "$POD" -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD" "$1"
}

get_count() {
  kubectl exec -n dpsrv "$POD" -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD" "MATCH (n) RETURN count(n) as c;" 2>&1 | grep -v "^c$" | grep -v "Defaulted" | tr -d ' ' | grep -E '^[0-9]+$' | head -1
}

log "Clearing existing data on neo4j-${ENV}"
INITIAL=$(get_count)
if [ -z "$INITIAL" ] || [ "$INITIAL" = "0" ]; then
  log "  Database is empty"
else
  log "  Total nodes to delete: $INITIAL"
  log "  Starting delete in background..."

  DELETE_SCRIPT=$(cat <<'SCRIPT'
#!/bin/bash
while true; do
  REMAINING=$(cypher-shell -u "__USER__" -p "__PASS__" "MATCH (n) RETURN count(n) as c;" 2>/dev/null | grep -E '^[0-9]+$' | head -1)
  REMAINING=${REMAINING:-0}
  if [ "$REMAINING" = "0" ]; then
    echo "DELETE_DONE" >> /tmp/delete.log
    break
  fi
  cypher-shell -u "__USER__" -p "__PASS__" "CALL { MATCH (n) WITH n LIMIT 50000 DETACH DELETE n } IN TRANSACTIONS OF 10000 ROWS RETURN 'done';" >/dev/null 2>&1
  echo "REMAINING:$REMAINING" >> /tmp/delete.log
done
SCRIPT
)
  DELETE_SCRIPT="${DELETE_SCRIPT//__USER__/$NEO4J_USER}"
  DELETE_SCRIPT="${DELETE_SCRIPT//__PASS__/$NEO4J_PASSWORD}"
  DELETE_B64=$(echo "$DELETE_SCRIPT" | base64 | tr -d '\n')
  kubectl exec -n dpsrv "$POD" -- bash -c "echo '$DELETE_B64' | base64 -d > /tmp/delete.sh && chmod +x /tmp/delete.sh"
  kubectl exec -n dpsrv "$POD" -- bash -c "nohup /tmp/delete.sh > /tmp/delete.log 2>&1 &"

  while true; do
    sleep 10
    if kubectl exec -n dpsrv "$POD" -- grep -q "DELETE_DONE" /tmp/delete.log 2>/dev/null; then
      log "  Delete complete"
      break
    fi
    REMAINING=$(get_count 2>/dev/null || echo "?")
    if [ -n "$REMAINING" ] && [ "$REMAINING" != "?" ]; then
      DELETED=$((INITIAL - REMAINING))
      PCT=$((DELETED * 100 / INITIAL))
      log "  Progress: $DELETED/$INITIAL deleted ($PCT%) - $REMAINING remaining"
    fi
  done
  kubectl exec -n dpsrv "$POD" -- rm -f /tmp/delete.sh /tmp/delete.log
fi
log "Setting up n10s (neosemantics)"
cypher "CALL n10s.graphconfig.drop();" || true
cypher "CREATE CONSTRAINT n10s_unique_uri IF NOT EXISTS FOR (r:Resource) REQUIRE r.uri IS UNIQUE;"
cypher "CALL n10s.graphconfig.init({ handleVocabUris: 'MAP', handleMultival: 'ARRAY', keepLangTag: true, keepCustomDataTypes: false });"

if kubectl exec -n dpsrv "$POD" -- test -f /var/lib/neo4j/import/truthy.nt.gz 2>/dev/null; then
  log "Dump file already exists on pod, skipping copy"
else
  log "Copying dump file to pod ($(du -h "$DUMP_FILE" | cut -f1))"
  kubectl cp "$DUMP_FILE" "dpsrv/$POD:/var/lib/neo4j/import/truthy.nt.gz"
  log "Copy complete"
fi

log "Starting RDF import in background (survives connection drops)"
IMPORT_SCRIPT=$(cat <<'SCRIPT'
#!/bin/bash
echo "Import started at $(date)" > /tmp/import.log
cypher-shell -u "__USER__" -p "__PASS__" "CALL n10s.rdf.import.fetch('file:///var/lib/neo4j/import/truthy.nt.gz', 'N-Triples', { commitSize: 25000, verifyUriSyntax: false });"
echo "Import finished at $(date)" >> /tmp/import.log
SCRIPT
)
IMPORT_SCRIPT="${IMPORT_SCRIPT//__USER__/$NEO4J_USER}"
IMPORT_SCRIPT="${IMPORT_SCRIPT//__PASS__/$NEO4J_PASSWORD}"
IMPORT_B64=$(echo "$IMPORT_SCRIPT" | base64 | tr -d '\n')
kubectl exec -n dpsrv "$POD" -- bash -c "echo '$IMPORT_B64' | base64 -d > /tmp/import.sh && chmod +x /tmp/import.sh"
kubectl exec -n dpsrv "$POD" -- bash -c "nohup /tmp/import.sh >> /tmp/import.log 2>&1 &"

log "Import running in background on pod. Polling progress..."
IMPORT_START=$(date +%s)
LAST_COUNT=0
while true; do
  sleep 30
  COUNT=$(get_count 2>/dev/null || echo "0")
  COUNT=${COUNT:-0}

  # Check if import finished
  if kubectl exec -n dpsrv "$POD" -- grep -q "Import finished" /tmp/import.log 2>/dev/null; then
    ELAPSED_MIN=$(( ($(date +%s) - IMPORT_START) / 60 ))
    if [ "$ELAPSED_MIN" -gt 0 ]; then
      SPEED=$((COUNT / ELAPSED_MIN))
      log "Import complete: $COUNT nodes ($SPEED nodes/min)"
    else
      log "Import complete: $COUNT nodes"
    fi
    break
  fi

  # Show progress if count changed
  if [ "$COUNT" != "$LAST_COUNT" ]; then
    ELAPSED_MIN=$(( ($(date +%s) - IMPORT_START) / 60 ))
    if [ "$ELAPSED_MIN" -gt 0 ]; then
      SPEED=$((COUNT / ELAPSED_MIN))
      log "Progress: $COUNT nodes ($SPEED nodes/min)"
    else
      log "Progress: $COUNT nodes"
    fi
    LAST_COUNT=$COUNT
  fi
done

log "Cleaning up pod"
kubectl exec -n dpsrv "$POD" -- rm -f /var/lib/neo4j/import/truthy.nt.gz /tmp/import.sh /tmp/import.log

log "Done"
