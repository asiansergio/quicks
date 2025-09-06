#!/usr/bin/env bash

set -e

# Determine build config (default: debug)
if [[ "$1" == "release" ]]; then
    config="release"
    shift
else
    config="debug"
fi

# Directory to search for executable
build_dir="build/$config"

# Find the first executable in the build directory
exe=""
for f in "$build_dir"/*; do
    if [[ -x "$f" && ! -d "$f" ]]; then
        exe="$f"
        break
    fi
done

# No executable found
if [[ -z "$exe" ]]; then
    echo "No executable found in $build_dir"
    exit 1
fi

# Run the executable with all remaining arguments
"$exe" "$@"
