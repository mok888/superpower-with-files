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
   ls -la ~/.agents/skills/superpower-with-files
   ```

## 🎯 Usage
Once installed, Codex will automatically detect and use these skills. To keep your project workspace clean, start your tasks with:
> "Plan the next steps for <feature> and save to .ai/"
