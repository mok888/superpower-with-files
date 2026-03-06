#!/usr/bin/env bash

# build_unified.sh
# This script compiles the unified 'superpower-with-files' workflow.
# It copies the raw upstream files from the /vendor submodules into /skills,
# and then injects our custom memory-tracking rules from /overlays using block appends.

set -e

# Setup paths
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
VENDOR_DIR="$REPO_ROOT/vendor"
OVERLAYS_DIR="$REPO_ROOT/overlays"
SKILLS_DIR="$REPO_ROOT/skills"
HOOKS_DIR="$REPO_ROOT/hooks"
TEMPLATES_DIR="$REPO_ROOT/templates"

echo "==============================================="
echo " Building superpower-with-files Integration"
echo "==============================================="

# 1. Clean previous build
echo "1. Cleaning previous build..."
rm -rf "$SKILLS_DIR" "$HOOKS_DIR" "$TEMPLATES_DIR"
mkdir -p "$SKILLS_DIR" "$HOOKS_DIR" "$TEMPLATES_DIR"

# 2. Copy Planning With Files (The Core Engine)
echo "2. Copying 'planning-with-files' Core..."
if [ ! -d "$VENDOR_DIR/planning-with-files" ]; then
    echo "ERROR: Submodule missing. Did you 'git submodule update --init'?"
    exit 1
fi
cp -r "$VENDOR_DIR/planning-with-files/skills/planning-with-files" "$SKILLS_DIR/"
cp -r "$VENDOR_DIR/planning-with-files/templates/"* "$TEMPLATES_DIR/"
cp -r "$VENDOR_DIR/planning-with-files/scripts/"* "$HOOKS_DIR/" # Planning uses scripts for hooks

# 3. Copy Superpowers (The Execution Drivers)
echo "3. Copying 'superpowers' Core..."
if [ ! -d "$VENDOR_DIR/superpowers" ]; then
    echo "ERROR: Submodule missing. Did you 'git submodule update --init'?"
    exit 1
fi
# Copy all superpowers skills except the ones we explicitly want to exclude/replace
cp -r "$VENDOR_DIR/superpowers/skills/"* "$SKILLS_DIR/"

# 4. Apply Overlays (The Magic Glue)
echo "4. Applying Overlays..."
if [ -d "$OVERLAYS_DIR/superpowers" ]; then
    for overlay_file in "$OVERLAYS_DIR/superpowers"/*.md; do
        if [ ! -f "$overlay_file" ]; then continue; fi
        
        # Read the target from the HTML comment at the top of the overlay file
        # Format expects: <!-- target: skills/folder/SKILL.md -->
        TARGET_PATH=$(grep -m 1 "<!-- target:" "$overlay_file" | sed 's/<!-- target: \(.*\) -->/\1/' | tr -d '\r')
        ACTION=$(grep -m 1 "<!-- action:" "$overlay_file" | sed 's/<!-- action: \(.*\) -->/\1/' | tr -d '\r')
        
        if [ -n "$TARGET_PATH" ]; then
            FULL_TARGET="$REPO_ROOT/$TARGET_PATH"
            
            if [ ! -f "$FULL_TARGET" ]; then
                echo "  [WARN] Target missing: $TARGET_PATH"
                continue
            fi
            
            if [ "$ACTION" == "append" ]; then
                echo "  [APPEND] $overlay_file -> $TARGET_PATH"
                # Strip the command lines (first two lines) and append the rest
                tail -n +3 "$overlay_file" >> "$FULL_TARGET"
            elif [ "$ACTION" == "overwrite" ]; then
                echo "  [OVERWRITE] $overlay_file -> $TARGET_PATH"
                # Strip the command lines and overwrite
                tail -n +3 "$overlay_file" > "$FULL_TARGET"
            else
                echo "  [WARN] Unknown action: $ACTION in $overlay_file"
            fi
        fi
    done
fi

# 5. Apply Custom Memory Directory Name (User Configuration)
echo "5. Applying Custom Memory Directory Configuration..."
MEMORY_DIR=".superpower-with-files"
if [ -f "$REPO_ROOT/.env" ]; then
    # Load env file safely
    export $(grep -v '^#' "$REPO_ROOT/.env" | xargs -d '\n')
    if [ -n "$CUSTOM_MEMORY_DIR" ]; then
        MEMORY_DIR="$CUSTOM_MEMORY_DIR"
        echo "  -> Found .env overriding default directory to: /$MEMORY_DIR/"
    fi
fi

if [ "$MEMORY_DIR" != ".superpower-with-files" ]; then
    echo "  -> Replacing hardcoded '.superpower-with-files/' with '$MEMORY_DIR/' across all generated files..."
    
    # Find all generated files and perform inline sed replacement
    find "$SKILLS_DIR" "$HOOKS_DIR" "$TEMPLATES_DIR" -type f -exec sed -i "s/\.superpower-with-files\//$MEMORY_DIR\//g" {} +
else
    echo "  -> Using default memory directory: /.superpower-with-files/"
fi

echo "==============================================="
echo " Build Complete: Core and Overlays merged into /skills"
echo "==============================================="
