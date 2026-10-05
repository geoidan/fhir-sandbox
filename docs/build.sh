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
SOURCE_DIR="${SCRIPT_DIR}/source"
BUILD_DIR="${SCRIPT_DIR}/_build/html"

set -e

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory not found: $SOURCE_DIR"
    exit 1
fi

if [ "$CLEAN" = true ] && [ -d "$BUILD_DIR" ]; then
    rm -rf "$BUILD_DIR"
fi

if [ ! -d "$BUILD_DIR" ]; then
    mkdir -p "$BUILD_DIR"
fi

SPHINX_ARGS=("-m" "sphinx" "-b" "html")
if [ "$CLEAN" = true ]; then
    SPHINX_ARGS+=("-E" "-a")
fi

python "${SPHINX_ARGS[@]}" "$SOURCE_DIR" "$BUILD_DIR"
