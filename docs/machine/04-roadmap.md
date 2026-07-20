# Programme roadmap (Phases 0–10)

Spans **`tunes`**, **`tunes-ios`**, **`tunes-web`**. Docs-only execution completes foundations through planning; implementation follows.

## Phase 0 — Foundations

- **Objective:** Charter, scope, repos, licences provisional, decision log, research map
- **Repos:** `tunes` governance docs; ADR-003; sibling repo stubs
- **Exit:** Shared glossary; reading order in `00-index-full.md`
- **Go/no-go:** Principles agreed; no scientific validity claims yet

## Phase 1 — Methodology & schema prototype

- **Objective:** Measurement/journey/device/privacy schema examples (JSON) for London journeys
- **Repos:** `tunes` schemas + examples; web/ios consume contract docs
- **Exit:** Validated examples; tier & flag enums frozen enough to code against
- **Risk:** Over-fitting Tube-only types — mitigated by ADR-002

## Phase 2 — Acoustic technical spike (`tunes-ios`)

- **Objective:** PCM + basic metrics + motion + clipping + local export; compare models to reference SLM
- **Exit:** Feasibility + limitation notes; experiment log (no invented lab numbers in docs — record real runs)
- **Go/no-go:** Proceed only if controllable session audio is achievable

## Phase 3 — Journey alignment prototype (`tunes-ios`)

- **Objective:** Route select + boundary suggestions + drag correction on real trips
- **Exit:** Usable correction without training; measured error categories logged

## Phase 4 — Privacy & contribution flow (`tunes-ios` + `tunes-web` intake stub)

- **Objective:** Preview, derived-only upload, consent, deletion, offline queue
- **Exit:** Threat model draft; privacy tests green

## Phase 5 — Backend & open-data pipeline (`tunes-web` → releases in `tunes`)

- **Objective:** Validate, provenance, jobs, versioning, exports
- **Exit:** Reproducible release script; checksums; methodology pages linked

## Phase 6 — London pilot

- **Objective:** Dense repeated coverage on priority Underground sections; mixed devices; some reference co-measurements
- **Exit:** Pilot report; tier gates calibrated qualitatively
- See [07-london-pilot.md](./07-london-pilot.md)

## Phase 7 — Public map prototype (`tunes-web`)

- **Objective:** Map only data meeting thresholds; honesty chrome mandatory
- **Exit:** Honesty checklist pass ([public-map-honesty.md](../../../tunes-web/docs/tunes/public-map-honesty.md))

## Phase 8 — Limited public beta

- **Objective:** Bounded communities; monitor quality, privacy, completion, confusion
- **Go/no-go:** Fix blocking UX/privacy issues before Phase 9

## Phase 9 — Public London launch

- **Exit criteria:** Limitations documented; tiers working; privacy tested; correction usable; reproducible dataset; claims reviewed; sparse data honest; no TfL endorsement implication

## Phase 10 — Expansion

Android, external mics, wearables experiments, more London rail, other cities — only after validity and demand.

## Per-repo workstreams (summary)

| Phase | tunes | tunes-ios | tunes-web |
| --- | --- | --- | --- |
| 0–1 | Charter, research, schema | Docs | Docs + scaffold |
| 2–4 | Methodology updates | Spikes & UX | Intake stubs |
| 5–7 | Releases, citation | Beta recorder | Pipeline + map |
| 8–10 | Governance, datasets | Hardening | Scale & honesty |

## Recommendation

Do not skip Phase 2–3 before map work; a pretty map on bad sections destroys trust.

**Confidence:** Medium on calendar; High on sequence.

**Depends on experiment/legal/user-test?** Yes from Phase 2 onward.

**Links:** [05-github-backlog.md](./05-github-backlog.md); [06-test-strategy.md](./06-test-strategy.md); [H07 — Roadmap](../H07-roadmap.md).
