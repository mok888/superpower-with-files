# Claude Code Installation Guide

Supercharge Claude Code with unified persistent memory and TDD superpowers.

---

## Option 1: Auto-Install by Agent

**Just ask Claude Code to install SPF:**

```
Install superpower-with-files from https://github.com/mok888/superpower-with-files
```

**Claude will:**

1. Clone SPF to `~/.spf` (or location you specify)
2. Build unified skills via `./.spf-core/scripts/build_unified.sh`
3. Symlink skills to `~/.claude/skills/`
4. Install plugin to `~/.claude/plugins/`
5. Copy CLAUDE.md to current project
6. Verify installation

**Expected Response:**

```
🚀 Installing superpower-with-files...

[1/6] Cloning to ~/.spf...
[2/6] Building unified skills...
  - 15 skills validated
[3/6] Linking skills to ~/.claude/skills/...
  - spf-plan-manager ✓
  - spf-write-plan ✓
  - spf-exec-plan ✓
  - brainstorming ✓
  - test-driven-development ✓
  ... (10 more)
[4/6] Installing plugin to ~/.claude/plugins/...
[5/6] Copying CLAUDE.md to project...
[6/6] Verifying...

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

### Step 3: Link Skills to Claude Code

```bash
mkdir -p ~/.claude/skills

for skill in ~/.spf/skills/*/; do
  skill_name=$(basename "$skill")
  ln -s "$skill" ~/.claude/skills/"$skill_name"
  echo "Linked: $skill_name"
done
```

### Step 4: Install Plugin (Optional)

```bash
mkdir -p ~/.claude/plugins
ln -s ~/.spf/.claude-plugin ~/.claude/plugins/spf
```

### Step 5: Copy CLAUDE.md to Project

```bash
# For each project where you want SPF
cp ~/.spf/.claude/CLAUDE.md /path/to/your/project/.claude/CLAUDE.md
```

### Step 6: Verify

```bash
ls ~/.claude/skills/
```

Should show 16+ skills including `spf-plan-manager`, `spf-write-plan`, `spf-exec-plan`.

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
mkdir -p .claude/skills
ln -s ../.spf/skills/* .claude/skills/
```

---

## Post-Installation

### Test Installation

In Claude Code, try:

```
show me my plans
```

### Use Skills

```
@brainstorming design the authentication system
@spf-write-plan create implementation plan
@spf-exec-plan execute the plan
@test-driven-development implement with tests
```

### Update SPF

```bash
cd ~/.spf
git pull origin master
./.spf-core/scripts/build_unified.sh
```

---

## Troubleshooting

### Skills not appearing?

```bash
# Check symlinks
ls -la ~/.claude/skills/

# Re-link
rm ~/.claude/skills/*
for skill in ~/.spf/skills/*/; do
  ln -s "$skill" ~/.claude/skills/
done
```

### Build fails?

```bash
# Check vendor exists
ls ~/.spf/.spf-core/vendor/

# If missing, clone upstreams
git clone https://github.com/obra/superpowers.git ~/.spf/.spf-core/vendor/superpowers
git clone https://github.com/OthmanAdi/planning-with-files.git ~/.spf/.spf-core/vendor/planning-with-files
```

### Claude not recognizing commands?

Ensure `.claude/CLAUDE.md` exists in your project root.

---

## File Locations

| Component     | Global Location              | Project Location                 |
| ------------- | ---------------------------- | -------------------------------- |
| SPF Root      | `~/.spf/`                    | `your-project/.spf/`             |
| Skills        | `~/.claude/skills/`          | `your-project/.claude/skills/`   |
| Plugin        | `~/.claude/plugins/spf`      | N/A                              |
| Agent Docs    | `~/.spf/.claude/CLAUDE.md`   | `your-project/.claude/CLAUDE.md` |
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
