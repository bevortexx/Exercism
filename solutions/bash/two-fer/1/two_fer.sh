#!/usr/bin/env bash

you="$1"

if [ $# -eq 0 ]; then
    you="you"
fi

echo "One for $you, one for me."