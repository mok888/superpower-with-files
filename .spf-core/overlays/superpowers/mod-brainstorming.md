<!-- target: skills/brainstorming/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Skill Announcement
- Every time you start using this skill, you MUST first announce: 
  `🚀 **SUPERPOWER ACTIVE:** brainstorming`

### Design File Location (Per-Project Isolation)

**Path Priority:**
1. **User Override [HIGHEST]:** If user specifies a path, use it exactly.
2. **Project-Based Default [SECONDARY]:** `.superpower-with-files/{project-name}/design/YYYY-MM-DD-<topic>.md`
3. **Fallback [LAST RESORT]:** `.superpower-with-files/_current/design/YYYY-MM-DD-<topic>.md`

**Project Name Detection (in order):**
1. User prompt (e.g., "design auth for nautilus-trader")
2. Current working directory basename
3. Git remote name (last segment of origin URL)
4. Package manifest (`package.json`, `Cargo.toml`, `pyproject.toml`)

**Example Structure:**
```
.superpower-with-files/
├── nautilus-trader/
│   ├── design/
│   │   ├── 2025-03-07-auth-design.md
│   │   └── 2025-03-08-api-design.md
│   ├── task_plan.md
│   └── progress.md
└── quant-bot/
    └── design/
        └── 2025-03-07-strategy-design.md
```

**Rules:**
- Auto-create `.superpower-with-files/{project-name}/design/` if needed
- One folder per project — never mix contexts
- Ignore legacy `docs/plans/` path unless user requests it

### Transition Rule
After design is approved, you MUST invoke **`spf-write-plan`** to create the implementation plan.

### Automated Timestamping
- Every time you modify a memory file, you MUST append a horizontal rule and a timestamp at the very bottom:
  `---`
  `*Last Updated: YYYY-MM-DD HH:MM UTC*`
