<!-- target: skills/executing-plans/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Pre-Flight Context Checklist
Before you execute any code, you MUST load your context. 
1. **Look for context** in the user's requested directory (if specified) OR the default `.superpower-with-files/` directory.
2. **Read the following files** from that directory:
   - `task_plan.md` to understand the high-level goal and active Phase.
   - `findings.md` to understand any architectural constraints.
   - `progress.md` to see what tests have already run.
   - `active_tdd_plan.md` to get your exact minute-by-minute execution steps.

### Execution Checkpoint Rule
When you finish a batch of 3 tasks, *before* you pause to say "Ready for feedback", you MUST write the complete batch execution log into `progress.md` in the target directory used above.
