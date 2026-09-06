#!/bin/bash
set -e

ENV=${1:-dev}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$SCRIPT_DIR/../data"
CYPHER_SHELL="$SCRIPT_DIR/cypher-shell.sh"

echo "Verifying URIs for custom category mappings ($ENV)..."
echo "This searches your database for the correct Wikidata URIs."
echo ""

$CYPHER_SHELL $ENV < "$DATA_DIR/verify-uris.cypher"
