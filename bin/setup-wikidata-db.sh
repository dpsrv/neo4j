#!/bin/bash
set -e

WIKIDATA_PASSWORD="${1:?Usage: $0 <wikidata-password>}"

NEO4J_AUTH=$(kubectl get secret neo4j-auth -n dpsrv -o jsonpath='{.data.neo4j-auth}' | base64 -d)
NEO4J_USER="${NEO4J_AUTH%%/*}"
NEO4J_PASSWORD="${NEO4J_AUTH#*/}"

cypher() {
  echo "$1" | kubectl exec -i -n dpsrv deploy/neo4j -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
}

echo "=== Creating wikidata user ==="
cypher "CREATE USER wikidata IF NOT EXISTS SET PASSWORD '$WIKIDATA_PASSWORD' SET PASSWORD CHANGE NOT REQUIRED;"
cypher "GRANT ROLE reader TO wikidata;"
cypher "GRANT ROLE editor TO wikidata;"

echo "=== Done ==="
echo "User: wikidata"
echo "Password: $WIKIDATA_PASSWORD"
echo ""
echo "Create the k8s secret with:"
echo "kubectl create secret generic neo4j-wikidata-auth -n dpsrv --from-literal=neo4j-wikidata-auth='wikidata/$WIKIDATA_PASSWORD'"
