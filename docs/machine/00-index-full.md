# TUNES documentation index (machine / full)

> **Humans:** use the short prefixed briefs → [`../H00-start-here.md`](../H00-start-here.md).  
> This file is the **full** map for implementation, research, and agents.

**TUNES** — Transit User Noise Experience Survey. Passenger-generated railway noise measurements and experience, starting with London, designed for a portable schema.

This repo (`tunes`) owns the **scientific programme**: charter, governance, methodology, research, schemas/contracts as docs, network definitions as data, and open dataset releases. App UI lives elsewhere.

## Three repositories

| Repo | Path (from `tunes` root) | Owns |
| --- | --- | --- |
| **tunes** | `.` | Charter, research, methodology, open data, schema docs |
| **tunes-ios** | [`../tunes-ios`](../../../tunes-ios) | iOS recorder product docs (and later code) |
| **tunes-web** | [`../tunes-web`](../../../tunes-web) | Landing, map, pipeline docs (and later code) |

See [governance/repos.md](./governance/repos.md). Multi-repo is **accepted** ([ADR-003](./decisions/ADR-003-multi-repo.md)).

## Reading order

### Agents and contributors

1. [CONTRIBUTING.md](./CONTRIBUTING.md)
2. [TUNES documentation skill](../../skills/tunes-docs/SKILL.md)
3. [Legal/privacy skill](../../skills/tunes-legal-privacy/SKILL.md) when the change touches personal data, consent, location, open releases, or claims

### Foundations

1. [governance/project-charter.md](./governance/project-charter.md)
2. [governance/scope-statement.md](./governance/scope-statement.md)
3. [governance/repos.md](./governance/repos.md)
4. [01-assumptions-and-open-questions.md](./01-assumptions-and-open-questions.md)
5. [02-research-map.md](./02-research-map.md)
6. [governance/licences.md](./governance/licences.md)
7. [governance/decision-log.md](./governance/decision-log.md)

### Research rationale (historical recommendations)

Accepted ADRs and current architecture are binding where later documents differ from these research notes.

1. [research/01-citizen-science.md](./research/01-citizen-science.md)
2. [research/02-acoustic-methodology.md](./research/02-acoustic-methodology.md) — read with [acoustic-survey-methodology.md](./acoustic-survey-methodology.md)
3. [research/03-consumer-device-limits.md](./research/03-consumer-device-limits.md)
4. [research/04-calibration-uncertainty.md](./research/04-calibration-uncertainty.md) — read with methodology notes
5. [research/05-privacy-ethics.md](./research/05-privacy-ethics.md)
6. [research/06-railway-journey-model.md](./research/06-railway-journey-model.md)
7. [research/07-journey-alignment.md](./research/07-journey-alignment.md)
8. [research/08-passenger-metadata.md](./research/08-passenger-metadata.md)
9. [research/09-subjective-experience.md](./research/09-subjective-experience.md)
10. [research/10-open-data-reproducibility.md](./research/10-open-data-reproducibility.md)
11. [research/11-funding-partnerships.md](./research/11-funding-partnerships.md)
12. [research/12-uk-legal-governance-dp.md](./research/12-uk-legal-governance-dp.md) — entity, legal pack, GDPR/OSA gates

### Governance legal pack

- [governance/legal/README.md](./governance/legal/README.md) — canonical privacy/terms/moderation/cookies/takedown/ownership drafts
- [governance/legal/consumers/](./governance/legal/consumers/) — ready-to-copy web + ios consumer copy

### Current architecture

- [architecture/system-overview.md](./architecture/system-overview.md)
- [architecture/data-flow-and-privacy-boundaries.md](./architecture/data-flow-and-privacy-boundaries.md)
- [architecture/calibration-and-quality-tiers.md](./architecture/calibration-and-quality-tiers.md)
- [architecture/journey-segmentation-model.md](./architecture/journey-segmentation-model.md)
- [architecture/public-data-model.md](./architecture/public-data-model.md)
- [decisions/](./decisions/) — ADR-001 … ADR-013

### Schemas (Phase 1 prototype)

- [schemas/README.md](../../schemas/README.md) — JSON Schema `v0.1.0` + validated examples

### Synthesis (Wave 3)

- [04-roadmap.md](./04-roadmap.md)
- [05-github-backlog.md](./05-github-backlog.md)
- [06-test-strategy.md](./06-test-strategy.md)
- [07-london-pilot.md](./07-london-pilot.md)
- [08-risk-register.md](./08-risk-register.md)
- [09-public-docs-outline.md](./09-public-docs-outline.md)

### Human topic briefs

- [H12 — Measurement philosophy](../H12-measurement-philosophy.md)
- [H13 — Public map](../H13-public-map.md)
- [H14 — Recorder](../H14-recorder.md)
- [H15 — Railway noise taxonomy](../H15-noise-taxonomy.md)
- [H16 — Schema](../H16-schema.md)
- [H17 — Portability](../H17-portability.md)
- [H18 — Assumptions](../H18-assumptions.md)
- [H19 — Why TUNES exists](../H19-why-tunes-exists.md)

## Shared glossary

The canonical short definitions live in [H10 — Glossary](../H10-glossary.md). Implementation vocabulary is defined by the linked schema, architecture, research, and ADR sources; do not maintain a second glossary here.

## Consistency rules (post-Wave-1 pass)

- **Section unit** = station-to-station everywhere (research, architecture, pilot, ios alignment)
- **Privacy default** = derived-only after local review + consent
- **Tiers** = accepted A–E quality grades; map honesty required
- **Repo ownership** = science in `tunes`; capture in `tunes-ios`; map/pipeline in `tunes-web`
- **No invented statistics**; cite experiments when numbers appear later

## Source briefs (kept)

- [research-plan.md](./research-plan.md) — original execution brief; later ADRs and architecture are canonical where they differ
- [acoustic-survey-methodology.md](./acoustic-survey-methodology.md) — TfL R3291 practice notes as methodology reference only

## Sibling product docs

- [`tunes-ios/docs/00-index.md`](../../../tunes-ios/docs/00-index.md)
- [`tunes-web/docs/tunes/00-index.md`](../../../tunes-web/docs/tunes/00-index.md)

## Doc conventions

Substantive docs end with: **Recommendation**, **Confidence**, **Depends on experiment/legal/user-test?**, **Links to related docs**.
