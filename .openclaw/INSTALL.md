# 🏗 OpenClaw Installation Guide

Bring Manus-style planning and TDD execution to your OpenClaw agents.

## 📥 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mok888/superpower-with-files.git
   ```

2. **Deploy Skills**:
   Copy or link the skills to your local or global OpenClaw directory:
   ```bash
   mkdir -p ~/.openclaw/skills
   cp -r superpower-with-files/skills/* ~/.openclaw/skills/
   ```

3. **Verify**:
   ```bash
   openclaw status
   ```

## 🎯 Usage

SPF uses a strict two-phase workflow with shorthand commands:

1. **Planning**: Use `/spf-plan`
   > "Create a plan for <task> and save it in .ai/"
2. **Execution**: Use `/spf-execute`
   > "Execute the plan"

*(Note: You can also use `.superpower-with-files/` as your default log directory.)*

---
*Last Updated: 2026-03-06 04:16 UTC*

