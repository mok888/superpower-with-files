<!-- target: skills/systematic-debugging/SKILL.md -->
<!-- action: append -->

## Superplanner Memory Integration (Unified Extension)
**CRITICAL THEMATIC RULE:** You are working inside the `superpower-with-files` unified framework.

### Error Tracking Rule
Any and every time a root-cause hypothesis fails, you MUST immediately log the failed attempt into the `## Error Log` table in the `progress.md` file (located in the **active memory directory**, defaulting to `.superpower-with-files/`). 

Example log: `| 10:35 | API Timeout | 1 | Attempted increasing timeout to 60s (Failed) |`

You MUST do this before you are allowed to try Hypothesis #2. This ensures we never repeat the exact same failing action twice.
