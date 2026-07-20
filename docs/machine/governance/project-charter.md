# Project charter — TUNES

## Name and purpose

**TUNES** (Transit User Noise Experience Survey) is an open, privacy-preserving programme for passenger-generated measurement of acoustic conditions on ordinary railway journeys, plus optional structured perception reports.

It produces:

1. A passenger-facing quieter-journey / noise map tool
2. An open measurement platform, methodology, and versioned public dataset

The second may ultimately matter more than the first. TUNES does **not** replace operator or professional acoustic surveys; it adds repeated, real-world passenger evidence across times, loads, devices, and carriage positions.

## Public value

Help passengers (including parents and sensory-sensitive travellers) compare routes; help researchers and civic actors study exposure and perception; help operators and authorities see recurring passenger problems — without claiming regulatory-grade substitution for Class 1 surveys.

## Core principles

Open source · privacy-preserving · auditable · methodologically transparent · honest about uncertainty · accessible to non-specialists · useful to professionals · designed for ordinary commutes · offline-first during collection · resistant to false precision · versioned for reproducibility · expandable without premature global design.

## Geographic and technical posture

- **London-first** pilot (Underground priority; other London rail as scope decisions allow)
- **Portable schema**: generic railway concepts in the core model; London data as instances
- **iPhone-first** collector; Android / wearables / external mics as later validated expansions

## Repository ownership (decided)

Three repositories — see [repos.md](./repos.md) and [ADR-003](../decisions/ADR-003-multi-repo.md):

- `tunes` — charter, research, methodology, schemas, open releases
- `tunes-ios` — recorder
- `tunes-web` — landing, map, pipeline

## Affiliation

TUNES is independent. It is **not** operated, approved, or endorsed by Transport for London. Professional practice notes (e.g. TfL R3291 via FOI) may inform methodology as **references**, not as affiliation or redistributable data.

## What we will not claim at foundation stage

Scientific validity of the public map, health risk scores, or engineering-grade equivalence to ISO 3381 Class 1 surveys — until tiers, calibration experiments, and honesty UX are in place.

## Recommendation

Treat this charter as the binding north star for all three repos; route scientific disputes to ADRs in `tunes`.

**Confidence:** High for mission and repo split; Medium for exact initial London network breadth (open decision #1).

**Depends on experiment/legal/user-test?** Stakeholder discussion for partnerships; legal for controller roles.

**Links:** [scope-statement.md](./scope-statement.md); [repos.md](./repos.md); [../00-index-full.md](../00-index-full.md); humans [`../../H00-start-here.md`](../../H00-start-here.md).
