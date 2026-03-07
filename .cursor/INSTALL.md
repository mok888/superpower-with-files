# Cursor Installation Guide

Supercharge Cursor with unified persistent memory and TDD superpowers.

---

## Option 1: Auto-Install by Agent

**Just ask Cursor to install SPF:**

```
Install superpower-with-files from https://github.com/mok888/superpower-with-files
```

**Cursor will:**

1. Clone SPF to `~/.spf` (or location you specify)
2. Build unified skills via `./.spf-core/scripts/build_unified.sh`
3. Symlink skills to `~/.cursor/skills/`
4. Copy rules to current project
5. Configure hooks
6. Verify installation

**Expected Response:**

```
🚀 Installing superpower-with-files...

[1/6] Cloning to ~/.spf...
[2/6] Building unified skills...
  - 15 skills validated
[3/6] Linking skills to ~/.cursor/skills/...
  - spf-plan-manager ✓
  - spf-write-plan ✓
  - spf-exec-plan ✓
  - brainstorming ✓
  - test-driven-development ✓
  ... (10 more)
[4/6] Copying rules to project...
[5/6] Configuring hooks...
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

### Step 3: Link Skills to Cursor

```bash
mkdir -p ~/.cursor/skills

for skill in ~/.spf/skills/*/; do
  skill_name=$(basename "$skill")
  ln -s "$skill" ~/.cursor/skills/"$skill_name"
  echo "Linked: $skill_name"
done
```

### Step 4: Copy Rules to Project

```bash
# For each project where you want SPF
mkdir -p /path/to/your/project/.cursor
cp ~/.spf/.cursor/rules /path/to/your/project/.cursor/rules
cp ~/.spf/.cursor/hooks.json /path/to/your/project/.cursor/hooks.json
```

### Step 5: Verify

```bash
ls ~/.cursor/skills/
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
mkdir -p .cursor/skills
ln -s ../.spf/skills/* .cursor/skills/
```

---

## Post-Installation

### Test Installation

In Cursor, try:

```
show me my plans
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
ls -la ~/.cursor/skills/

# Re-link
rm ~/.cursor/skills/*
for skill in ~/.spf/skills/*/; do
  ln -s "$skill" ~/.cursor/skills/
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

### Cursor not recognizing commands?

Ensure `.cursor/rules` exists in your project.

---

## File Locations

| Component     | Global Location              | Project Location                 |
| ------------- | ---------------------------- | -------------------------------- |
| SPF Root      | `~/.spf/`                    | `your-project/.spf/`             |
| Skills        | `~/.cursor/skills/`          | `your-project/.cursor/skills/`   |
| Rules         | `~/.spf/.cursor/rules`       | `your-project/.cursor/rules`     |
| Hooks         | `~/.spf/.cursor/hooks.json`  | `your-project/.cursor/hooks.json`|
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
