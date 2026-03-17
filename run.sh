#!/bin/bash
# Start Sashiko server for Gerrit review
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Load API key from .env
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

if [ -z "${ANTHROPIC_API_KEY:-}" ]; then
    echo "Error: ANTHROPIC_API_KEY not set. Create a .env file with it."
    exit 1
fi

echo "Starting Sashiko server..."
echo "  AI: Claude (${SASHIKO_AI__MODEL:-claude-sonnet-4-5})"
echo "  Repo: $(grep repository_path Settings.toml | cut -d'"' -f2)"
echo "  Server: http://127.0.0.1:$(grep port Settings.toml | head -1 | tr -dc '0-9')"
echo ""

cargo run --release -- --no-api "$@"
