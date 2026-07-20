# H02 — Repos

Three repos (**decided** — ADR-003). Not a monorepo.

| Repo | Owns | Does not own |
| --- | --- | --- |
| **tunes** (this) | Charter, governance, ADRs, research, methodology, schemas, licences, claim language, open releases | App UI; live map runtime |
| **tunes-ios** | Recorder: PCM/motion capture, offline local processing, alignment UX, upload client, consent preview | Public dataset source of truth; charter |
| **tunes-web** | Landing, map, upload intake, server jobs (inspect → aggregate → prepare releases) | Native capture; charter and methodology source of truth |

## Flow

```
tunes-ios  --derived upload-->  tunes-web  --validated release-->  tunes
tunes      --schema / methodology / licences-->  tunes-ios + tunes-web
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
| tunes-ios | [`../tunes-ios`](../../tunes-ios) |
| tunes-web | [`../tunes-web`](../../tunes-web) |

Remotes: [github.com/tunes-org/tunes](https://github.com/tunes-org/tunes) · [tunes-ios](https://github.com/tunes-org/tunes-ios) · [tunes-web](https://github.com/tunes-org/tunes-web)

## Detail

[machine/governance/repos.md](./machine/governance/repos.md) · [ADR-003](./machine/decisions/ADR-003-multi-repo.md)
