#!/usr/bin/env bash
set -euo pipefail

BIN="./build/calc"

out="$($BIN --hello)"
if [[ "$out" != "hello from sv-calc" ]]; then
  echo "FAIL: expected 'hello from sv-calc' but got: $out"
  exit 1
fi

echo "OK"
