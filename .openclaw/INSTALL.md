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
Your OpenClaw agent is now supercharged. To use the dynamic save path feature, simply prompt:
> "Let's implement <task>, using .spf/ for logs."

