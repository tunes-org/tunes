# H04 — How it works

## End-to-end

| Step | Where | What |
| --- | --- | --- |
| 1 | ios | Pick journey · record PCM + motion **locally** |
| 2 | ios | Infer station boundaries · user corrects (timeline) |
| 3 | ios | Preview exact upload · consent |
| 4 | ios → web | Upload **derived** metrics (+ metadata), not raw by default |
| 5 | web | Inspect · validate · quality flags · aggregate · edit |
| 6 | web → tunes | Versioned open release + methodology pages |

## Layers (keep separate)

| Layer | Contents |
| --- | --- |
| Raw | PCM on device (default) |
| Derived | Metrics, spectra, flags, provenance |
| Public map | Aggregates + uncertainty + sample size |
| Subjective | Perception answers — **never** blended into one unexplained score |

## Comparison unit

**Station-to-station section** with duration T (same discipline as professional interior surveys).

## Detail

[system overview](./machine/architecture/system-overview.md) · [data flow / privacy](./machine/architecture/data-flow-and-privacy-boundaries.md) · [public data model](./machine/architecture/public-data-model.md)
