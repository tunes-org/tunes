# Repository ownership and contribution routing

## Layout (accepted)

```text
tunes          → charter, governance, research, methodology, schemas, open data
tunes-ios      → iOS recorder product
tunes-web      → landing, public map, upload/pipeline jobs (Next.js starter scaffold)
```

Flow:

```text
tunes-ios  --derived uploads-->  tunes-web  --validated releases-->  tunes
tunes      --schema / methodology / licences-->  tunes-ios & tunes-web
```

## Owns / does not own

| Concern | Owner | Not owner |
| --- | --- | --- |
| Project charter, ADRs, research programme | `tunes` | ios, web |
| Open dataset releases & citation | `tunes` | ios, web (may link/host UI) |
| Capture, offline reliability, alignment UX | `tunes-ios` | tunes, web |
| Map runtime, cron/pipeline workers | `tunes-web` | tunes, ios |
| Canonical acoustic methodology | `tunes` | ios/web link only |

## Contribution routing

- Science / schema / licence / claim-language disputes → PR or ADR in **`tunes`**
- Recorder bugs / capture UX → **`tunes-ios`**
- Map / API / jobs → **`tunes-web`**
- Cross-cutting privacy → ADR in `tunes`, then implement client (`ios`) and server (`web`)

## Local paths (this machine)

- `/Users/manglekuo/dev/nextjs/tunes`
- `/Users/manglekuo/dev/nextjs/tunes-ios`
- `/Users/manglekuo/dev/nextjs/tunes-web`

Remotes and Vercel projects are **not** created in the docs wave unless explicitly requested.

## Recommendation

Do not reopen monorepo-vs-multi-repo; implement as three repos per [ADR-003](../decisions/ADR-003-multi-repo.md).

**Confidence:** High.

**Depends on experiment/legal/user-test?** No.

**Links:** [project-charter.md](./project-charter.md); sibling READMEs in `tunes-ios` and `tunes-web`.
