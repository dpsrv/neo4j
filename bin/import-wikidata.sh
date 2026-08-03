#!/bin/bash
set -e

DUMP_FILE="${1:?Usage: $0 <path-to-truthy.nt.gz>}"

if [ ! -f "$DUMP_FILE" ]; then
  echo "File not found: $DUMP_FILE"
  exit 1
fi

NEO4J_AUTH=$(kubectl get secret neo4j-wikidata-auth -n dpsrv -o jsonpath='{.data.neo4j-wikidata-auth}' | base64 -d)
NEO4J_USER="${NEO4J_AUTH%%/*}"
NEO4J_PASSWORD="${NEO4J_AUTH#*/}"

cypher() {
  echo "$1" | kubectl exec -i -n dpsrv deploy/neo4j -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
}

echo "=== Setting up n10s (neosemantics) ==="
cypher "CREATE CONSTRAINT n10s_unique_uri IF NOT EXISTS FOR (r:Resource) REQUIRE r.uri IS UNIQUE;"
cypher "CALL n10s.graphconfig.init({ handleVocabUris: 'MAP', handleMultival: 'ARRAY', keepLangTag: false, keepCustomDataTypes: false });"

echo "=== Copying dump file to pod ==="
POD=$(kubectl get pod -n dpsrv -l app=neo4j -o jsonpath='{.items[0].metadata.name}')
kubectl cp "$DUMP_FILE" "dpsrv/$POD:/var/lib/neo4j/import/truthy.nt.gz"

echo "=== Importing RDF (this will take a while) ==="
cypher "CALL n10s.rdf.import.fetch('file:///var/lib/neo4j/import/truthy.nt.gz', 'N-Triples', { commitSize: 25000 });"

echo "=== Done ==="
cypher "MATCH (n) RETURN count(n) AS nodes;"
