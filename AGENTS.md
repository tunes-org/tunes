# Agent guidance

## Skills

Shared Agent Skills live in **`skills/`** (single source of truth). Tool-specific discovery dirs are symlinks:

| Tool | Path |
| --- | --- |
| Cursor | `.cursor/skills/` |
| Claude Code | `.claude/skills/` |
| Codex | `.agents/skills/` |

See [`skills/README.md`](./skills/README.md). When editing docs, apply **`tunes-docs`**.

## Docs

Human baseline: [`README.md`](./README.md). Briefs: [`docs/H00-start-here.md`](./docs/H00-start-here.md). Machine detail: [`docs/machine/`](./docs/machine/).
