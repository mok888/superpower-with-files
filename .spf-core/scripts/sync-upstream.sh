#!/bin/bash
# Sync upstream repositories to vendor/
# Usage: ./sync-upstream.sh [--dry-run]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SPF_ROOT="$(dirname "$SCRIPT_DIR")"
VENDOR_DIR="$SPF_ROOT/vendor"
REPO_ROOT="$(dirname "$SPF_ROOT")"
DRY_RUN="${1:-}"

extract_latest_version() {
    local file="$1"
    if [ -f "$file" ]; then
        grep -m 1 -E "^##\s+\[?v?[0-9]+\.[0-9]+\.[0-9]+" "$file" | sed 's/^##\s*//' | sed 's/\[\|\]//g'
    fi
}

extract_changelog_entry() {
    local file="$1"
    local version="$2"
    if [ -f "$file" ] && [ -n "$version" ]; then
        sed -n "/^##.*${version}/,/^##\s/p" "$file" | head -n -1 | tail -n +2
    fi
}

bump_version() {
    local version="$1"
    local major minor patch
    major=$(echo "$version" | cut -d. -f1)
    minor=$(echo "$version" | cut -d. -f2)
    patch=$(echo "$version" | cut -d. -f3)
    patch=$((patch + 1))
    echo "${major}.${minor}.${patch}"
}

echo "=== SPF Upstream Sync ==="
echo "Vendor dir: $VENDOR_DIR"
echo ""

TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

echo "[1/5] Fetching superpowers upstream..."
cd "$TEMP_DIR"
git clone --depth 1 https://github.com/obra/superpowers.git superpowers-upstream 2>/dev/null
SP_VERSION=$(extract_latest_version "superpowers-upstream/RELEASE-NOTES.md")

echo "[2/5] Fetching planning-with-files upstream..."
git clone --depth 1 https://github.com/OthmanAdi/planning-with-files.git planning-upstream 2>/dev/null
PWF_VERSION=$(extract_latest_version "planning-upstream/CHANGELOG.md")

echo "[3/5] Syncing to vendor/..."
mkdir -p "$VENDOR_DIR"

if [ "$DRY_RUN" = "--dry-run" ]; then
    echo "  [DRY RUN] Would sync superpowers..."
    echo "  [DRY RUN] Would sync planning-with-files..."
else
    rsync -av --delete "$TEMP_DIR/superpowers-upstream/" "$VENDOR_DIR/superpowers/"
    rsync -av --delete "$TEMP_DIR/planning-upstream/" "$VENDOR_DIR/planning-with-files/"
fi

echo "[4/5] Rebuilding unified skills..."
cd "$SPF_ROOT"
if [ -f "$SPF_ROOT/scripts/build_unified.sh" ]; then
    if [ "$DRY_RUN" = "--dry-run" ]; then
        echo "  [DRY RUN] Would run build_unified.sh"
    else
        bash "$SPF_ROOT/scripts/build_unified.sh"
    fi
else
    echo "  Warning: build_unified.sh not found, skipping rebuild"
fi

echo "[5/6] Updating version..."
if [ "$DRY_RUN" != "--dry-run" ]; then
    VERSION_FILE="$REPO_ROOT/VERSION"
    
    if [ -f "$VERSION_FILE" ]; then
        CURRENT_VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')
        NEW_VERSION=$(bump_version "$CURRENT_VERSION")
    else
        NEW_VERSION="1.0.0"
    fi
    
    echo "$NEW_VERSION" > "$VERSION_FILE"
    echo "  Version: $NEW_VERSION"
else
    echo "  [DRY RUN] Would bump version"
fi

echo "[6/6] Updating CHANGELOG..."
if [ "$DRY_RUN" != "--dry-run" ]; then
    CHANGELOG_FILE="$REPO_ROOT/CHANGELOG.md"
    SYNC_DATE=$(date +%Y-%m-%d)
    
    SP_ENTRY=$(extract_changelog_entry "$VENDOR_DIR/superpowers/RELEASE-NOTES.md" "$SP_VERSION")
    PWF_ENTRY=$(extract_changelog_entry "$VENDOR_DIR/planning-with-files/CHANGELOG.md" "$PWF_VERSION")
    
    NEW_ENTRY="## [$NEW_VERSION] - $SYNC_DATE

### Superpowers ${SP_VERSION:-unknown}

$SP_ENTRY

### Planning-with-Files ${PWF_VERSION:-unknown}

$PWF_ENTRY

---
"
    
    if [ -f "$CHANGELOG_FILE" ]; then
        TMP_CHANGELOG=$(mktemp)
        echo "$NEW_ENTRY" > "$TMP_CHANGELOG"
        cat "$CHANGELOG_FILE" >> "$TMP_CHANGELOG"
        mv "$TMP_CHANGELOG" "$CHANGELOG_FILE"
    else
        echo "# SPF Changelog

All notable changes from upstream repositories are documented here.

$NEW_ENTRY" > "$CHANGELOG_FILE"
    fi
    echo "  Updated $CHANGELOG_FILE"
else
    echo "  [DRY RUN] Would update CHANGELOG.md"
fi

echo ""
echo "=== Sync Complete ==="
if [ "$DRY_RUN" != "--dry-run" ]; then
    echo ""
    echo "SPF Version: $NEW_VERSION"
    echo ""
    echo "Detected upstream versions:"
    echo "  - superpowers: ${SP_VERSION:-unknown}"
    echo "  - planning-with-files: ${PWF_VERSION:-unknown}"
    echo ""
    echo "Next steps:"
    echo "  1. Review changes: git diff"
    echo "  2. Commit: git add . && git commit -m \"v$NEW_VERSION: sync upstream (superpowers ${SP_VERSION:-unknown}, planning-with-files ${PWF_VERSION:-unknown})\""
fi
