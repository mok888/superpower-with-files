# SPF-CORE DIRECTORY

**Parent:** [../AGENTS.md](../AGENTS.md)

## OVERVIEW

Core architecture for upstream management and skill generation. Contains raw vendor copies, custom overlays, build scripts, and source templates.

## STRUCTURE

```
.spf-core/
├── vendor/                  # Raw upstream copies (DO NOT EDIT)
│   ├── superpowers/         # obra/superpowers
│   └── planning-with-files/ # OthmanAdi/planning-with-files
├── overlays/                # Custom modifications
│   └── superpowers/         # spf-*.md overlay files
│       ├── spf-brainstorming.md
│       ├── spf-planning-with-files.md
│       ├── spf-receiving-review.md
│       ├── spf-requesting-review.md
│       └── spf-using-superpowers.md
├── scripts/                 # Build + sync automation
│   ├── build_unified.sh     # Merge vendor + overlays → skills/
│   └── sync-upstream.sh     # Fetch latest upstreams
├── src/                     # Source assets
│   ├── hooks/               # check-complete.sh, init-session.sh
│   ├── skill-templates/     # Stack templates (python-cli, rust-axum)
│   └── templates/           # Memory file templates
└── templates/               # (symlink or copy of src/templates/)
```

## WHERE TO LOOK

| Task                      | Location                          |
| ------------------------- | --------------------------------- |
| Customize a skill         | `overlays/superpowers/spf-*.md`   |
| Update from upstream      | `scripts/sync-upstream.sh`        |
| Rebuild skills            | `scripts/build_unified.sh`        |
| Add stack template        | `src/skill-templates/`            |
| Add hook                  | `src/hooks/`                      |
| View original upstream    | `vendor/superpowers/` or `vendor/planning-with-files/` |

## OVERLAY FORMAT

```markdown
<!-- target: skills/target-skill/SKILL.md -->
<!-- action: append | overwrite -->

## Custom Section
Your modifications here...
```

**Actions:**
- `append` - Add content to END of target
- `overwrite` - Replace target entirely

## ANTI-PATTERNS

- **NEVER** edit `vendor/` directly → changes lost on sync
- **NEVER** use `mod-*.md` naming → use `spf-*.md`
- **NEVER** skip `build_unified.sh` after overlay changes
- **NEVER** commit invalid overlays (must have `<!-- target: -->` and `<!-- action: -->`)

## WORKFLOW

```bash
# 1. Edit overlay
vim .spf-core/overlays/superpowers/spf-brainstorming.md

# 2. Rebuild
./.spf-core/scripts/build_unified.sh

# 3. Verify
git diff skills/

# 4. Commit
git add . && git commit -m "overlay: update brainstorming"
```
