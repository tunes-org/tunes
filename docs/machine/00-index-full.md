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

### Foundations

1. [governance/project-charter.md](./governance/project-charter.md)
2. [governance/scope-statement.md](./governance/scope-statement.md)
3. [governance/repos.md](./governance/repos.md)
4. [01-assumptions-and-open-questions.md](./01-assumptions-and-open-questions.md)
5. [02-research-map.md](./02-research-map.md)
6. [governance/licences.md](./governance/licences.md)
7. [governance/decision-log.md](./governance/decision-log.md)

### Research (Wave 1)

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

### Architecture (Wave 2)

- [architecture/system-overview.md](./architecture/system-overview.md)
- [architecture/data-flow-and-privacy-boundaries.md](./architecture/data-flow-and-privacy-boundaries.md)
- [architecture/calibration-and-quality-tiers.md](./architecture/calibration-and-quality-tiers.md)
- [architecture/journey-segmentation-model.md](./architecture/journey-segmentation-model.md)
- [architecture/public-data-model.md](./architecture/public-data-model.md)
- [decisions/](./decisions/) — ADR-001 … ADR-012

### Schemas (Phase 1 prototype)

- [schemas/README.md](../../schemas/README.md) — JSON Schema `v0.1.0` + validated examples

### Synthesis (Wave 3)

- [04-roadmap.md](./04-roadmap.md)
- [05-github-backlog.md](./05-github-backlog.md)
- [06-test-strategy.md](./06-test-strategy.md)
- [07-london-pilot.md](./07-london-pilot.md)
- [08-risk-register.md](./08-risk-register.md)
- [09-public-docs-outline.md](./09-public-docs-outline.md)

## Shared glossary

| Term | Meaning |
| --- | --- |
| **Section** | Canonical public comparison unit: **station-to-station** journey segment, with duration T |
| **Derived features** | Acoustic metrics / spectra computed on device or in pipeline — **default upload payload** |
| **Raw audio** | PCM waveform; **stays on device by default** (ADR-004) |
| **Quality tiers A–E** | Honest contribution grades; low tiers ≠ high on the map (ADR-006) |
| **Survey grade** | In-service crowd data is survey-grade at best — never implied engineering-grade / Class 1 |
| **Objective vs subjective** | Acoustic metrics vs perception survey; never blended into one unexplained score |
| **London-first portable schema** | Pilot Underground-first; core model uses generic railway concepts (ADR-001/002) |
| **Non-affiliation** | Not operated, approved, or endorsed by TfL |

## Consistency rules (post-Wave-1 pass)

- **Section unit** = station-to-station everywhere (research, architecture, pilot, ios alignment)
- **Privacy default** = derived-only after local review + consent
- **Tiers** = A–E working labels; map honesty required
- **Repo ownership** = science in `tunes`; capture in `tunes-ios`; map/pipeline in `tunes-web`
- **No invented statistics**; cite experiments when numbers appear later

## Source briefs (kept)

- [research-plan.md](./research-plan.md)
- [acoustic-survey-methodology.md](./acoustic-survey-methodology.md) — TfL R3291 practice notes as methodology reference only

## Sibling product docs

- [`tunes-ios/docs/00-index.md`](../../../tunes-ios/docs/00-index.md)
- [`tunes-web/docs/tunes/00-index.md`](../../../tunes-web/docs/tunes/00-index.md)

## Doc conventions

Substantive docs end with: **Recommendation**, **Confidence**, **Depends on experiment/legal/user-test?**, **Links to related docs**.
