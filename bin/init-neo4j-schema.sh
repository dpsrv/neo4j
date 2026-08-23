#!/bin/bash
set -e

ENV=${1:-dev}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CYPHER_SHELL="$SCRIPT_DIR/cypher-shell.sh"

echo "Initializing Neo4j schema for $ENV..."

$CYPHER_SHELL $ENV <<'CYPHER'
// User node constraint - unique user_id
CREATE CONSTRAINT user_id_unique IF NOT EXISTS
FOR (u:User) REQUIRE u.user_id IS UNIQUE;

// Index for User lookup by mongo_id (for migration)
CREATE INDEX user_mongo_id IF NOT EXISTS
FOR (u:User) ON (u.mongo_id);

// Index for trait lookups by Wikidata URI
CREATE INDEX trait_uri IF NOT EXISTS
FOR (t:Item) ON (t.uri);

// Full-text index for searching traits by label (all languages indexed, English filtered in query)
CREATE FULLTEXT INDEX trait_search IF NOT EXISTS
FOR (n:Item) ON EACH [n.prefLabel]
OPTIONS { indexConfig: { `fulltext.analyzer`: 'standard-no-stop-words' } };

// Show created indexes
SHOW INDEXES;
CYPHER

echo "Schema initialization complete."
