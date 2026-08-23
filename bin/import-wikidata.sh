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

log "Setting up n10s (neosemantics) on neo4j-${ENV}"
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

log "Importing RDF (this will take a while)"
cypher "CALL n10s.rdf.import.fetch('file:///var/lib/neo4j/import/truthy.nt.gz', 'N-Triples', { commitSize: 25000, verifyUriSyntax: false });"

log "Import complete"
cypher "MATCH (n) RETURN count(n) AS nodes;"

log "Cleaning up pod"
kubectl exec -n dpsrv deploy/neo4j-${ENV} -- rm -f /var/lib/neo4j/import/truthy.nt.gz

log "Done"
