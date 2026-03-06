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
   mkdir -p ~/.opencode/skills
   ln -s $(pwd)/superpower-with-files/skills/* ~/.opencode/skills/
   ```

3. **Verify**:
   Restart your OpenCode session. Your agent will now automatically detect the new skills.

## 🎯 Usage
Once installed, your agent will follow the unified workflow. To keep your root directory clean, you can start a task with:
> "Generate a plan for <feature> and save to .ai/"

