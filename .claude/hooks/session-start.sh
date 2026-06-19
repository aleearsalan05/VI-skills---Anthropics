#!/bin/bash
set -euo pipefail

# SessionStart hook: inject persistent project memory into the session context.
#
# Reads MEMORY.md from the repo root and returns it as `additionalContext` so
# every Claude Code session (web, desktop, or CLI) starts already aware of the
# project's running notes — decisions, work in progress, conventions, gotchas.
#
# Idempotent and non-interactive. Exits cleanly (injecting nothing) if the
# memory file is missing, so it never blocks a session from starting.

MEMORY_FILE="${CLAUDE_PROJECT_DIR:-.}/MEMORY.md"

if [ ! -f "$MEMORY_FILE" ]; then
  exit 0
fi

# Build valid JSON with the file contents safely escaped as additionalContext.
python3 - "$MEMORY_FILE" <<'PY'
import json
import sys

with open(sys.argv[1], "r", encoding="utf-8") as f:
    memory = f.read()

context = (
    "The following is the project's persistent memory (MEMORY.md). "
    "Use it as background for this session and keep it up to date when "
    "lasting decisions are made:\n\n" + memory
)

print(json.dumps({
    "hookSpecificOutput": {
        "hookEventName": "SessionStart",
        "additionalContext": context,
    }
}))
PY
