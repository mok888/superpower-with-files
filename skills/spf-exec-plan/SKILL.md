---
name: spf-exec-plan
description: Use when you have a written implementation plan to execute in a separate session with review checkpoints
---

# Executing Plans

## Overview

Load plan, review critically, execute tasks in batches, report for review between batches.

**Core principle:** Batch execution with checkpoints for architect review.

**Announce at start:** "I'm using the executing-plans skill to implement this plan."

## The Process

### Step 1: Load and Review Plan
1. Read plan file
2. Review critically - identify any questions or concerns about the plan
3. If concerns: Raise them with your human partner before starting
4. If no concerns: Create TodoWrite and proceed

### Step 2: Execute Batch
**Default: First 3 tasks**

For each task:
1. Mark as in_progress
2. Follow each step exactly (plan has bite-sized steps)
3. Run verifications as specified
4. Mark as completed

### Step 3: Report
When batch complete:
- Show what was implemented
- Show verification output
- Say: "Ready for feedback."

### Step 4: Continue
Based on feedback:
- Apply changes if needed
- Execute next batch
- Repeat until complete

### Step 5: Complete Development

After all tasks complete and verified:
- Announce: "I'm using the finishing-a-development-branch skill to complete this work."
- **REQUIRED SUB-SKILL:** Use superpowers:finishing-a-development-branch
- Follow that skill to verify tests, present options, execute choice

## When to Stop and Ask for Help

**STOP executing immediately when:**
- Hit a blocker mid-batch (missing dependency, test fails, instruction unclear)
- Plan has critical gaps preventing starting
- You don't understand an instruction
- Verification fails repeatedly

**Ask for clarification rather than guessing.**

## When to Revisit Earlier Steps

**Return to Review (Step 1) when:**
- Partner updates the plan based on your feedback
- Fundamental approach needs rethinking

**Don't force through blockers** - stop and ask.

## Remember
- Review plan critically first
- Follow plan steps exactly
- Don't skip verifications
- Reference skills when plan says to
- Between batches: just report and wait
- Stop when blocked, don't guess
- Never start implementation on main/master branch without explicit user consent

## Integration

**Required workflow skills:**
- **superpowers:using-git-worktrees** - REQUIRED: Set up isolated workspace before starting
- **superpowers:writing-plans** - Creates the plan this skill executes
- **superpowers:finishing-a-development-branch** - Complete development after all tasks

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Workflow Standardization
1. **Skill Announcement:** Every time you start using this skill, you MUST first announce: 
   `🚀 **SUPERPOWER ACTIVE:** spf-exec-plan`
2. **Context Independence:** Work in any project root as requested by the user. No dedicated worktree required.

### STRICT EXECUTION ONLY
1. **Execution Only:** Your sole responsibility is to carry out the steps defined in the `active_tdd_plan.md`.
2. **No Plan Modification:** You MUST NOT modify the plan itself.
3. **Optional Steps**: You MAY skip any step marked as `(optional)` if the previous step's output or the current state clearly confirms success (e.g., skipping a manual `ls` if the `mkdir` command succeeded without error).

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

### Automated Timestamping
- Every time you modify a memory file (`task_plan.md`, `active_tdd_plan.md`, `findings.md`, `progress.md`), you MUST append a horizontal rule and a timestamp at the very bottom:
  `---`
  `*Last Updated: YYYY-MM-DD HH:MM UTC*`

