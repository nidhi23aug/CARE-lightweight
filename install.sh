#!/usr/bin/env bash
# Install the CARE Lightweight skill for Claude Code.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
dest="$HOME/.claude/skills/care-lightweight"

mkdir -p "$HOME/.claude/skills"
rm -rf "$dest"
cp -R "$here/skills/care-lightweight" "$dest"
echo "Skill installed to $dest"
