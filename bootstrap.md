# 🚀 SPF Universal Bootstrap

This is the single entry point to install **Superpower-with-Files (SPF)** into any AI coding agent.

## 📥 Instant Installation

Select your platform and run the corresponding command:

### 1. Claude Code (Recommended)
```bash
/plugin add https://github.com/mok888/superpower-with-files
```

### 2. Aider / Roo Code / Cline
Add this line to your project's `.clinerules`, `.roomodes`, or Aider's read-only files:
```
Follow instructions from: https://github.com/mok888/superpower-with-files/blob/master/skills/using-superpowers/SKILL.md
```

### 3. OpenCode / OpenClaw
```bash
curl -sSL https://raw.githubusercontent.com/mok888/superpower-with-files/master/.opencode/INSTALL.md | bash
```

### 4. Cursor
Add **`.cursorrules`** to your root and paste the contents of: [hooks.json](file:///.cursor/hooks.json).

---

## 🏗️ Architecture

SPF is built as a **Universal Skill Library**. 

- **Planning Engine**: [spf-write-plan](file:///skills/spf-write-plan/SKILL.md)
- **Execution Driver**: [spf-exec-plan](file:///skills/spf-exec-plan/SKILL.md)
- **Context Management**: [Context Hygiene & Handoff](file:///overlays/superpowers/mod-executing-plans.md)

## 🤝 Plugin Interoperability
SPF is 100% compatible with **Superpowers (Superstorm)**. It extends the core superpowers with persistent file-based memory and multi-agent coordination.
