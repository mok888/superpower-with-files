# 🛠 Codex Installation Guide

Integrate the unified `superpower-with-files` workflow directly into your Codex environment.

## 📥 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mok888/superpower-with-files.git ~/.codex/superpower-with-files
   ```

2. **Deploy Skills**:
   Link the unified skills to your Codex discovery directory:
   ```bash
   mkdir -p ~/.agents/skills
   ln -s ~/.codex/superpower-with-files/skills ~/.agents/skills/superpower-with-files
   ```

3. **Verify**:
   ```bash
   codex skills list
   ```

## 🎯 Usage

SPF uses a strict two-phase workflow with shorthand commands:

1. **Planning**: Use `/spf-write-plan`
   > "Create a plan for <task> and save it in .ai/"
2. **Execution**: Use `/spf-exec-plan`
   > "Execute the plan"

---
*Last Updated: 2026-03-06 04:16 UTC*
