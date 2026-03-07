<!-- target: skills/brainstorming/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Skill Announcement
- Every time you start using this skill, you MUST first announce: 
  `🚀 **SUPERPOWER ACTIVE:** brainstorming`

### Workflow Standardization
1. **Naming & Location Precedence:**
   - **User Override [HIGHEST]:** If the user specifies any path (e.g., "Save to `projects/tgnews`"), you MUST honor that path immediately.
   - **SPF Default [SECONDARY]:** If no path is specified, save design docs to:
     **`.superpower-with-files/design/YYYY-MM-DD-<topic>.md`**
   - **Legacy paths (docs/plans/):** Ignore any legacy instructions about `docs/plans/` unless specifically requested by the user.

2. **Transition Rule:** After the design is approved, you MUST invoke **`spf-write-plan`** to create the implementation plan. Do not refer to it by any other name.

### Automated Timestamping
- Every time you modify a memory file, you MUST append a horizontal rule and a timestamp at the very bottom:
  `---`
  `*Last Updated: YYYY-MM-DD HH:MM UTC*`
