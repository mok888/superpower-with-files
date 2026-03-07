# OpenCode Installation Guide

Supercharge your OpenCode agent with unified persistent memory and TDD superpowers.

---

## Option 1: Auto-Install by Agent

**Just ask the agent to install SPF:**

```
Install superpower-with-files from https://github.com/mok888/superpower-with-files
```

**Agent will:**

1. Clone SPF to `~/.spf` (or location you specify)
2. Build unified skills via `./.spf-core/scripts/build_unified.sh`
3. Symlink skills to `~/.config/opencode/skills/`
4. Copy agent instructions to current project
5. Verify installation

**Expected Agent Response:**

```
🚀 Installing superpower-with-files...

[1/5] Cloning to ~/.spf...
[2/5] Building unified skills...
  - 15 skills validated
[3/5] Linking to ~/.config/opencode/skills/...
  - spf-plan-manager ✓
  - spf-write-plan ✓
  - spf-exec-plan ✓
  - brainstorming ✓
  - test-driven-development ✓
  ... (10 more)
[4/5] Copying agent instructions...
  - .opencode/AGENTS.md ✓
[5/5] Verifying...

✅ Installation complete!

Available commands:
  /spf list              - List all plans
  /spf status <project>  - Check plan status
  /spf resume <project>  - Resume execution

Try: "show me my plans"
```

---

## Option 2: Manual Installation

### Step 1: Clone Repository

```bash
git clone https://github.com/mok888/superpower-with-files.git ~/.spf
cd ~/.spf
```

### Step 2: Build Unified Skills

```bash
./.spf-core/scripts/build_unified.sh
```

Expected output:
```
1. Clean output directories...
2. Copy planning-with-files...
3. Copy superpowers...
4. Apply overlays...
5. Rename to SPF brand...
5b. Adding SPF-specific skills...
6. Validating merged skills...
  [OK] 16 skills validated
```

### Step 3: Link Skills to OpenCode

```bash
mkdir -p ~/.config/opencode/skills

for skill in ~/.spf/skills/*/; do
  skill_name=$(basename "$skill")
  ln -s "$skill" ~/.config/opencode/skills/"$skill_name"
  echo "Linked: $skill_name"
done
```

### Step 4: Copy Agent Instructions (Per Project)

```bash
# For each project where you want SPF
cp -r ~/.spf/.opencode /path/to/your/project/
```

### Step 5: Verify

```bash
ls ~/.config/opencode/skills/
```

Should show:
```
brainstorming
dispatching-parallel-agents
executing-plans
finishing-a-development-branch
planning-with-files
receiving-code-review
requesting-code-review
spf-exec-plan
spf-plan-manager
spf-write-plan
subagent-driven-development
systematic-debugging
test-driven-development
using-git-worktrees
using-superpowers
verification-before-completion
writing-plans
writing-skills
```

---

## Option 3: Project-Local (Submodule)

For isolated, version-controlled installation:

```bash
cd /path/to/your/project

# Add as submodule
git submodule add https://github.com/mok888/superpower-with-files.git .spf

# Build
./.spf/.spf-core/scripts/build_unified.sh

# Link locally
mkdir -p .opencode/skills
ln -s ../.spf/skills/* .opencode/skills/
```

---

## Post-Installation

### Test Installation

In OpenCode, try:

```
show me my plans
```

Expected response:
```
🚀 **SUPERPOWER ACTIVE:** spf-plan-manager

No plan registry found. Creating...

Registry created at: .superpower-with-files/_registry/PLANS.md

=== SPF Plans ===

ACTIVE: (none)

Commands: /spf status <project> | /spf resume <project>
```

### Update SPF

```bash
cd ~/.spf
git pull origin master
./.spf-core/scripts/build_unified.sh
```

### Sync Upstream

```bash
cd ~/.spf
./.spf-core/scripts/sync-upstream.sh
```

---

## Troubleshooting

### Skills not appearing?

```bash
# Check symlinks
ls -la ~/.config/opencode/skills/

# Re-link
rm ~/.config/opencode/skills/*
for skill in ~/.spf/skills/*/; do
  ln -s "$skill" ~/.config/opencode/skills/
done
```

### Build fails?

```bash
# Check vendor exists
ls ~/.spf/.spf-core/vendor/

# If missing, clone upstreams manually
git clone https://github.com/obra/superpowers.git ~/.spf/.spf-core/vendor/superpowers
git clone https://github.com/OthmanAdi/planning-with-files.git ~/.spf/.spf-core/vendor/planning-with-files
```

### Agent not recognizing commands?

Ensure `.opencode/AGENTS.md` exists in your project root.

---

## File Locations

| Component   | Global Location                  | Project Location                   |
| ----------- | -------------------------------- | ---------------------------------- |
| SPF Root    | `~/.spf/`                        | `your-project/.spf/`               |
| Skills      | `~/.config/opencode/skills/`     | `your-project/.opencode/skills/`   |
| Agent Docs  | `~/.spf/.opencode/AGENTS.md`     | `your-project/.opencode/AGENTS.md` |
| Plan Registry | `~/.spf/.superpower-with-files/_registry/` | `your-project/.superpower-with-files/_registry/` |

---

## Available Commands

| Command                  | Action                          |
| ------------------------ | ------------------------------- |
| `/spf list`              | List all plans with status      |
| `/spf status <project>`  | Detailed plan status            |
| `/spf resume <project>`  | Resume execution                |
| `/spf block <project>`   | Mark as blocked                 |
| `/spf unblock <project>` | Remove blocked status           |
| `/spf complete <project>`| Mark complete                   |
| `/spf archive <project>` | Move to archive                 |

---

*Last Updated: 2025-03-07*
