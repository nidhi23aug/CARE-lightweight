#!/usr/bin/env bash
# Install the CARE V2 agent design skill for Claude Code.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
dest="$HOME/.claude/skills/agent-design-care-v2"

mkdir -p "$HOME/.claude/skills"
rm -rf "$dest"
cp -R "$here/skills/agent-design-care-v2" "$dest"
echo "Skill installed to $dest"
