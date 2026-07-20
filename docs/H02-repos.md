# H02 — Repos

Three repos (**decided** — ADR-003). Not a monorepo.

| Repo | Owns | Does not own |
| --- | --- | --- |
| **tunes** (this) | Charter, research, methodology, schemas, open releases | App UI |
| **tunes-ios** | Recorder: capture, local process, alignment UX, upload client | Public dataset source of truth |
| **tunes-web** | Landing, map, server jobs (inspect → aggregate → release) | Native capture; charter |

## Flow

```
tunes-ios  --derived upload-->  tunes-web  --validated release-->  tunes
tunes      --schema / methodology / licences-->  ios + web
```

## Paths

| Repo | Local path |
| --- | --- |
| tunes | `/Users/manglekuo/dev/nextjs/tunes` |
| tunes-ios | `/Users/manglekuo/dev/nextjs/tunes-ios` |
| tunes-web | `/Users/manglekuo/dev/nextjs/tunes-web` (from nextjs-starter) |

## Detail

[machine/governance/repos.md](./machine/governance/repos.md) · [ADR-003](./machine/decisions/ADR-003-multi-repo.md)
