#!/usr/bin/env bash
set -e

# Determine build config (default: debug)
if [[ "$1" == "release" ]]; then
    config="release"
    shift
else
    config="debug"
fi

# Run the executable with all remaining arguments
"build/$config/quick" "$@"
