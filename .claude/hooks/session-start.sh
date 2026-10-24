#!/bin/bash
# Устанавливает зависимости проекта в облачной сессии Claude Code.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

PYTHON_VERSION="3.14"
VENV=".venv"

if command -v uv >/dev/null 2>&1; then
  [ -x "$VENV/bin/python" ] || uv venv --quiet --python "$PYTHON_VERSION" "$VENV"
  uv pip install --quiet --python "$VENV/bin/python" -r requirements-dev.txt
else
  [ -x "$VENV/bin/python" ] || "python$PYTHON_VERSION" -m venv "$VENV"
  "$VENV/bin/pip" install --quiet -r requirements-dev.txt
fi

if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo "export VIRTUAL_ENV=\"$PWD/$VENV\"" >> "$CLAUDE_ENV_FILE"
  echo "export PATH=\"$PWD/$VENV/bin:\$PATH\"" >> "$CLAUDE_ENV_FILE"
fi
