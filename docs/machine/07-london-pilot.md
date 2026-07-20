# London pilot design

Must align with [acoustic-survey-methodology.md](./acoustic-survey-methodology.md): station-to-station units, layered metrics, documented exclusions, honest survey-grade labelling. R3291 is a **methodology reference**, not redistributable data or TfL affiliation.

## Goals

- Dense **repeated** observations on priority sections (not shallow network scrape)
- Multi-device variance visible
- Some co-measurements beside reference equipment
- Privacy flow rehearsed end-to-end with known contributors
- Produce a reproducible pilot release candidate in `tunes`

## Priority lines (initial)

Central, Jubilee, Victoria, Northern — useful coverage and known acoustic variety. Exact section lists chosen for operational feasibility (both directions where practical).

## Sample strategy

- Prefer **overlap**: same sections, many passes, peak and off-peak
- Vary carriage region and phone placement (logged as metadata)
- Include known noisy and quieter comparison sections when identifiable from prior public methodology literature — **without inventing dB claims**
- Exclude or flag non-representative holds (document like professional footnotes)

## Devices

- Mix of supported iPhone models
- At least one reference Class 1 SLM campaign subset for calibration hierarchy experiments
- External mic optional stretch goal — not required to start

## Contributor protocol

- Training: phone in hand, avoid handling noise, offline OK, complete alignment + privacy preview
- No unsafe behaviour for “better data”
- Derived-only upload default

## Privacy procedure

Consent script; show upload fields; local raw retention choice; withdrawal IDs issued.

## Analysis plan

- Per-section distributions by tier and time window
- Device-model bias exploration (hierarchical calibration hypothesis — do not claim success pre-evidence)
- Alignment error audit on a labelled subset
- Subjective vs objective kept separate in reports

## Success criteria (qualitative gates)

- Correction UX completable on real trips
- Privacy tests pass
- Enough repeated sections to demonstrate honesty chrome (sample size > 1 narrative)
- Written limitations published before any public map from pilot data
- No endorsement language in materials

## Recommendation

Run pilot as Phase 6 only after Phases 2–4 spikes; publish pilot dataset as clearly `pilot` labelled release.

**Confidence:** Medium (ops details TBD).

**Depends on experiment/legal/user-test?** Yes — all three.

**Links:** [04-roadmap.md](./04-roadmap.md); [08-risk-register.md](./08-risk-register.md); ADR-001.
