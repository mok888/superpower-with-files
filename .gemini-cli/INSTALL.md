# ♊ Gemini CLI Installation Guide

Integrate the unified SPF (SuperPower with Files) workflow into your Gemini CLI environment.

## 📥 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mok888/superpower-with-files.git
   ```

2. **Link the Skills**:
   Use the native `gemini` command to link the unified skills:
   ```bash
   gemini skills link ./superpower-with-files/skills
   ```

3. **Verify**:
   List your active skills to confirm discovery:
   ```bash
   gemini skills list
   ```

---

## 🚀 Usage

Once linked, you can invoke the planning and execution phases using the shorthand aliases:

- **Planning**: `/spf-plan`
- **Execution**: `/spf-execute`

Example:
> "Create a plan for a Telegram bot using aiogram and save it in .ai/"

---
*Last Updated: 2026-03-06 04:13 UTC*
