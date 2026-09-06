#!/bin/bash
set -e

ENV=${1:-dev}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$SCRIPT_DIR/../data"
CYPHER_SHELL="$SCRIPT_DIR/cypher-shell.sh"

echo "Setting up custom dating categories ($ENV)..."

echo ""
echo "Step 1: Cleaning up duplicate custom categories..."
$CYPHER_SHELL $ENV <<'CYPHER'
// Remove duplicate custom categories (keep one with lowest internal ID)
MATCH (c:Category)
WHERE c.uri STARTS WITH 'dating:'
WITH c.uri AS uri, collect(c) AS nodes
WHERE size(nodes) > 1
UNWIND tail(nodes) AS duplicate
DETACH DELETE duplicate
RETURN count(*) as deleted_duplicates;
CYPHER

echo ""
echo "Step 2: Creating custom categories..."
$CYPHER_SHELL $ENV < "$DATA_DIR/custom-categories.cypher"

echo ""
echo "Step 3: Mapping items to categories..."
$CYPHER_SHELL $ENV < "$DATA_DIR/custom-category-mappings.cypher"

echo ""
echo "Step 4: Disabling Wikidata categories, enabling custom ones..."
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
echo "Step 5: Clearing Redis cache..."
if command -v redis-cli &> /dev/null; then
    redis-cli DEL "trait:categories" 2>/dev/null || echo "  (Redis not available or key doesn't exist)"
else
    echo "  redis-cli not found - manually clear 'trait:categories' key if using Redis"
fi

echo ""
echo "Done! Verifying..."
$CYPHER_SHELL $ENV <<'CYPHER'
MATCH (c:Category {enabled: true})
RETURN c.uri as uri,
       [lbl IN c.prefLabel WHERE lbl ENDS WITH '@en'][0] as label,
       c.itemCount as items
ORDER BY label;
CYPHER
