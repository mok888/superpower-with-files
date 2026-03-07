<!-- target: skills/requesting-code-review/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Skill Announcement
- Every time you start using this skill, you MUST first announce: 
  `🚀 **SUPERPOWER ACTIVE:** requesting-code-review`

### Workflow Standardization
1. **Context Awareness:** When providing a plan or requirements in the `PLAN_OR_REQUIREMENTS` field, always look for the active plan in the standardized memory directory:
   **`.superpower-with-files/active_tdd_plan.md`** (or the user-specified project root).
2. **Link Style:** Avoid using `docs/plans/` in examples or requests unless the plan actually exists there. Prefer relative paths from the project root.

### Automated Timestamping
- Every time you update a review request or summary, you MUST append a horizontal rule and a timestamp at the very bottom:
  `---`
  `*Last Updated: YYYY-MM-DD HH:MM UTC*`
