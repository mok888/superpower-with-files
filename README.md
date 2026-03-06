# superpower-with-files

This repository contains the unified workflow combining the persistent memory format of `planning-with-files` with the parallel, TDD execution framework of `superpowers`.

## Architecture Details
This repository uses a Git Submodule + Overlay Compiler architecture to ensure you can continually pull upstream changes without breaking the integration.

1. **`vendor/`**: Contains the raw, read-only submodules for both source projects.
2. **`overlays/`**: Contains our custom memory-injected Markdown instructions.
3. **`skills/`**: The auto-generated, compiled directory that you actually point your IDE toward.

## Upstream Tracking (`.gitmodules`)
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

## How to Update
If either upstream repository receives an update (e.g., a bug fix to a specific prompt), simply run:

```bash
git submodule update --remote
./scripts/build_unified.sh
```

This will pull the latest code, automatically re-apply the `.superpower-with-files/` memory rules, and output the fresh logic into your local `/skills` directory. The `/skills`, `/hooks`, and `/templates` directories are `.gitignored` because they generate dynamically on your machine.

## File Format
All AI actions executed via these skills will route directly to identically named files inside the `.superpower-with-files/` folder (meaning `task_plan.md`, `active_tdd_plan.md`, and `progress.md` will not clutter your repository root).
