# TUNES

**Transit User Noise Experience Survey**

TUNES is an open passenger programme for measuring noise on ordinary rail journeys — starting with the London Underground — and publishing both a quieter-journey map and a versioned open dataset with an honest methodology.

It is **not** operated, approved, or endorsed by Transport for London.

---

## Why this exists

Rail noise on passenger journeys is uneven, personal, and poorly documented for people who actually ride. Professional surveys (Class 1 sound-level meters, operator programmes such as TfL practice notes) are essential for regulation and engineering — but they are infrequent, expensive, and rarely answer the everyday questions passengers care about:

- Which section of this trip is usually loudest?
- Is the quieter line quieter enough to matter for a child, or for someone who is sensory-sensitive?
- Does peak-hour loading change the experience as much as the track itself?

Those questions need **repeated, real-world observations** across times of day, carriage positions, loads, and devices — something passengers can contribute during normal commuting, not only during scheduled surveys.

TUNES exists to fill that gap **without pretending to replace professional measurement**. Crowdsourced phone recordings are survey-grade evidence with known uncertainty. The project’s job is to make that evidence usable: privacy-preserving by default, quality-tiered, versioned, and open enough that researchers, journalists, and civic groups can reuse it — and honest enough that the public map never implies engineering-grade or health “risk” scores it has not earned.

In short:

| Need | What TUNES adds |
| --- | --- |
| Passengers comparing routes | A quieter-journey / noise map built from real rides |
| Researchers / journalists / civic groups | Repeated passenger evidence + open methodology + versioned data |
| Operators / authorities | Recurring passenger pain points as **signals**, not substitutes for Class 1 surveys |

The open methodology and dataset may ultimately matter more than the map itself.

---

## What TUNES does (and does not)

**Does**

- Let passengers measure acoustic conditions on ordinary rail journeys (iPhone-first)
- Optionally collect a short perception survey after the trip (kept separate from objective metrics)
- Publish a quieter-journey / noise map that shows uncertainty and sample size
- Publish an open methodology and versioned public dataset with provenance and quality tiers

**Does not**

- Replace TfL or Class 1 professional surveys
- Imply TfL endorsement or official operator status
- Claim health risk scores or engineering-grade accuracy at foundation stage
- Silently upload raw audio or collapse everything into one unexplained “score”

---

## How the programme works (one picture)

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

Comparison is usually at **station-to-station section** level (with duration), matching the discipline of professional interior surveys rather than vague “this whole line is loud.”

Privacy default: **record locally → review → consent → upload derived features only**. Raw PCM stays on the device unless a separate, higher-bar research tier ever applies.

---

## The three repositories

TUNES is intentionally **three sibling repos**, not a monorepo. Science, capture product, and public site/pipeline change at different speeds and need clear ownership.

Assume this checkout layout:

```text
workspace/
  tunes/          ← you are here (programme + open data)
  tunes-ios/      ← recorder app
  tunes-web/      ← landing, map, pipeline
```

### 1. `tunes` (this repo) — scientific programme & open data

**Owns:** project charter, research programme, acoustic methodology, schemas, architecture decisions (ADRs), licences, and **versioned open dataset releases**.

**Does not own:** app UI, native capture, or the live map runtime.

This is the source of truth for *what we claim*, *how we measure*, and *what we publish*. Disputes about science, schema, claim language, or privacy policy land here first.

- GitHub: [github.com/tunes-org/tunes](https://github.com/tunes-org/tunes)

### 2. `tunes-ios` — passenger recorder

**Owns:** on-device capture (PCM + motion), offline reliability, local processing, station/section alignment UX, upload client, and the consent preview of what will be sent.

**Does not own:** the canonical public dataset or the project charter.

This is the product passengers use on a commute. It must work offline during collection and never surprise people about what leaves the phone.

- Sibling path: [`../tunes-ios`](../tunes-ios)
- GitHub: [github.com/tunes-org/tunes-ios](https://github.com/tunes-org/tunes-ios)

### 3. `tunes-web` — landing, map, and pipeline

**Owns:** public landing pages, the quieter-journey map UI, upload intake, and server jobs that inspect, validate, aggregate, and prepare releases.

**Does not own:** native capture, or the charter / methodology source of truth (it links to and consumes `tunes`).

This is where contributions become public artefacts — and where honesty UX (tiers, coverage, caveats) must be enforced in the product people see.

- Sibling path: [`../tunes-web`](../tunes-web)
- GitHub: [github.com/tunes-org/tunes-web](https://github.com/tunes-org/tunes-web)

### How they connect

```text
tunes-ios  --derived upload-->  tunes-web  --validated release-->  tunes
tunes      --schema / methodology / licences-->  ios + web
```

| If you are changing… | Work in |
| --- | --- |
| Charter, ADRs, research, schemas, open releases, claim language | **`tunes`** |
| Recorder bugs, capture UX, offline flow, local consent | **`tunes-ios`** |
| Map, APIs, cron/pipeline workers, landing site | **`tunes-web`** |
| Cross-cutting privacy | Decide in **`tunes`**, implement in **ios** + **web** |

---

## Pilot posture

London-first, with dense **repeated** observations preferred over shallow network-wide coverage. Underground lines with both noisy and quieter contrast sections are the working priority. The data model uses **generic railway concepts** so other cities or modes can be instances later — without baking Tube-only types into the core schema.

iPhone-first collector; Android, wearables, and external mics are later, validated expansions — not launch requirements.

---

## Principles (short)

Open · private by default · auditable · honest about uncertainty · offline-first capture · versioned for reproducibility · London-first, portable schema · resistant to false precision

---

## Docs: where to go next

This README is the human baseline. Deeper reading lives under `docs/`:

| Audience | Start |
| --- | --- |
| **Humans** (short briefs, ~15 min path) | [docs/H00-start-here.md](./docs/H00-start-here.md) |
| **Implementers / agents** (full detail, ADRs, research) | [docs/machine/README.md](./docs/machine/README.md) |
| **Doc editors** (human + machine writing standard) | [skills/tunes-docs](./skills/tunes-docs/SKILL.md) — shared via symlinks for Cursor / Claude / Codex ([skills/README.md](./skills/README.md)) |

Useful human briefs after this README:

- [H01 — What is TUNES](./docs/H01-what-is-tunes.md) — mission and claim limits
- [H02 — Repos](./docs/H02-repos.md) — ownership table
- [H04 — How it works](./docs/H04-how-it-works.md) — capture → release
- [H05 — Privacy](./docs/H05-privacy.md) — derived-only default
- [H06 — Quality tiers](./docs/H06-quality-tiers.md) — survey-grade honesty

---

## Licence

Documentation, schemas, and open data in this repo: **CC BY 4.0** (provisional — legal confirmation required before first public release; see [ADR-012](./docs/machine/decisions/ADR-012-licences.md)).
