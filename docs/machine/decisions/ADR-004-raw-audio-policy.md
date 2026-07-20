# ADR-004: Raw audio leaves the device?

- **Status:** Accepted (default policy)
- **Date:** 2026-07-17

## Context

Open question #4. Raw PCM enables re-analysis but creates incidental speech and storage risk.

## Decision

- **Default:** Raw audio **does not** leave the device.
- **Optional future tier:** Short excerpts or full raw only under separate explicit consent, research-restricted retention, and ADR update — not in v1 happy path.
- Users can delete local raw after derived upload.

## Consequences

Server-side reprocessing of waveforms is unavailable for default contributions; improve on-device feature extraction and version derived pipelines instead.

**Links:** [ADR-005](./ADR-005-derived-only-default.md); [../architecture/data-flow-and-privacy-boundaries.md](../architecture/data-flow-and-privacy-boundaries.md).
