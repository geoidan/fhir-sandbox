#!/bin/bash

# Parse arguments
CLEAN=false
while [[ $# -gt 0 ]]; do
    case "$1" in
        -Clean|--clean)
            CLEAN=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${SCRIPT_DIR}/_build/html"

set -e

# Run build script
if [ "$CLEAN" = true ]; then
    bash "$SCRIPT_DIR/build.sh" -Clean
else
    bash "$SCRIPT_DIR/build.sh"
fi

INDEX_FILE="${BUILD_DIR}/index.html"
if [ ! -f "$INDEX_FILE" ]; then
    echo "Error: Rendered docs not found: $INDEX_FILE"
    exit 1
fi

# Open in browser (cross-platform)
if command -v xdg-open &> /dev/null; then
    # Linux
    xdg-open "$INDEX_FILE"
elif command -v open &> /dev/null; then
    # macOS
    open "$INDEX_FILE"
else
    echo "Could not open browser automatically. Open manually: $INDEX_FILE"
fi
