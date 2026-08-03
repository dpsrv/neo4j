#!/bin/bash

NEO4J_URI="${NEO4J_URI:-bolt://localhost:7687}"
NEO4J_USER="${NEO4J_USER:-neo4j}"
NEO4J_PASSWORD="${NEO4J_PASSWORD:-changeme}"

if [ -n "$1" ]; then
  echo "$1" | kubectl exec -i -n dpsrv deploy/neo4j -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
else
  kubectl exec -it -n dpsrv deploy/neo4j -- cypher-shell -u "$NEO4J_USER" -p "$NEO4J_PASSWORD"
fi
