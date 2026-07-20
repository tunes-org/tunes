# Research map

Structured map of Wave 1 research areas. Prefer **primary sources** (standards, APIs, law, transport data, peer-reviewed methodology). Do not invent statistics.

## Programme research areas → docs

| ID | Doc | Focus | Must read | Expected decisions |
| --- | --- | --- | --- | --- |
| R1 | [research/01-citizen-science.md](./research/01-citizen-science.md) | Trust, validation, governance, motivation, fraud | Charter, this map | Moderation & reputation posture |
| R2 | [research/02-acoustic-methodology.md](./research/02-acoustic-methodology.md) | Metrics, standards applicability | **acoustic-survey-methodology.md**, charter | Metric set; claim limits |
| R3 | [research/03-consumer-device-limits.md](./research/03-consumer-device-limits.md) | iPhone limits; wearables backlog | Charter | Collector constraints; experiment list |
| R4 | [research/04-calibration-uncertainty.md](./research/04-calibration-uncertainty.md) | Calibration hierarchy; uncertainty dims | **acoustic-survey-methodology.md**, charter | Tier inputs; quiet-room rule |
| R5 | [research/05-privacy-ethics.md](./research/05-privacy-ethics.md) | Local-first; GDPR tiers | Charter | Derived-only default; raw tiers |
| R6 | [research/06-railway-journey-model.md](./research/06-railway-journey-model.md) | Generic railway schema | Charter, scope | Section unit; Tube vs generic |
| R7 | [research/07-journey-alignment.md](./research/07-journey-alignment.md) | Boundaries + correction UX | Charter, R6 | Alignment signals; UX ADR |
| R8 | [research/08-passenger-metadata.md](./research/08-passenger-metadata.md) | Minimal metadata | Charter | Required vs optional fields |
| R9 | [research/09-subjective-experience.md](./research/09-subjective-experience.md) | Perception survey | Charter | Timing; separation from objective |
| R10 | [research/10-open-data-reproducibility.md](./research/10-open-data-reproducibility.md) | Versioned releases owned by `tunes` | Charter | Release layers; changelog |
| R11 | [research/11-funding-partnerships.md](./research/11-funding-partnerships.md) | Useful-to-TfL-not-affiliated | Charter | Partnership sequencing |

## Source types by area

| Area | Prefer |
| --- | --- |
| Acoustics | ISO 3381, ISO 1996-1, IEC 61672 / 61260 / 60942; methodology notes from R3291 FOI (reference only) |
| Devices | Apple audio session docs; peer-reviewed phone SLM studies (cite, don’t invent numbers) |
| Privacy | UK GDPR / DPA 2018 guidance; ICO; research ethics frameworks |
| Citizen science | Established project handbooks (e.g. noise mapping, biodiversity) — practices, not fake success rates |
| Transport model | Open network data models; TfL open data where licence allows (operational data ≠ endorsement) |

## Acoustic methodology reuse

Agents on R2, R4, calibration architecture, pilot design, or claim language **must** read [acoustic-survey-methodology.md](./acoustic-survey-methodology.md) and treat TfL R3291 as a **methodology reference**, not redistributable data or affiliation.

## Downstream consumers

- Wave 2 architecture + ADR-001…012
- Wave 3 roadmap, backlog, pilot, risks, public docs outline
- Per-repo product docs in `tunes-ios` and `tunes-web`

## Recommendation

Execute R1–R11 as disjoint files; resolve conflicts via ADRs in `tunes`, not by silently editing peer research docs.

**Confidence:** High for map structure.

**Depends on experiment/legal/user-test?** Map itself no; many cells yes.

**Links:** [01-assumptions-and-open-questions.md](./01-assumptions-and-open-questions.md); [00-index.md](./00-index-full.md).
