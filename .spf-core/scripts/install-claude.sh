#!/bin/bash
# Install SPF skills to Claude Code
# Usage: ./install-claude.sh [--global|--project]

set -e

MODE="${1:---global}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SPF_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_DIR="$SPF_ROOT/skills"

echo "=== SPF Claude Code Installer ==="
echo "SPF Root: $SPF_ROOT"
echo "Skills: $SKILLS_DIR"
echo "Mode: $MODE"
echo ""

if [ "$MODE" = "--global" ]; then
    TARGET="$HOME/.claude/skills"
    echo "Installing globally to $TARGET"
else
    TARGET="$(pwd)/.claude/skills"
    echo "Installing to current project: $TARGET"
fi

mkdir -p "$TARGET"

for skill_dir in "$SKILLS_DIR"/*/; do
    SKILL_NAME=$(basename "$skill_dir")
    TARGET_LINK="$TARGET/$SKILL_NAME"
    
    if [ -L "$TARGET_LINK" ]; then
        echo "  [EXISTS] $SKILL_NAME (symlink)"
    elif [ -d "$TARGET_LINK" ]; then
        echo "  [SKIP] $SKILL_NAME (directory exists)"
    else
        ln -s "$skill_dir" "$TARGET_LINK"
        echo "  [LINK] $SKILL_NAME"
    fi
done

echo ""
echo "=== Installation Complete ==="
echo ""
echo "Installed skills:"
ls -1 "$TARGET" | while read skill; do
    echo "  - $skill"
done
echo ""
echo "Usage in Claude Code:"
echo '  Use skill: @skill-name'
echo '  List skills: /skills'
