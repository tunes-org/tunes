# H07 — Roadmap

| Phase | Focus | Primary repo |
| --- | --- | --- |
| 0 | Charter, ADRs, glossary | tunes |
| 1 | Schema examples (JSON) | tunes |
| 2 | Acoustic spike (PCM, metrics, vs SLM) | ios |
| 3 | Journey alignment + correction UX | ios |
| 4 | Privacy / consent / upload preview | ios (+ web intake) |
| 5 | Pipeline, versioning, exports | web → tunes releases |
| 6 | London pilot (dense repeats) | all |
| 7 | Public map (honesty chrome) | web |
| 8 | Limited beta | all |
| 9 | Public London launch | all |
| 10 | Expansion (Android, cities…) | all — after validity |

## Do not skip

Phases **2–3** before a pretty map. Bad sections destroy trust.

## Per-repo skim

| Phase | tunes | ios | web |
| --- | --- | --- | --- |
| 0–1 | Docs / schema | Docs | Docs + scaffold |
| 2–4 | Methodology | Spikes + UX | Intake stubs |
| 5–7 | Releases | Beta recorder | Pipeline + map |
| 8–10 | Governance | Harden | Scale + honesty |

## Detail

[full roadmap](./machine/04-roadmap.md) · [backlog](./machine/05-github-backlog.md) · [tests](./machine/06-test-strategy.md)

## Phase 2+ engineering (when code starts)

| Task | When |
| --- | --- |
| Branch protection on `main` | First collaborator or before public beta — [`.github/BRANCH_PROTECTION.md`](./../.github/BRANCH_PROTECTION.md) |
| CI on `tunes-web` | `pnpm lint` / `typecheck` / `build` |
| CI on `tunes-ios` | When Xcode project exists (placeholder until Phase 2) |
| Issue / PR templates | All three repos |
| LICENSE files | Provisional per [ADR-012](./machine/decisions/ADR-012-licences.md) |
| JSON schema `v0.1.0` | [schemas/README.md](../schemas/README.md) |
