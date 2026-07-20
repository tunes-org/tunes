# H12 — Measurement philosophy

TUNES measures acoustic conditions and passenger experience on ordinary railway journeys. It does not measure regulatory compliance, health risk, or a single universal property called “quietness”.

**For:** passengers, contributors, researchers, engineers, and maintainers interpreting TUNES results.

**Assumptions:** crowd measurements are survey-grade at best; the public comparison unit is a station-to-station **section** with duration `T`; objective and subjective evidence remain separate.

## What is measured

| Evidence | Examples | Meaning |
| --- | --- | --- |
| Objective acoustics | `LAeq,T`, `LCeq,T`, `LCpeak`, candidate percentiles, one-third-octave summaries | Derived descriptions of sound pressure over a stated interval; the exact percentile set remains open |
| Context | Section, direction, duration, placement, carriage position, crowding, device and processing versions | Conditions needed to compare observations honestly |
| Quality and uncertainty | Calibration state, quality tier, flags, confidence dimensions, sample count | Limits on interpretation |
| Subjective experience | Reported loudness, discomfort, sharpness, rumble, speech interference, felt child suitability | First-person perception under stated conditions |

Objective values do not determine subjective experience. A moderate equivalent level may contain a piercing event; a high equivalent level may be perceived differently according to duration, spectrum, predictability, crowding, and the passenger.

## Why “quietness” is not the inverse of noise

**Noise** can be described through physical metrics. **Quietness** is a comparative passenger judgement:

- It depends on the route alternatives and observations available.
- It includes sound character and interruption, not only average level.
- It may differ between passengers and circumstances.
- It is not evidence that a journey is safe, comfortable, or suitable for everyone.

“Quieter journey” therefore means **comparative within the dataset’s limits, with uncertainty shown**. TUNES must not convert `LAeq,T`, peaks, spectra, and perception into one unexplained score.

## Repeatability and uncertainty

Repeatability asks whether comparable conditions produce comparable results. TUNES supports it through repeated observations, stable section identifiers, explicit duration, versioned processing, device provenance, and documented exclusions.

It does not assume identical conditions. Device response, phone placement, train stock, passenger load, alignment, and operating conditions can all vary. Confidence is consequently multi-dimensional:

- acoustic level and frequency content
- device calibration and repeatability
- journey assignment and boundary timing
- placement and user metadata
- subjective-response coverage

Public summaries should report distributions, sample counts, quality-tier mix, and an explicit **insufficient evidence** state. No project-specific accuracy tolerance may be claimed before TUNES experiments establish one.

## Scientific philosophy

1. Reuse professional survey discipline without claiming professional instrument equivalence.
2. Prefer repeated, well-described observations over isolated precise-looking numbers.
3. Preserve layered metrics and provenance; do not silently correct or blend them.
4. Prefer a small valid dataset over a large misleading one.
5. Treat disagreement as information to investigate, not noise to hide.
6. Version methods and releases so published results remain reproducible.
7. State assumptions and convert disputed decisions into experiments or ADRs.

TfL R3291 is a methodology reference only. It is not TUNES data, affiliation, approval, or an open-licensed source for redistribution.

> Future work
>
> TUNES must validate device profiles, repeatability, placement effects, tier thresholds, percentile choices, and any psychoacoustic indicators through documented experiments before stronger claims are made.

## Related Documents

[What is TUNES](./H01-what-is-tunes.md) · [Quality tiers](./H06-quality-tiers.md) · [Glossary](./H10-glossary.md) · [Acoustic methodology](./machine/research/02-acoustic-methodology.md) · [Calibration and uncertainty](./machine/research/04-calibration-uncertainty.md) · [Professional practice notes](./machine/acoustic-survey-methodology.md) · [Claim language](./machine/decisions/ADR-011-claim-language.md)
