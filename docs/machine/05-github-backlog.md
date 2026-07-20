# GitHub backlog (epics)

**Status:** Epics tracked as GitHub Issues in [`tunes-org/tunes`](https://github.com/tunes-org/tunes/issues). This file remains the canonical definition. Tag issues `repo:tunes` | `repo:tunes-ios` | `repo:tunes-web`.

Re-create epics idempotently: `./scripts/create-backlog-issues.sh`

## Epic E0 — Programme foundations (`repo:tunes`)

- Problem: Need shared charter and decisions
- Scope: Governance docs, ADR-001–012, indexes
- Non-goals: App code
- Acceptance: Reading order works; ADR-003 accepted
- Privacy/data: N/A beyond licence provisional

## Epic E1 — Schema & examples (`repo:tunes`)

- Problem: No implementable contracts
- Scope: JSON examples for section measurement, consent, tiers, flags
- Acceptance: Examples validate against representative Central line journeys
- Depends: R6, architecture public-data-model

## Epic E2 — Acoustic spike (`repo:tunes-ios`)

- Problem: Unknown controllability of iPhone audio path
- Scope: PCM, metrics, motion, clipping, export package
- Tests: Repeatability; interruption; flag correctness
- Privacy: Data stays on device

## Epic E3 — Alignment UX (`repo:tunes-ios`)

- Problem: Sections wrong without correction
- Scope: Timeline editor; confidence display
- Tests: Boundary error categories; time-to-correct
- Depends: E2, network profile stub

## Epic E4 — Privacy contribution flow (`repo:tunes-ios`, `repo:tunes-web`)

- Problem: Upload must be consensual and inspectable
- Scope: Preview, derived-only, consent, queue, delete
- Tests: Privacy matrix in [06-test-strategy.md](./06-test-strategy.md)
- Privacy: Core epic

## Epic E5 — Pipeline & releases (`repo:tunes-web`, `repo:tunes`)

- Problem: Need auditable path from upload to open data
- Scope: Inspect/verify/aggregate jobs; immutable releases
- Acceptance: Reprocess creates new version; checksums published

## Epic E6 — London pilot ops (`repo:tunes` + contributors)

- Problem: Need dense valid data before map
- Scope: Protocol, training, reference co-measurement plan
- See [07-london-pilot.md](./07-london-pilot.md)

## Epic E7 — Public map honesty (`repo:tunes-web`)

- Problem: Sparse data looks falsely precise
- Scope: Map UI gates, uncertainty, tier mix, empty states
- Acceptance: Honesty checklist pass

## Epic E8 — Community & CoC (`repo:tunes`)

- Problem: Public beta needs conduct and dispute process
- Scope: Full CoC, correction/dispute docs
- Non-goals: Gamification that encourages unsafe recording

## Issue template fields (when opening for real)

Problem · Scope · Non-goals · Acceptance · Tests · Dependencies · Research links · Privacy implications · Data-model implications · `repo:` label

## Mirrors

- `tunes-ios/docs/backlog-outline.md`
- `tunes-web/docs/tunes/backlog-outline.md`

**Recommendation:** Child tasks after schema `v0.1.0` examples land; freeze before public dataset release.

**Confidence:** Medium.

**Depends on experiment/legal/user-test?** Sequencing depends on Phase 2 results.

**Links:** [04-roadmap.md](./04-roadmap.md).
