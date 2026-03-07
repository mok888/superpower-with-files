# OpenCode Instructions

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

## Usage Examples

### List Plans
**User:** "show me my plans"
**Agent:** Reads `.superpower-with-files/_registry/PLANS.md` and displays formatted table.

### Check Status
**User:** "status of nautilus-trader"
**Agent:** Reads task_plan.md + progress.md, shows phases and next tasks.

### Resume Plan
**User:** "resume nautilus-trader"
**Agent:** Loads context, invokes `spf-exec-plan` skill.

### Block Plan
**User:** "block legacy-api, waiting for API keys"
**Agent:** Updates PLANS.md, moves to BLOCKED section.

## Registry Location

```
.superpower-with-files/_registry/PLANS.md
```

## Status Values

- `pending` - Not started
- `in_progress` - Executing
- `blocked` - Waiting for external input
- `complete` - Done

## Agent Behavior

For any `/spf` command:
1. Announce: `🚀 **SUPERPOWER ACTIVE:** spf-plan-manager`
2. Read/create PLANS.md
3. Execute command
4. Update PLANS.md if needed
5. Show next command

See [README.md](./README.md) for full documentation.
