#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CYPHER_SHELL="$SCRIPT_DIR/cypher-shell.sh"

usage() {
    echo "Usage: $0 [env] <whitelist-file>"
    echo "  env: Environment (default: dev)"
    echo "  whitelist-file: Path to file with category URIs (one per line)"
    echo ""
    echo "Example: $0 dev category-whitelist.txt"
    exit 1
}

ENV="${1:-dev}"
WHITELIST_FILE="$2"

if [ -z "$WHITELIST_FILE" ]; then
    # If only one arg, treat it as whitelist file with default env
    if [ -f "$ENV" ]; then
        WHITELIST_FILE="$ENV"
        ENV="dev"
    else
        usage
    fi
fi

if [ ! -f "$WHITELIST_FILE" ]; then
    echo "Error: Whitelist file not found: $WHITELIST_FILE"
    exit 1
fi

echo "Enabling categories from: $WHITELIST_FILE"
echo "Environment: $ENV"

# Parse whitelist file: strip comments, empty lines, and inline comments
URIS=$(grep -v '^#' "$WHITELIST_FILE" | grep -v '^[[:space:]]*$' | sed 's/#.*//' | awk '{print $1}' | sort -u)

# Count URIs
URI_COUNT=$(echo "$URIS" | wc -l | tr -d ' ')
echo "Found $URI_COUNT URIs in whitelist"

# Build comma-separated list for Cypher
URI_LIST=$(echo "$URIS" | sed "s/^/'/;s/$/'/" | tr '\n' ',' | sed 's/,$//')

# Run the update query - first disable all, then enable whitelist
$CYPHER_SHELL $ENV <<EOF
// Disable all categories first
MATCH (c:Category)
WHERE c.enabled = true
SET c.enabled = false;
EOF

$CYPHER_SHELL $ENV <<EOF
// Enable only whitelisted categories
MATCH (c:Category)
WHERE c.uri IN [$URI_LIST]
SET c.enabled = true
RETURN count(c) as enabled_count;
EOF

echo ""
echo "Done!"
