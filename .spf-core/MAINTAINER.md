# Maintainer Guide

> **Note:** This file is explicitly `.gitignored`. It exists only on your local machine to document how to maintain the unified repository.

As the repository owner, you are responsible for pulling improvements from the original `planning-with-files` and `superpowers` repositories without overwriting our custom memory rules. 

## The Submodule Architecture
This repository does not contain dead, copied code. The `/vendor` folder is populated by living Git submodules linked directly to their GitHub origins. 

These pointers are saved in `.gitmodules`:
```ini
[submodule "vendor/planning-with-files"]
	path = vendor/planning-with-files
	url = https://github.com/mok888/planning-with-files.git
[submodule "vendor/superpowers"]
	path = vendor/superpowers
	url = https://github.com/mok888/superpowers.git
```

## How to Update Upstream

When there is an upstream update to either repository (e.g., a bug fix to a specific prompt), follow these steps:

1. **Pull fresh code from original authors:**
```bash
git submodule update --remote
```

2. **Re-inject our custom overlays:**
```bash
./scripts/build_unified.sh
```

3. **Commit and Publish to GitHub:**
```bash
git add skills/ hooks/ templates/
git commit -m "chore: update compiled skills from upstream"
git push origin main
```

Your end users will then pull the updated `/skills` folder without ever knowing about the complex submodule compilation happening behind the scenes.
