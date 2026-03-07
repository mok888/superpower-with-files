<!-- target: skills/planning-with-files/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Skill Announcement
- Every time you start using this skill (manually or as a sub-skill), you MUST first announce: 
  `🚀 **SUPERPOWER ACTIVE:** planning-with-files`

### Memory File Location (Per-Project Isolation)

**Path Priority:**
1. **User Override [HIGHEST]:** If user specifies a path, use it exactly.
2. **Project-Based Default [SECONDARY]:** `.superpower-with-files/{project-name}/`
3. **Fallback [LAST RESORT]:** `.superpower-with-files/_current/`

**Project Name Detection (in order):**
1. User prompt (e.g., "work on nautilus-trader")
2. Current working directory basename
3. Git remote name (last segment of origin URL)
4. Package manifest (`package.json`, `Cargo.toml`, `pyproject.toml`)

**Example Structure:**
```
.superpower-with-files/
├── nautilus-trader/        # Project A
│   ├── task_plan.md
│   ├── findings.md
│   └── progress.md
├── quant-bot/              # Project B
│   ├── task_plan.md
│   ├── findings.md
│   └── progress.md
└── _templates/             # Shared starting templates
    ├── task_plan.md
    ├── findings.md
    └── progress.md
```

**Rules:**
- Auto-create `.superpower-with-files/{project-name}/` if it doesn't exist
- Copy from `_templates/` when starting a new project
- One folder per project — never mix contexts
- Keep project root clean

### Automated Timestamping
- Every time you modify a memory file (`task_plan.md`, `findings.md`, `progress.md`), you MUST append a horizontal rule and a timestamp at the very bottom:
  `---`
  `*Last Updated: YYYY-MM-DD HH:MM UTC*`
