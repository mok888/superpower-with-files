# superpower-with-files 🚀

The ultimate unified AI workflow. This repository merges the **persistent memory loops** of `planning-with-files` with the **high-speed TDD execution** of `superpowers`.

## 📦 Features
- **Persistent AI Memory**: AI agents never "lose their spot" thanks to Manus-style file logging.
- **Dynamic TDD Loop**: Built-in instructions for writing tests before code, debugging, and subagent collaboration.
- **Workspace Clutter Control**: All AI logs (plans, findings, progress) are automatically routed to a unified directory, keeping your project root clean.
- **Prompt-Driven Paths**: Tell the agent where to save files directly in your prompt.

---

## ⚡ Quick Start (Universal Installation)

SPF V2.2 is a **Universal Plugin**. You can install it once and use it everywhere.

### 🌟 The Bootstrap
Tell your agent (Claude, Aider, Roo Code):
> "Read and follow the installation instructions in: **`bootstrap.md`**"

---

## 🛠 Platform Support Matrix

| Platform | Recommended Setup | Shortcut |
| :--- | :--- | :--- |
| **Claude Code** | Native Plugin | `claude plugin add ...` |
| **Cursor** | `.cursorrules` | [Config](./.cursor/hooks.json) |
| **Aider / Cline** | Instruction Injection | [Guide](./bootstrap.md#2-aider--roo-code--cline) |
| **OpenCode** | Skill Link | [Install](./.opencode/INSTALL.md) |
   *(The agent will generate a concise high-level plan and detailed **Modular Task Guides** in `.superpower-with-files/guides/`.)*

4. **Phase 2: Execution**:
   Once approved, trigger the implementation using `/spf-execute` (or `/spf-exec-plan`):
   > "Execute the plan."
   *(The agent will now implement the code task-by-task, syncing its progress to **Git Pulse** automatically.)*

---

## 🛠 Platform Support

| Platform | Setup Method | Documentation |
| :--- | :--- | :--- |
| **Claude Code** | Native Plugin | [plugin.json](./.claude-plugin/plugin.json) |
| **Cursor** | Context Skills | [hooks.json](./.cursor/hooks.json) |
| **OpenCode** | Config Symlink | [INSTALL.md](./.opencode/INSTALL.md) |
| **OpenClaw** | Local/Global Skills | [INSTALL.md](./.openclaw/INSTALL.md) |
| **Codex** | Skills Discovery | [INSTALL.md](./.codex/INSTALL.md) |
| **Gemini CLI** | Skill Linking | [INSTALL.md](./.gemini-cli/INSTALL.md) |

---

## 📂 Architecture: The Unified Memory Path

By default, everything is saved to `<project-root>/.superpower-with-files/`. You can customize this path by simply **instructing the agent in your prompt**.

> [!IMPORTANT]
> **Strict Phase Separation**: The workflow is split into two distinct modes: **Planning** (thinking/designing) and **Execution** (doing/writing). The agent will not touch code until you explicitly give the "Execute" command.

### Standard Memory Files:
- `task_plan.md`: High-level phase checklist and goal tracking.
- `active_tdd_plan.md`: Granular, minute-by-minute execution steps.
- `progress.md`: Complete session log, test results, and error tracking.
- `findings.md`: Research, architectural decisions, and key constraints.

---

## ❤️ Appreciation

Special thanks to the original creators whose work made this unified workflow possible:
- **[superpowers](https://github.com/obra/superpowers)** by @obra - For the professional-grade, high-speed TDD execution framework.
- **[planning-with-files](https://github.com/OthmanAdi/planning-with-files)** by @OthmanAdi - For the ingenious Manus-style persistent memory format.

---

## 🔄 Upstream Sync Workflow

SPF tracks two upstream repositories:
- **superpowers** (obra/superpowers) - TDD execution framework
- **planning-with-files** (OthmanAdi/planning-with-files) - Persistent memory system

### Architecture

```
.spf-core/
├── vendor/                    # Raw upstream copies
│   ├── superpowers/
│   └── planning-with-files/
├── overlays/                  # Your custom modifications
│   └── superpowers/
│       ├── mod-brainstorming.md
│       └── ...
├── scripts/
│   ├── sync-upstream.sh       # Fetch latest upstreams
│   └── build_unified.sh       # Merge vendor + overlays → skills/
└── src/
    ├── hooks/                 # Custom hooks
    └── skill-templates/       # Stack templates
```

### Step-by-Step: Sync Upstreams

**Step 1: Fetch Latest Upstreams**
```bash
cd /path/to/superpower-with-files
./.spf-core/scripts/sync-upstream.sh
```
This:
1. Clones latest from `obra/superpowers` and `OthmanAdi/planning-with-files`
2. Updates `.spf-core/vendor/` with fresh copies
3. **Bumps SPF version** (patch +1, stored in `VERSION` file)
4. **Updates CHANGELOG.md** with upstream release notes
5. Runs `build_unified.sh` to re-merge with your overlays

**Step 2: Review Changes**
```bash
git diff
```
Check what changed in the unified skills and version files.

**Step 3: Commit Updates**
```bash
git add .
git commit -m "v0.1.1: sync upstream (superpowers 1.2.3, planning-with-files 2.0.1)"
git push
```

### Version Management

- **VERSION file** - Single source of truth for SPF version
- **Auto-bump** - Each sync increments patch version (e.g., 0.1.0 → 0.1.1)
- **CHANGELOG.md** - Automatically updated with:
  - SPF version and date
  - Upstream version references
  - Upstream release notes

### Dry Run (Preview Without Changes)
```bash
./.spf-core/scripts/sync-upstream.sh --dry-run
```

### How build_unified.sh Works

1. **Clean** - Removes existing `skills/`, `hooks/`, `templates/`
2. **Copy Planning-with-Files** - Base memory system
3. **Copy Superpowers** - TDD execution skills
4. **Apply Overlays** - Injects your modifications from `overlays/superpowers/*.md`
5. **Consolidate** - Renames to SPF brand (`spf-write-plan`, `spf-exec-plan`)

### Creating New Overlays

To customize an upstream skill without modifying vendor files:

```bash
# 1. Create overlay file
cat > .spf-core/overlays/superpowers/mod-my-skill.md << 'EOF'
<!-- target: skills/my-skill/SKILL.md -->
<!-- action: append -->

## Custom Section

Your additional rules here...
EOF

# 2. Rebuild
./.spf-core/scripts/build_unified.sh

# 3. Commit
git add . && git commit -m "feat: add custom overlay for my-skill"
```

**Overlay Actions:**
- `append` - Add content to end of target file
- `overwrite` - Replace target file entirely

---

## License
MIT

