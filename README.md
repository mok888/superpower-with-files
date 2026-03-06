# superpower-with-files

This repository contains the unified workflow combining the persistent memory format of `planning-with-files` with the parallel, TDD execution framework of `superpowers`.

## Architecture Details
This repository uses a Git Submodule + Overlay Compiler architecture to ensure you can continually pull upstream changes without breaking the integration.

1. **`vendor/`**: Contains the raw, read-only submodules for both source projects.
2. **`overlays/`**: Contains our custom memory-injected Markdown instructions.
3. **`skills/`**: The auto-generated, compiled directory that you actually point your IDE toward.

## How to Use (End Users)

This repository is designed to be completely plug-and-play. You do not need to build or compile anything. 

The `/skills`, `/hooks`, and `/templates` folders are explicitly tracked in Git and contain the fully unified logic.

1. Clone this repository.
2. Point your AI agent (Claude Code, Cursor, OpenCode, Gemini, etc.) directly at the `/skills` directory.
3. Start executing plans.

## File Format

All AI actions executed via these skills will route directly to identically named files inside a `.superpower-with-files/` folder (meaning `task_plan.md`, `active_tdd_plan.md`, and `progress.md` will not clutter your repository root).
