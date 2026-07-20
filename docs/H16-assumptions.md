# H16 — Assumptions

This register makes the project’s scientific and product assumptions visible. An assumption is not a result: experiments, user tests, legal review, or ADRs may confirm, narrow, or replace it.

**For:** researchers, contributors, reviewers, and agents interpreting or changing TUNES.

**Assumptions:** accepted ADRs are decisions, not entries to reopen casually; unknowns remain explicit rather than receiving invented values.

## Foundational assumptions

| Area | Working assumption | Consequence |
| --- | --- | --- |
| Comparison unit | A directed station-to-station **section** with duration `T` is useful to passengers and scientifically interpretable. | Every equivalent-level result carries duration; secondary aggregates do not replace sections without an ADR. |
| Evidence grade | In-service crowd data is **survey-grade at best**. | No Class 1, engineering-grade, regulatory, or health-risk equivalence. |
| Objective and subjective | Acoustic quantities and passenger perception are related but distinct. | Separate schema objects, samples, map layers and claim language. |
| Privacy | Local record → review → consent → derived-only upload is the default. | Raw PCM stays on device; any exception needs a separate high-bar protocol. |
| Coverage | Dense repeated coverage is more informative than shallow network-wide coverage. | Pilot work prioritises repeatability and overlap. |
| Platform | An iPhone-native recorder is the first scientific collector. | Android, browser and wearables require separate validation. |
| Portability | Generic railway concepts can represent London and later networks. | Local topology and labels are versioned profiles. |

## Measurement assumptions and confounders

| Topic | Assumption or limitation | How TUNES handles it |
| --- | --- | --- |
| **Phone microphones** | Response, gain, clipping and processing vary by model, OS, route, case and obstruction. A quiet-room check is not calibration. | Store provenance and calibration state; flag processing and obstruction; run reference experiments before accuracy claims. |
| **GPS** | Underground GPS is weak or absent and must not be treated as acoustic truth. | Use route prior, topology, motion and user correction; minimise raw location storage. |
| **Occupancy** | Passenger load changes context and may change the acoustic scene, but casual occupancy reports are imprecise. | Optional coarse crowding metadata; never treat it as measured occupancy or an acoustic substitute. |
| **Train stock** | Different vehicles and carriage positions may produce different conditions; passengers may not know the stock or unit. | Keep stock and exact unit optional; use versioned network/service data where justified; do not guess. |
| **Weather** | Weather matters for exposed or professional measurements but may be irrelevant or unavailable underground. | Record only when relevant and supportable; disclose conditions rather than silently correct. |
| **Background conversation** | Continuous carriage recording may contain incidental speech and speech can alter measured conditions. | Derived-only upload, optional speech-quality flags, no public waveform or transcription by default. |
| **Tunnel acoustics** | Enclosure, curves, track and vehicle interact; a phone observation cannot isolate a single cause automatically. | Preserve spectra, context and repeated section evidence; source attribution remains provisional. |
| **Placement** | Sitting, standing, hand, pocket, bag, carriage end and bogie proximity affect observations. | Collect coarse optional metadata; demote or flag obstructed recordings; do not correct to an imagined standard position. |
| **Operating state** | Acceleration, braking, dwell, doors, holds and disruptions change the interval. | Align and annotate intervals; exclude or flag non-representative holds and walking. |
| **Measurement error** | Error is multi-dimensional rather than one universal ±dB value. | Separate absolute, relative, repeatability, device, placement, algorithmic and route-assignment confidence. |
| **Self-selection** | Contributors and optional perception reports are not a population census. | Show sample counts, distributions and collection scope; avoid population claims. |
| **Time** | Conditions may vary by time and published processing may change. | Version observations, methods, network profiles and releases; report scope and recency. |

## Assumptions that must not become silent defaults

- Missing metadata does not mean “typical”.
- Missing sections do not mean “quiet”.
- A corrected boundary does not improve microphone calibration.
- A high quality tier does not authorise raw-audio publication.
- A model-adjusted value does not overwrite the source observation.
- A perceived problem does not prove a physical source or operator fault.
- A low observed level does not establish safety or suitability.
- Open operational data does not imply operator endorsement.

## Open validation programme

> Future work
>
> The project must publish evidence for device repeatability, reference comparison, clipping onset, placement effects, interruption handling, section-alignment error, tier thresholds, aggregate stability, perception-instrument wording, and map comprehension. Exact retention periods, schema evolution policy, GPS policy, and cross-city comparability also remain unresolved or review-gated.

When evidence contradicts an assumption:

1. preserve the original observation and method version;
2. publish the experiment or source;
3. record a decision in an ADR when project behaviour changes;
4. issue a new schema, pipeline, or dataset release where interpretation changes;
5. update human summaries without rewriting historical releases.

## Related Documents

[Measurement philosophy](./H10-measurement-philosophy.md) · [Quality tiers](./H06-quality-tiers.md) · [Recorder](./H12-recorder.md) · [Portability](./H15-portability.md) · [Machine assumptions](./machine/01-assumptions-and-open-questions.md) · [Consumer device limits](./machine/research/03-consumer-device-limits.md) · [Calibration and uncertainty](./machine/research/04-calibration-uncertainty.md) · [Risk register](./machine/08-risk-register.md)
