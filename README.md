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

3. **Phase 1: Planning**:
   Ask for a plan using the shorthand `/spf-plan` (or `/writing-plans`):
   > "Create a plan for the <feature> and save it in .ai/"
   *(The agent will write the plan and stop.)*

4. **Phase 2: Execution**:
   Once approved, trigger the implementation using `/spf-execute` (or `/executing-plans`):
   > "Execute the plan."
   *(The agent will now implement the code task-by-task.)*

---

## 🛠 Platform Support

| Platform | Setup Method | Documentation |
| :--- | :--- | :--- |
| **Claude Code** | Native Plugin | [manifest.json](file:///.claude-plugin/plugin.json) |

| **Cursor** | Context Skills | [hooks.json](file:///.cursor/hooks.json) |
| **OpenCode** | Config Symlink | [INSTALL.md](file:///.opencode/INSTALL.md) |
| **OpenClaw** | Local/Global Skills | [INSTALL.md](file:///.openclaw/INSTALL.md) |
| **Codex** | Skills Discovery | [INSTALL.md](file:///.codex/INSTALL.md) |
| **Gemini CLI** | Skill Linking | `gemini skills link ./skills` |

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

## License
MIT

