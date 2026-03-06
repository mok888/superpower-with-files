<!-- target: skills/writing-plans/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework. 

### Dynamic Naming & Location
1. **Honor User Requests:** If the user specifies a directory for plans in their prompt (e.g., "Save to `my-plans/`"), you MUST honor that path.
2. **Default Location:** If no directory is specified, strictly save the active TDD plan to:
   **`/.superpower-with-files/active_tdd_plan.md`**

After you have written the plan, you MUST open the corresponding **`task_plan.md`** (in the same directory) and check off exactly whatever Phase was just completed in that high-level checklist.
