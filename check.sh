#!/usr/bin/env bash

set -euo pipefail

# There are two circumstances where one might want to run the script:
# 1. Locally before committing: Get auto-fixes (./check.sh --fix)
# 2. In a CI pipeline: Fail the build if any checks fail (./check.sh)
format_args=(--diff)
check_args=()
if [ "${1-}" == "--fix" ]; then
  format_args=()
  check_args=(--fix --unsafe-fixes --show-fixes)
fi

echo "Linting and formatting..."
uv run ruff format . "${format_args[@]}"
uv run ruff check . "${check_args[@]}"

echo "Checking types..."
uv run ty check

echo "Running tests..."
uv run pytest

echo "All checks passed!"
