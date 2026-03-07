# Claude Code Instructions

This project uses **superpower-with-files (SPF)** for AI-assisted development.

## Quick Start

```
/spf list                    # List all plans
/spf status <project>        # Check plan status
/spf resume <project>        # Resume a plan
```

## SPF Plan Manager Commands

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

### List Plans

**You:** "show me my plans"

**Expected response:**
```
🚀 **SUPERPOWER ACTIVE:** spf-plan-manager

=== SPF Plans ===

ACTIVE:
  nautilus-trader    in_progress   Phase 3/5   12/25 tasks   2h ago
  quant-bot          complete      Phase 5/5   30/30 tasks   1d ago

BLOCKED:
  legacy-api         blocked       Phase 2/4   8/20 tasks    5d ago
```

### Check Status

**You:** "what's the status of nautilus-trader"

**Expected response:**
```
🚀 **SUPERPOWER ACTIVE:** spf-plan-manager

=== Plan: nautilus-trader ===

Goal: Implement JWT authentication
Status: in_progress
Phase: 3/5 (Implementation)
Tasks: 12/25 complete

Phases:
  ✅ 1. Requirements & Discovery
  ✅ 2. Planning & Structure
  🔄 3. Implementation (current)
  ⬜ 4. Testing & Verification
  ⬜ 5. Delivery

Next Tasks:
  1. Add rate limiting to auth endpoints
  2. Write unit tests for token service
```

### Resume Plan

**You:** "resume nautilus-trader"

**Expected response:**
```
🚀 **SUPERPOWER ACTIVE:** spf-plan-manager

🚀 Resuming plan: nautilus-trader

Loading context from:
  - .superpower-with-files/nautilus-trader/task_plan.md
  - .superpower-with-files/nautilus-trader/active_tdd_plan.md
  - .superpower-with-files/nautilus-trader/progress.md

Invoking spf-exec-plan...
```

### Block Plan

**You:** "block legacy-api, waiting for API keys"

**Expected response:**
```
🚀 **SUPERPOWER ACTIVE:** spf-plan-manager

✅ Plan legacy-api marked as blocked.

Unblock when ready: /spf unblock legacy-api
```

## File Locations

```
.superpower-with-files/
├── _registry/
│   └── PLANS.md              # Plan index
├── {project-name}/
│   ├── task_plan.md          # High-level phases
│   ├── active_tdd_plan.md    # Granular tasks
│   ├── findings.md           # Research notes
│   └── progress.md           # Session log
└── _templates/               # Starting templates
```

## Key Skills

- `spf-plan-manager` - Track and manage plans
- `spf-write-plan` - Create implementation plan
- `spf-exec-plan` - Execute plan with TDD
- `brainstorming` - Design before coding
- `test-driven-development` - RED-GREEN-REFACTOR

## More Info

See [README.md](./README.md) for full documentation.
