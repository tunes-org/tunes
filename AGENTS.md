# Agent guidance

## Skills

Shared Agent Skills live in **`skills/`** (single source of truth). Tool-specific discovery dirs are symlinks:

| Tool | Path |
| --- | --- |
| Cursor | `.cursor/skills/` |
| Claude Code | `.claude/skills/` |
| Codex | `.agents/skills/` |

See [`skills/README.md`](./skills/README.md). When editing docs, apply **`tunes-docs`**. When implementing or deciding features that touch personal data, OAuth, cookies, UGC, consent/upload, location, open data, or claim language, apply **`tunes-legal-privacy`**.

## Docs

Human baseline: [`README.md`](./README.md). Briefs: [`docs/H00-start-here.md`](./docs/H00-start-here.md). Machine detail: [`docs/machine/`](./docs/machine/).
