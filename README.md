# Python Default

Ideas on how to configure and setup a Python project.

## Getting Started

```sh
uv sync
```

## Checks

Run all checks with:

```sh
uv run ./check.sh
```

Add `--fix` to auto-fix issues where possible.

To run checks automatically before each commit:

```sh
ln -sf ../../check.sh .git/hooks/pre-commit
```

### Why a shell script?

A single `check.sh` serves as documentation for which tools we use and ensures local and CI checks stay in sync. The `pre-commit` framework solves similar problems but introduces a separate config file and dependency tree.