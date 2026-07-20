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

Assume all three repos are cloned as **siblings** in one workspace folder:

```text
workspace/
  tunes/          ← this repo
  tunes-ios/
  tunes-web/
```

| Repo | Relative path (from this repo root) |
| --- | --- |
| tunes | `.` |
| tunes-ios | [`../tunes-ios`](../tunes-ios) |
| tunes-web | [`../tunes-web`](../tunes-web) |

Remotes: [github.com/tunes-org/tunes](https://github.com/tunes-org/tunes) · [tunes-ios](https://github.com/tunes-org/tunes-ios) · [tunes-web](https://github.com/tunes-org/tunes-web)

## Detail

[machine/governance/repos.md](./machine/governance/repos.md) · [ADR-003](./machine/decisions/ADR-003-multi-repo.md)
