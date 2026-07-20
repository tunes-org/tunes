# H04 — How it works

## End-to-end

| Step | Where | What |
| --- | --- | --- |
| 1 | `tunes-ios` | Pick journey · record PCM + motion **locally** |
| 2 | `tunes-ios` | Infer station boundaries · user corrects (timeline) |
| 3 | `tunes-ios` | Preview exact upload · consent |
| 4 | `tunes-ios` → `tunes-web` | Upload **derived features** (+ metadata), not raw by default |
| 5 | `tunes-web` | Inspect · validate · quality flags · aggregate · edit |
| 6 | `tunes-web` → `tunes` | Versioned open release + methodology pages |

## Evidence and release layers (keep separate)

| Layer | Contents |
| --- | --- |
| Device-local (outside public release layers) | Raw PCM on device by default |
| L0 observations | Consented derived features, flags, provenance and separate perception answers |
| L1 reprocessing | New derived results from a named pipeline version |
| L2 aggregates | Section summaries, uncertainty, tier mix and sample size |
| L3 interpretations | Map styles, rankings and passenger-facing copy; perception remains labelled and separate from objective acoustics |

## Comparison unit

**Station-to-station section** with duration T (same discipline as professional interior surveys).

## Detail

[system overview](./machine/architecture/system-overview.md) · [data flow / privacy](./machine/architecture/data-flow-and-privacy-boundaries.md) · [public data model](./machine/architecture/public-data-model.md) · [recorder](./H14-recorder.md) · [schema](./H16-schema.md)
