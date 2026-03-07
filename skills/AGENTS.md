# SKILLS DIRECTORY

**Parent:** [../AGENTS.md](../AGENTS.md)

## OVERVIEW

Unified skills built from `.spf-core/vendor/` (upstream) + `.spf-core/overlays/` (customizations). Each skill is a self-contained reference guide with YAML frontmatter.

## STRUCTURE

```
skills/
├── brainstorming/           # Design before implementation
├── planning-with-files/     # Persistent memory system
├── spf-write-plan/          # Plan creation (SPF branded)
│   └── templates/           # Stack templates (python-cli, rust-axum, etc.)
├── spf-exec-plan/           # Plan execution (SPF branded)
├── test-driven-development/ # RED-GREEN-REFACTOR cycle
├── systematic-debugging/    # Root cause tracing
├── using-git-worktrees/     # Isolation for feature work
├── using-superpowers/       # How to find/use skills
├── writing-skills/          # TDD for documentation
├── requesting-code-review/  # Before merge
├── receiving-code-review/   # Handle feedback
├── finishing-a-development-branch/ # Merge/cleanup
├── dispatching-parallel-agents/ # Background execution
├── subagent-driven-development/  # Delegate implementation
└── verification-before-completion/ # Evidence required
```

## WHERE TO LOOK

| Task                    | Skill                        |
| ----------------------- | ---------------------------- |
| Start new feature       | `brainstorming/`             |
| Create implementation plan | `spf-write-plan/`          |
| Execute plan            | `spf-exec-plan/`             |
| Debug issue             | `systematic-debugging/`      |
| Write tests first       | `test-driven-development/`   |
| Isolate feature work    | `using-git-worktrees/`       |
| Create new skill        | `writing-skills/`            |

## CONVENTIONS

- Each skill has `SKILL.md` with YAML frontmatter
- SPF-branded skills: `spf-write-plan`, `spf-exec-plan`
- Skills reference other skills via `superpowers:skill-name`
- Stack templates in `spf-write-plan/templates/`

## ANTI-PATTERNS

- **NEVER** modify skills directly → edit overlays in `.spf-core/overlays/`
- **NEVER** skip frontmatter validation
- **NEVER** create skills without `name` and `description` fields
