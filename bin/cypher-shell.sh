#!/bin/bash

NEO4J_AUTH=$(kubectl get secret neo4j-auth -n dpsrv -o jsonpath='{.data.neo4j-auth}' | base64 -d)
NEO4J_USER="${NEO4J_AUTH%%/*}"
NEO4J_PASSWORD="${NEO4J_AUTH#*/}"

if [ -n "$1" ]; then
  echo "$1" | kubectl exec -i -n dpsrv deploy/neo4j -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
else
  kubectl exec -it -n dpsrv deploy/neo4j -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
fi
