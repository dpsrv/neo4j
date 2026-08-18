#!/bin/bash
set -e

ENV="${1:?Usage: $0 <env> (dev|prod)}"

# Get admin credentials
NEO4J_AUTH=$(kubectl get secret neo4j-auth-${ENV} -n dpsrv -o jsonpath="{.data.neo4j-auth-${ENV}}" | base64 -d)
NEO4J_USER="${NEO4J_AUTH%%/*}"
NEO4J_PASSWORD="${NEO4J_AUTH#*/}"

# Get wikidata credentials
WIKIDATA_AUTH=$(kubectl get secret neo4j-wikidata-auth-${ENV} -n dpsrv -o jsonpath="{.data.neo4j-wikidata-auth-${ENV}}" | base64 -d)
WIKIDATA_USER="${WIKIDATA_AUTH%%/*}"
WIKIDATA_PASSWORD="${WIKIDATA_AUTH#*/}"

cypher() {
  echo "$1" | kubectl exec -i -n dpsrv deploy/neo4j-${ENV} -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
}

echo "=== Creating $WIKIDATA_USER user on neo4j-${ENV} ==="
cypher "CREATE USER $WIKIDATA_USER IF NOT EXISTS SET PASSWORD '$WIKIDATA_PASSWORD' SET PASSWORD CHANGE NOT REQUIRED;"

echo "=== Done ==="
echo "User: $WIKIDATA_USER"
echo "(Note: Community edition has no role-based access - all users have full access)"
