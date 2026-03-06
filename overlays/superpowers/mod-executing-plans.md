<!-- target: skills/executing-plans/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework. The unified memory architecture dictates that all AI artifacts strictly live in the `.superpower-with-files/` directory.

### Pre-Flight Context Checklist
Before you execute any code for this unified plan, you MUST read the following files to load your context:
1. `.superpower-with-files/task_plan.md` to understand the high-level goal and active Phase.
2. `.superpower-with-files/findings.md` to understand any architectural constraints.
3. `.superpower-with-files/progress.md` to see what tests have already run.
4. `.superpower-with-files/active_tdd_plan.md` to get your exact minute-by-minute execution steps.

### Execution Checkpoint Rule
When you finish a batch of 3 tasks, *before* you pause to say "Ready for feedback", you MUST write the complete batch execution log into `.superpower-with-files/progress.md` under `### Phase X`, including what files were modified and any failing/passing tests.
