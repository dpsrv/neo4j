#!/bin/bash
set -e

ENV=${1:-dev}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$SCRIPT_DIR/../data"
CYPHER_SHELL="$SCRIPT_DIR/cypher-shell.sh"

echo "Setting up custom dating categories ($ENV)..."

echo ""
echo "Step 1: Creating custom categories..."
$CYPHER_SHELL $ENV < "$DATA_DIR/custom-categories.cypher"

echo ""
echo "Step 2: Mapping items to categories..."
$CYPHER_SHELL $ENV < "$DATA_DIR/custom-category-mappings.cypher"

echo ""
echo "Step 3: Disabling Wikidata categories, enabling custom ones..."
$CYPHER_SHELL $ENV <<'CYPHER'
// Disable all Wikidata categories
MATCH (c:Category)
WHERE NOT c.uri STARTS WITH 'dating:'
SET c.enabled = false;

// Ensure custom categories are enabled
MATCH (c:Category)
WHERE c.uri STARTS WITH 'dating:'
SET c.enabled = true;
CYPHER

echo ""
echo "Done! Verifying..."
$CYPHER_SHELL $ENV <<'CYPHER'
MATCH (c:Category {enabled: true})
RETURN c.uri as uri,
       [lbl IN c.prefLabel WHERE lbl ENDS WITH '@en'][0] as label,
       c.itemCount as items
ORDER BY label;
CYPHER
