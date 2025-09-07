#!/usr/bin/env bash

set -e  # Exit on error

# Determine build config (default to debug)
if [[ "$1" == "release" ]]; then
    outdir="build/release"
    flags="-Wall -Wextra -Wshadow -pedantic -std=c99 -O2 -DNDEBUG"
else
    outdir="build/debug"
    flags="-Wall -Wextra -Wshadow -pedantic -std=c99 -g -fsanitize=address -DDEBUG"
fi

# Find first .c or .cpp file in the current directory
for src in *.c *.cpp; do
    if [[ -f "$src" ]]; then
        filename="${src%.*}"   # Strip extension
        ext="${src##*.}"       # Get extension
        break
    fi
done

# No source file found
if [[ -z "$filename" ]]; then
    echo "No .c or .cpp file found in current directory."
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$outdir"

# Determine compiler
if [[ "$ext" == "cpp" ]]; then
    compiler="g++"
else
    compiler="gcc"
fi

# Build the output path
outfile="$outdir/$filename"

# Compile
$compiler $flags -o "$outfile" "$src"
