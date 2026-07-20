# Agent skills (single source of truth)

Canonical skill packages live under **`skills/<skill-name>/`**.

Each coding agent discovers skills from its own path. Those paths are **symlinks** into this folder — edit only here.

| Tool | Discovery path | Points to |
| --- | --- | --- |
| Cursor | `.cursor/skills/<name>` | `skills/<name>` |
| Claude Code | `.claude/skills/<name>` | `skills/<name>` |
| Codex / OpenAI agents | `.agents/skills/<name>` | `skills/<name>` |

```text
skills/
  tunes-docs/          ← edit SKILL.md + assets here
    SKILL.md
    templates.md
  tunes-legal-privacy/
    SKILL.md
    feature-gate-checklist.md

.cursor/skills/tunes-docs  → ../../skills/tunes-docs
.cursor/skills/tunes-legal-privacy → ../../skills/tunes-legal-privacy
(same pattern for .claude/skills and .agents/skills)
```

## Rules

1. **Edit** only `skills/<name>/` — never duplicate content into tool dirs.
2. **Add a skill:** create `skills/<name>/SKILL.md`, then symlink:

```bash
mkdir -p .cursor/skills .claude/skills .agents/skills
ln -sfn ../../skills/<name> .cursor/skills/<name>
ln -sfn ../../skills/<name> .claude/skills/<name>
ln -sfn ../../skills/<name> .agents/skills/<name>
```

3. Inside skills, prefer **repo-root paths** (`docs/H00-start-here.md`) over deep `../` chains so links stay valid when tools resolve symlinks.
4. Commit the symlinks (Git stores them as symlinks). On Windows, enable Developer Mode or clone with symlink support.

## Current skills

| Name | Purpose |
| --- | --- |
| [`tunes-docs`](./tunes-docs/SKILL.md) | Human + machine documentation standard |
| [`tunes-legal-privacy`](./tunes-legal-privacy/SKILL.md) | UK legal/privacy/claim gates; do/don’t for features across repos |
