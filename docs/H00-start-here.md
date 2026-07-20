# H00 — Start here (humans)

**TUNES** = Transit User Noise Experience Survey.

Open passenger programme for measuring noise on ordinary rail journeys — starting with the London Underground — and publishing both a quieter-journey map and a versioned open dataset with an honest methodology.

**Not** operated, approved, or endorsed by TfL.

Two doc layers:

| Layer | Prefix / folder | For | Style |
| --- | --- | --- | --- |
| **Human** | `H00`…`H19` | Reading, decisions, onboarding | Core briefs + linked topic briefs |
| **Machine** | [`machine/`](./machine/) | Implementation, tests, deep research, frequent edit | Long · detailed · linked ADRs |

## Why this exists

Professional surveys answer engineering and regulatory questions. TUNES adds repeated evidence from ordinary passenger journeys without replacing those surveys or claiming engineering-grade or health-risk authority.

Read the baseline rationale in the [README](../README.md) and the deeper scientific and civic case in [H19 — Why TUNES exists](./H19-why-tunes-exists.md).

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
| **tunes** | Charter, governance, ADRs, research, methodology, schemas, licences, claim language, open releases | App UI, live map runtime |
| **tunes-ios** | PCM/motion capture, offline local processing, alignment UX, upload client, consent preview | Canonical dataset / charter |
| **tunes-web** | Landing, map UI, upload intake, pipeline jobs | Native capture; charter / methodology source of truth |

```text
tunes-ios  --derived upload-->  tunes-web  --validated release-->  tunes
tunes      --schema / methodology / licences-->  tunes-ios + tunes-web
```

## Pilot posture

London-first; dense **repeated** observations over shallow network-wide coverage. Generic railway data model so other cities/modes can be instances later. iPhone-first; Android / wearables / external mics are later expansions.

## Core reading order (≈15 min)

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
| H11 | [Legal & governance](./H11-legal-governance.md) | Entity, legal pack, DPIA / beta gates |

## Topic briefs

Use these as references after the core path.

| # | Doc | One line |
| --- | --- | --- |
| H12 | [Measurement philosophy](./H12-measurement-philosophy.md) | What is measured; repeatability and uncertainty |
| H13 | [Public map](./H13-public-map.md) | Aggregation, confidence, colour and privacy |
| H14 | [Recorder](./H14-recorder.md) | Mobile capture, alignment, metadata and upload |
| H15 | [Railway noise taxonomy](./H15-noise-taxonomy.md) | Provisional source labels and detectability limits |
| H16 | [Schema](./H16-schema.md) | Why the data entities and relationships exist |
| H17 | [Portability](./H17-portability.md) | Generic core versus network configuration |
| H18 | [Assumptions](./H18-assumptions.md) | Working assumptions and validation needs |
| H19 | [Why TUNES exists](./H19-why-tunes-exists.md) | Philosophical and technical centre |

Also at repo root: [README](../README.md) (programme baseline and repository overview).

## Machine index

→ [`machine/00-index-full.md`](./machine/00-index-full.md) · [`machine/README.md`](./machine/README.md)
