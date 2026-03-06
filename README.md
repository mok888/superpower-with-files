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

## Repository Workflows

This repository is designed with two distinct workflows in mind:

### 1. The Maintainer Workflow (Updating Upstream)
As the repository owner, you are responsible for pulling improvements from the original `planning-with-files` and `superpowers` repositories without overwriting our custom memory rules. 

When there is an upstream update, run:
```bash
git submodule update --remote      # Pull fresh code from original authors
./scripts/build_unified.sh         # Re-inject our custom overlays 
git add . && git commit -m "update skills"
git push origin main               # Push the natively compiled skills to Github
```

### 2. The End-User Workflow (Cloning & Using)
End users **do not** need to touch submodules or run bash scripts! The `/skills`, `/hooks`, and `/templates` folders are explicitly tracked in Git.

If you are an end-user, simply clone this repository and immediately point your AI agent (Claude Code, Cursor, OpenCode, etc.) at the `/skills` directory. It is totally plug-and-play.
