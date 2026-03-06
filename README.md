# superpower-with-files 🚀

The ultimate unified AI workflow. This repository merges the **persistent memory loops** of `planning-with-files` with the **high-speed TDD execution** of `superpowers`.

## 📦 Features
- **Persistent AI Memory**: AI agents never "lose their spot" thanks to Manus-style file logging.
- **Dynamic TDD Loop**: Built-in instructions for writing tests before code, debugging, and subagent collaboration.
- **Workspace Clutter Control**: All AI logs (plans, findings, progress) are automatically routed to a unified directory, keeping your project root clean.
- **Prompt-Driven Paths**: Tell the agent where to save files directly in your prompt.

---

## 🚀 Quick Start (End Users)

This repository is **plug-and-play**. You do not need to build or compile anything.

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mok888/superpower-with-files.git
   ```
2. **Add Skills to your Agent**:
   Point your AI agent (Claude, Cursor, etc.) at the `/skills` folder in this repo.

3. **Start Coding**:
   ```text
   "Create a plan for <feature> and save everything in .ai/"
   ```

---

## 🛠 Platform Support

| Platform | Setup Method | Documentation |
| :--- | :--- | :--- |
| **Claude Code** | Native Plugin | [manifest.json](file:///.claude-plugin/plugin.json) |
| **Cursor** | Context Skills | [hooks.json](file:///.cursor/hooks.json) |
| **OpenCode** | Global Symlink | [INSTALL.md](file:///.opencode/INSTALL.md) |
| **OpenClaw** | Local/Global Skills | [INSTALL.md](file:///.openclaw/INSTALL.md) |
| **Gemini CLI** | Skill Linking | `gemini skills link ./skills` |

---

## 📂 Architecture: The Unified Memory Path

By default, everything is saved to `<project-root>/.superpower-with-files/`. You can customize this path by simply **instructing the agent in your prompt**.

### Standard Memory Files:
- `task_plan.md`: High-level phase checklist and goal tracking.
- `active_tdd_plan.md`: Granular, minute-by-minute execution steps.
- `progress.md`: Complete session log, test results, and error tracking.
- `findings.md`: Research, architectural decisions, and key constraints.

---

## 👩‍💻 Maintainer Notes (Repo Owner)

If you are the owner of this repository and want to sync with upstream updates from the original authors, please refer to:
👉 **[MAINTAINER.md](file:///MAINTAINER.md)**

---

## License
MIT
