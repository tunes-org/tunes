# H00 — Start here (humans)

**TUNES** = Transit User Noise Experience Survey.

Open passenger programme for measuring noise on ordinary rail journeys — starting with the London Underground — and publishing both a quieter-journey map and a versioned open dataset with an honest methodology.

**Not** operated, approved, or endorsed by TfL.

Two doc layers:

| Layer | Prefix / folder | For | Style |
| --- | --- | --- | --- |
| **Human** | `H00`…`H10` | Reading, decisions, onboarding | Short · bullets · tables |
| **Machine** | [`machine/`](./machine/) | Implementation, tests, deep research, frequent edit | Long · detailed · linked ADRs |

## Why this exists

Professional Class 1 / operator surveys are essential for regulation and engineering — but infrequent, expensive, and rarely answer everyday passenger questions (loudest section, whether “quieter” matters for a child or sensory-sensitive rider, peak-hour vs track). Those need **repeated, real-world observations** during normal commuting.

TUNES fills that gap **without replacing professional measurement**. Phone recordings are survey-grade with known uncertainty. The job: privacy-preserving by default, quality-tiered, versioned, open — and honest enough that the map never implies engineering-grade or health “risk” scores it has not earned.

| Need | What TUNES adds |
| --- | --- |
| Passengers comparing routes | Quieter-journey / noise map from real rides |
| Researchers / journalists / civic groups | Repeated evidence + open methodology + versioned data |
| Operators / authorities | Recurring passenger pain points as **signals**, not Class 1 substitutes |

The open methodology and dataset may ultimately matter more than the map itself.

## What TUNES does (and does not)

**Does:** iPhone-first journey measurement · optional perception survey (kept separate) · map with uncertainty/sample size · open methodology + versioned dataset with provenance and quality tiers.

**Does not:** replace TfL / Class 1 surveys · imply TfL endorsement · claim health risk or engineering-grade accuracy at foundation · silently upload raw audio or collapse into one unexplained “score”.

## How the programme works

```text
Passenger records on iPhone
        ↓
Local processing + journey alignment (user reviews sections)
        ↓
Consent screen shows exactly what will leave the device
        ↓
Derived metrics upload (raw audio stays on device by default)
        ↓
Server inspect → validate → quality-flag → aggregate
        ↓
Versioned open release + public map
```

Comparison is usually **station-to-station section** + duration. Privacy default: **record locally → review → consent → upload derived features only**.

## The three repositories

Not a monorepo — science, capture, and public site change at different speeds.

```text
workspace/
  tunes/          ← you are here (programme + open data)
  tunes-ios/      ← recorder app
  tunes-web/      ← landing, map, pipeline
```

| Repo | Owns | Does not own |
| --- | --- | --- |
| **tunes** | Charter, ADRs, methodology, schemas, open releases | App UI, live map runtime |
| **tunes-ios** | Capture, offline, local process, alignment UX, consent preview | Canonical dataset / charter |
| **tunes-web** | Landing, map UI, upload intake, pipeline jobs | Native capture; methodology source of truth |

```text
tunes-ios  --derived upload-->  tunes-web  --validated release-->  tunes
tunes      --schema / methodology / licences-->  ios + web
```

## Pilot posture

London-first; dense **repeated** observations over shallow network-wide coverage. Generic railway data model so other cities/modes can be instances later. iPhone-first; Android / wearables / external mics are later expansions.

## Read in order (≈15 min)

| # | Doc | One line |
| --- | --- | --- |
| H01 | [What is TUNES](./H01-what-is-tunes.md) | Mission + what we will / won’t claim |
| H02 | [Repos](./H02-repos.md) | `tunes` · `tunes-ios` · `tunes-web` |
| H03 | [Decisions](./H03-decisions.md) | Accepted ADRs at a glance |
| H04 | [How it works](./H04-how-it-works.md) | Capture → review → pipeline → open data |
| H05 | [Privacy](./H05-privacy.md) | Derived-only default; raw stays on device |
| H06 | [Quality](./H06-quality-tiers.md) | Tiers A–E · survey-grade honesty |
| H07 | [Roadmap](./H07-roadmap.md) | Phases 0–10 |
| H08 | [Pilot](./H08-pilot.md) | London Underground-first |
| H09 | [Risks](./H09-risks.md) | Top risks only |
| H10 | [Glossary](./H10-glossary.md) | Shared terms |

Also at repo root: [README](../README.md) (same baseline story).

## Machine index

→ [`machine/00-index-full.md`](./machine/00-index-full.md) · [`machine/README.md`](./machine/README.md)
