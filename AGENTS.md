# SUPERPOWER-WITH-FILES KNOWLEDGE BASE

**Generated:** 2026-03-07T03:33:44Z
**Commit:** 9ad2189
**Branch:** master

## OVERVIEW

Unified AI workflow framework combining **planning-with-files** (persistent memory) + **superpowers** (TDD execution). Provides per-project memory isolation, upstream sync automation, and overlay-based skill customization.

## STRUCTURE

```
.
├── .spf-core/           # Core architecture (vendor, overlays, scripts)
│   ├── vendor/          # Raw upstream copies (superpowers, planning-with-files)
│   ├── overlays/        # Custom modifications (spf-*.md)
│   ├── scripts/         # Build + sync scripts
│   └── src/             # Templates, hooks, skill-templates
├── skills/              # Unified skills (built from vendor + overlays)
├── hooks/               # Session hooks (check-complete, init-session)
├── templates/           # Memory file templates
├── VERSION              # Current SPF version
└── CHANGELOG.md         # Auto-generated from upstream release notes
```

## WHERE TO LOOK

| Task                      | Location                          | Notes                            |
| ------------------------- | --------------------------------- | -------------------------------- |
| Add custom skill overlay  | `.spf-core/overlays/superpowers/` | Use `spf-*.md` naming            |
| Update upstreams          | `.spf-core/scripts/sync-upstream.sh` | Auto-bumps version, updates changelog |
| Build unified skills      | `.spf-core/scripts/build_unified.sh` | Validates YAML frontmatter      |
| Memory file templates     | `templates/`                      | task_plan, findings, progress    |
| Hook scripts              | `hooks/`                          | check-complete.sh, init-session.sh |
| Per-project memory        | `.superpower-with-files/{project}/` | Auto-created on first use       |

## CONVENTIONS

### Overlay Format
```markdown
<!-- target: skills/target-skill/SKILL.md -->
<!-- action: append | overwrite -->

Content to add or replace...
```

### SKILL.md Frontmatter
```yaml
---
name: skill-name-with-hyphens
description: Use when [specific triggering conditions]
---
```

### Per-Project Memory Path Resolution
1. **User-specified path** → Use exactly
2. **Project-based default** → `.superpower-with-files/{project-name}/`
3. **Fallback** → `.superpower-with-files/_current/`

Project name detection: user prompt → CWD basename → git remote → package manifest

## ANTI-PATTERNS (THIS PROJECT)

- **NEVER** modify `.spf-core/vendor/` directly → use overlays
- **NEVER** skip `build_unified.sh` after overlay changes
- **NEVER** use `mod-*.md` naming → use `spf-*.md`
- **NEVER** commit to `skills/` without validation passing
- **NEVER** mix project contexts in same memory folder

## UNIQUE STYLES

### Upstream Sync Workflow
```bash
# 1. Sync upstreams (auto-bumps VERSION, updates CHANGELOG)
./.spf-core/scripts/sync-upstream.sh

# 2. Review changes
git diff

# 3. Commit
git add . && git commit -m "vX.Y.Z: sync upstream"
```

### Build Workflow
```bash
# Rebuild skills from vendor + overlays
./.spf-core/scripts/build_unified.sh

# Validates:
# - YAML frontmatter (---...---)
# - name field exists
# - description field exists
```

## COMMANDS

```bash
# Sync upstreams + build
./.spf-core/scripts/sync-upstream.sh

# Build only (with validation)
./.spf-core/scripts/build_unified.sh

# Dry run sync
./.spf-core/scripts/sync-upstream.sh --dry-run
```

## NOTES

- Git worktrees: **REQUIRED** (original superpowers behavior, no SPF override)
- Skills are auto-generated from `.spf-core/vendor/` + `.spf-core/overlays/`
- VERSION file is single source of truth, auto-bumped on sync
- CHANGELOG.md entries auto-generated from upstream release notes
