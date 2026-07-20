# Machine docs (implementation / agents / frequent edit)

Long-form research, ADRs, architecture, backlog, tests, pilot protocol.

**Humans:** start at [`../H00-start-here.md`](../H00-start-here.md).

## Layout

| Path | Contents |
| --- | --- |
| [00-index-full.md](./00-index-full.md) | Full reading map + glossary |
| [governance/](./governance/) | Charter, scope, repos, licences, decision-log |
| [decisions/](./decisions/) | ADR-001 … ADR-012 |
| [research/](./research/) | Research programme 01–11 |
| [architecture/](./architecture/) | System, privacy boundaries, tiers, journey, public data |
| [04-roadmap.md](./04-roadmap.md) … [09-…](./09-public-docs-outline.md) | Synthesis deliverables |
| [05-github-backlog.md](./05-github-backlog.md) | Epics / issues (markdown) |
| [06-test-strategy.md](./06-test-strategy.md) | Test matrices |
| [research-plan.md](./research-plan.md) | Original brief |
| [acoustic-survey-methodology.md](./acoustic-survey-methodology.md) | TfL R3291 practice notes (reference only) |

## Edit rules

- Prefer editing **machine/** for implementation detail; keep **H\*** short — update H\* when decisions change.
- Acoustic / calibration / pilot / claims work must read `acoustic-survey-methodology.md`.
- No product feature code in this repo from docs alone.
