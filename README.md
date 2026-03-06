# superpower-with-files

This repository contains the unified workflow combining the persistent memory format of `planning-with-files` with the parallel, TDD execution framework of `superpowers`.

## Features
This workflow gives you access to the advanced planning and execution capabilities of `superpowers`, but forces all the memory logs (task plans, test results, active TDD execution steps) into a clean, unified location so your project root doesn't get cluttered.

## How to Use (End Users)

This repository is designed to be completely plug-and-play. You do not need to build or compile anything. 

The `/skills`, `/hooks`, and `/templates` folders are explicitly tracked in Git and contain the fully unified logic.

1. Clone this repository.
2. Point your AI agent (Claude Code, Cursor, OpenCode, OpenClaw, Gemini, etc.) directly at the `/skills` directory.
3. Start executing plans.

## Customizing the Memory Path

By default, the unified skills save all AI plans and test results to `<project-root>/.superpower-with-files/`. 

If you want to use a different directory (e.g., `.ai/` or `docs/plans/`), you can simply **instruct the agent in your prompt**. 

**Example Prompt:**
> "Create a development plan for the user profile feature and save everything in the `.ai/` directory."

The agent will automatically honor your requested path for all artifacts (plans, findings, progress logs) while maintaining the unified file structure.

## File Format

All AI actions executed via these skills will route directly to identically named files inside a `.superpower-with-files/` folder (meaning `task_plan.md`, `active_tdd_plan.md`, and `progress.md` will not clutter your repository root).
