# superpower-with-files

This repository contains the unified workflow combining the persistent memory format of `planning-with-files` with the parallel, TDD execution framework of `superpowers`.

## Features
This workflow gives you access to the advanced planning and execution capabilities of `superpowers`, but forces all the memory logs (task plans, test results, active TDD execution steps) into a clean, unified location so your project root doesn't get cluttered.

## How to Use (End Users)

This repository is designed to be completely plug-and-play. You do not need to build or compile anything. 

The `/skills`, `/hooks`, and `/templates` folders are explicitly tracked in Git and contain the fully unified logic.

1. Clone this repository.
2. Point your AI agent (Claude Code, Cursor, OpenCode, Gemini, etc.) directly at the `/skills` directory.
3. Start executing plans.

## Customizing the Memory Path

By default, the unified skills save all AI plans and test results to `<project-root>/.superpower-with-files/`. 

If you want to rename this directory (e.g., to `.ai/` or `docs/plans/`), you can do so by creating a `.env` file before linking the skills:

1. Create a `.env` file in the `superpower-with-files` root directory:
   ```bash
   CUSTOM_MEMORY_DIR=".ai"
   ```
2. If you are the maintainer, run `./scripts/build_unified.sh`. If you are an end-user, simply trigger the agent, and the skills will now dynamically read/write to your custom directory instead of `.superpower-with-files/`.

*(Note: If you download a pre-compiled version of this repo, you may need to manually execute the `sed` replacement or ask the maintainer to compile it with your preferred string.)*

## File Format

All AI actions executed via these skills will route directly to identically named files inside a `.superpower-with-files/` folder (meaning `task_plan.md`, `active_tdd_plan.md`, and `progress.md` will not clutter your repository root).
