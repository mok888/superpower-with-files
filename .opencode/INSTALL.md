# 🛠 OpenCode Installation Guide

Supercharge your OpenCode agent with unified persistent memory and TDD superpowers.

## 📥 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mok888/superpower-with-files.git
   ```

2. **Deploy Skills**:
   Link the unified skills to your global OpenCode directory:
   ```bash
   mkdir -p ~/.config/opencode/skills
   ln -s $(pwd)/superpower-with-files/skills/* ~/.config/opencode/skills/
   ```

3. **Verify**:
   ```bash
   opencode status
   ```

## 🚀 Usage

SPF uses a strict two-phase workflow with shorthand commands:

1. **Planning**: Use `/spf-write-plan`
   > "Create a plan for <task> and save it in .ai/"
2. **Execution**: Use `/spf-exec-plan`
   > "Execute the plan"

---
*Last Updated: 2026-03-06 04:16 UTC*

## 🎯 Usage
Once installed, your agent will follow the unified workflow. To keep your root directory clean, you can start a task with:
> "Generate a plan for <feature> and save to .ai/"
