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

cypher() {
  echo "$1" | kubectl exec -i -n dpsrv deploy/neo4j-${ENV} -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
}

log "Clearing existing data on neo4j-${ENV} (this may take a while)"

get_count() {
  cypher "MATCH (n) RETURN count(n) as c;" 2>&1 | grep -v "^c$" | grep -v "Defaulted" | tr -d ' ' | grep -E '^[0-9]+$' | head -1
}

# Get initial count
INITIAL=$(get_count)
if [ -z "$INITIAL" ] || [ "$INITIAL" = "0" ]; then
  log "  Database is empty"
else
  log "  Total nodes to delete: $INITIAL"
  BATCH=0
  # Delete in batches to avoid heap space issues
  while true; do
    BATCH=$((BATCH + 1))
    cypher "CALL { MATCH (n) WITH n LIMIT 50000 DETACH DELETE n } IN TRANSACTIONS OF 10000 ROWS RETURN 'done';" >/dev/null 2>&1
    REMAINING=$(get_count)
    REMAINING=${REMAINING:-0}
    if [ "$INITIAL" -gt 0 ]; then
      DELETED=$((INITIAL - REMAINING))
      PCT=$((DELETED * 100 / INITIAL))
      log "  Batch $BATCH: $DELETED/$INITIAL deleted ($PCT%) - $REMAINING remaining"
    fi
    if [ "$REMAINING" = "0" ]; then
      break
    fi
  done
fi
log "Setting up n10s (neosemantics)"
cypher "CALL n10s.graphconfig.drop();" || true
cypher "CREATE CONSTRAINT n10s_unique_uri IF NOT EXISTS FOR (r:Resource) REQUIRE r.uri IS UNIQUE;"
cypher "CALL n10s.graphconfig.init({ handleVocabUris: 'MAP', handleMultival: 'ARRAY', keepLangTag: true, keepCustomDataTypes: false });"

POD=$(kubectl get pod -n dpsrv -l app=neo4j-${ENV} -o jsonpath='{.items[0].metadata.name}')

if kubectl exec -n dpsrv "$POD" -- test -f /var/lib/neo4j/import/truthy.nt.gz 2>/dev/null; then
  log "Dump file already exists on pod, skipping copy"
else
  log "Copying dump file to pod ($(du -h "$DUMP_FILE" | cut -f1))"
  kubectl cp "$DUMP_FILE" "dpsrv/$POD:/var/lib/neo4j/import/truthy.nt.gz"
  log "Copy complete"
fi

log "Starting RDF import in background (survives connection drops)"
IMPORT_SCRIPT="/tmp/import-$$.sh"
kubectl exec -n dpsrv "$POD" -- bash -c "cat > $IMPORT_SCRIPT" <<EOF
#!/bin/bash
echo "Import started at \$(date)" > /tmp/import.log
cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD" <<'CYPHER'
CALL n10s.rdf.import.fetch('file:///var/lib/neo4j/import/truthy.nt.gz', 'N-Triples', { commitSize: 25000, verifyUriSyntax: false });
CYPHER
echo "Import finished at \$(date)" >> /tmp/import.log
EOF
kubectl exec -n dpsrv "$POD" -- chmod +x "$IMPORT_SCRIPT"
kubectl exec -n dpsrv "$POD" -- bash -c "nohup $IMPORT_SCRIPT >> /tmp/import.log 2>&1 &"

log "Import running in background on pod. Polling progress..."
LAST_COUNT=0
while true; do
  sleep 30
  COUNT=$(get_count 2>/dev/null || echo "0")
  COUNT=${COUNT:-0}

  # Check if import finished
  if kubectl exec -n dpsrv "$POD" -- grep -q "Import finished" /tmp/import.log 2>/dev/null; then
    log "Import complete: $COUNT nodes"
    break
  fi

  # Show progress if count changed
  if [ "$COUNT" != "$LAST_COUNT" ]; then
    log "Progress: $COUNT nodes"
    LAST_COUNT=$COUNT
  fi
done

log "Cleaning up pod"
kubectl exec -n dpsrv "$POD" -- rm -f /var/lib/neo4j/import/truthy.nt.gz "$IMPORT_SCRIPT" /tmp/import.log

log "Done"
