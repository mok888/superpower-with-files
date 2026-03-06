# INSTALL superpower-with-files (OpenCode)

To install these unified skills into your OpenCode environment:

1. Clone this repository:
   ```bash
   git clone https://github.com/mok888/superpower-with-files.git
   ```
2. Symlink the skills to your global OpenCode directory:
   ```bash
   mkdir -p ~/.opencode/skills
   ln -s $(pwd)/superpower-with-files/skills/* ~/.opencode/skills/
   ```
3. Your agent will now automatically use the unified persistent memory and TDD workflows.
