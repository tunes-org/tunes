# Test strategy

Do not invent numeric pass/fail thresholds without user or lab evidence — define **categories** and measurement plans first.

## Acoustic validity

| Area | What to test |
| --- | --- |
| Repeatability | Same device, controlled stimuli, repeated takes |
| Cross-model | Multiple iPhone models vs reference Class 1 SLM |
| Frequency | Band response differences; cases/obstruction |
| Placement | Hand / pocket / bag; orientation |
| Pathologies | Clipping, AGC/voice-processing flags, BT input |
| Signals | Continuous, tonal squeal-like, impulsive, speech presence |

Separate acceptance mindsets: research-grade absolute · model-profiled · relative route compare · informal public.

## Journey alignment

Correct section assignment; boundary timing error; branch selection; delays; transfers; late start / early stop; correction time; user correction error rate; confidence calibration.

## Reliability

Airplane mode; long journeys; low battery; lock screen; calls; audio route changes; backgrounding; crash recovery; storage pressure; duplicate/interrupted upload; schema migration.

## Privacy

No upload pre-consent; raw excluded by default; field preview accurate; deletes are real; trim not reconstructible; withdrawal; pseudonymity; location minimisation; logs scrubbed; research exports non-identifying.

## Data integrity

Schema validation; checksums; deterministic processing; algorithm versioning; reprocess → new version; provenance; idempotency; duplicates; impossible journeys; fabricated timestamps; corrupt frames.

## Usability & accessibility

Time-to-first-valid-recording; one-handed use; eyes-free during ride; correction understandability; privacy copy comprehension; Dynamic Type; non-colour-only quality cues; noisy-carriage usability.

## Public-map honesty

Sample size visible; uncertainty visible; tier differences visible; insufficient data not ranked; objective ≠ subjective; no unsupported health claims; researcher drill-down to underlying release records.

## Recommendation

Automate schema/privacy/reliability CI early; schedule acoustic and in-train UX tests as gated experiments before Phase 7.

**Confidence:** High for coverage list; Low for numeric SLOs until pilots.

**Depends on experiment/legal/user-test?** Yes.

**Links:** [04-roadmap.md](./04-roadmap.md); [07-london-pilot.md](./07-london-pilot.md).
