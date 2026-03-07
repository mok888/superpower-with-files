# Codex Agent Instructions

This project uses **superpower-with-files (SPF)** for AI-assisted development.

## Plan Management Commands

| Command                  | Action                          |
| ------------------------ | ------------------------------- |
| `/spf list`              | List all plans with status      |
| `/spf status <project>`  | Detailed plan status            |
| `/spf resume <project>`  | Resume execution                |
| `/spf block <project>`   | Mark as blocked                 |
| `/spf unblock <project>` | Remove blocked status           |
| `/spf complete <project>`| Mark complete                   |
| `/spf archive <project>` | Move to archive                 |

## Usage Examples

### Example 1: List All Plans

**User:** "show me my plans"

**Agent must:**
1. Announce: `🚀 **SUPERPOWER ACTIVE:** spf-plan-manager`
2. Read `.superpower-with-files/_registry/PLANS.md`
3. Display formatted table:

```
=== SPF Plans ===

ACTIVE:
  nautilus-trader    in_progress   Phase 3/5   12/25 tasks   2h ago
  quant-bot          complete      Phase 5/5   30/30 tasks   1d ago

BLOCKED:
  legacy-api         blocked       Phase 2/4   8/20 tasks    5d ago
    └─ Reason: Waiting for API keys
```

### Example 2: Check Plan Status

**User:** "status of nautilus-trader"

**Agent must:**
1. Announce: `🚀 **SUPERPOWER ACTIVE:** spf-plan-manager`
2. Read PLANS.md
3. Read `.superpower-with-files/nautilus-trader/task_plan.md`
4. Read `.superpower-with-files/nautilus-trader/progress.md`
5. Display detailed status with phases and next tasks

### Example 3: Resume Plan

**User:** "resume nautilus-trader"

**Agent must:**
1. Announce: `🚀 **SUPERPOWER ACTIVE:** spf-plan-manager`
2. Read task_plan.md, active_tdd_plan.md, progress.md
3. Show current state
4. Invoke `spf-exec-plan` skill to continue execution

### Example 4: Block/Unblock Plan

**User:** "block legacy-api, waiting for API keys"

**Agent must:**
1. Update PLANS.md: move to BLOCKED section
2. Add reason and timestamp
3. Confirm: `✅ Plan legacy-api marked as blocked.`

**User:** "unblock legacy-api"

**Agent must:**
1. Update PLANS.md: move to ACTIVE section
2. Confirm: `✅ Plan legacy-api unblocked.`

### Example 5: Complete Plan

**User:** "quant-bot is done"

**Agent must:**
1. Update PLANS.md: move to COMPLETED section
2. Add completion timestamp
3. Confirm: `✅ Plan quant-bot marked complete.`

## Registry Location

```
.superpower-with-files/_registry/PLANS.md
```

## Status Values

- `pending` - Plan created, not started
- `in_progress` - Currently executing
- `blocked` - Cannot proceed
- `complete` - All phases done

## First-Time Setup

If PLANS.md doesn't exist:
1. Create `.superpower-with-files/_registry/`
2. Copy from `templates/PLANS.md`
3. Scan for existing projects with task_plan.md
4. Add entries for each

## Agent Checklist

For any `/spf` command:
- [ ] Announce skill activation
- [ ] Read PLANS.md (create if missing)
- [ ] Execute command
- [ ] Update PLANS.md if status changed
- [ ] Show next available command
