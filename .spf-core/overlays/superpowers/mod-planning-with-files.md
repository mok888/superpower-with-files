<!-- target: skills/planning-with-files/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Skill Announcement
- Every time you start using this skill (manually or as a sub-skill), you MUST first announce: 
  `🚀 **SUPERPOWER ACTIVE:** planning-with-files`

### Workflow Standardization
1. **Naming & Location Precedence:**
   - **User Override [HIGHEST]:** If the user specifies any path (e.g., "Save to `projects/tgnews`"), you MUST honor that path immediately.
   - **SPF Default [SECONDARY]:** If no path is specified by the user, strictly use the branded memory directory:
     **`.superpower-with-files/`**
   - **Legacy paths:** Avoid creating `task_plan.md` etc. directly in the root if the SPF directory exists or is requested. Seek to keep the project root clean.

### Automated Timestamping
- Every time you modify a memory file (`task_plan.md`, `findings.md`, `progress.md`), you MUST append a horizontal rule and a timestamp at the very bottom:
  `---`
  `*Last Updated: YYYY-MM-DD HH:MM UTC*`
