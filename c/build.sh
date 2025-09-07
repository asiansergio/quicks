#!/usr/bin/env bash
set -e # Exit on error

# Determine build config (default to debug)
if [[ "$1" == "release" ]]; then
    outdir="build/release"
    flags="-Wall -Wextra -Wshadow -pedantic -std=c99 -O2 -DNDEBUG"
else
    outdir="build/debug"
    flags="-Wall -Wextra -Wshadow -pedantic -std=c99 -g -fsanitize=address -DDEBUG"
fi

# Create output directory if it doesn't exist
mkdir -p "$outdir"

# Determine compiler and source file
if [[ -f "quick.cpp" ]]; then
    compiler="g++"
    src="quick.cpp"
    filename="quick"
else
    compiler="gcc"
    src="quick.c"
    filename="quick"
fi

# Build the output path
outfile="$outdir/$filename"

# Compile
$compiler $flags -o "$outfile" "$src"
