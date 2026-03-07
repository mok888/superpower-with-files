# OpenClaw Instructions

This project uses **superpower-with-files (SPF)** for AI-assisted development.

## Plan Management

| Command                  | Action                          |
| ------------------------ | ------------------------------- |
| `/spf list`              | List all plans                  |
| `/spf status <project>`  | Check plan status               |
| `/spf resume <project>`  | Resume execution                |
| `/spf block <project>`   | Mark as blocked                 |
| `/spf complete <project>`| Mark complete                   |

## Examples

```
User: "show me my plans"
Agent: Lists plans from .superpower-with-files/_registry/PLANS.md

User: "resume nautilus-trader"
Agent: Loads context and invokes spf-exec-plan

User: "block legacy-api, waiting for keys"
Agent: Updates PLANS.md with blocked status
```

## Files

```
.superpower-with-files/
├── _registry/PLANS.md    # Plan index
├── {project}/
│   ├── task_plan.md      # Phases
│   └── progress.md       # Log
```

## Agent Checklist

- [ ] Announce skill activation
- [ ] Read PLANS.md
- [ ] Execute command
- [ ] Update PLANS.md if status changed
