# System overview

## Three-repo system

```text
┌─────────────┐     derived uploads      ┌─────────────┐     validated releases     ┌─────────────┐
│  tunes-ios  │ ───────────────────────► │  tunes-web  │ ─────────────────────────► │    tunes    │
│  recorder   │                          │ map+pipeline│                            │ open data   │
└─────────────┘ ◄── schema/methodology ──┴─────────────┴ ◄── schema/methodology ────┴─────────────┘
```

| Repo | Runtime role |
| --- | --- |
| `tunes-ios` | Capture PCM locally; sensors; section suggestions; review/consent; upload derived package |
| `tunes-web` | Intake API; inspect/test/verify/aggregate/filter/merge jobs; public map; landing |
| `tunes` | Charter, research, schema source of truth, methodology, versioned open releases |

## High-level components

1. **Collector (ios)** — offline-first scientific recorder (not a PWA for v1).
2. **Contribution package** — versioned JSON (+ optional restricted audio tier later) with provenance, quality flags, consent record.
3. **Pipeline (web)** — validate → quality gates → section association → aggregates → map layers.
4. **Open releases (tunes)** — immutable release artefacts with checksums, changelog, citation.

## Non-goals of this diagram

- Does not imply TfL systems integration or endorsement
- Does not require raw audio in the happy path

## Recommendation

Keep scientific releases in `tunes` even if `tunes-web` generates them, so app deploy cadence never silently mutates published science.

**Confidence:** High (ADR-003).

**Depends on experiment/legal/user-test?** No for topology; yes for upload payload fields.

**Links:** [data-flow-and-privacy-boundaries.md](./data-flow-and-privacy-boundaries.md); [../governance/repos.md](../governance/repos.md); [../decisions/ADR-003-multi-repo.md](../decisions/ADR-003-multi-repo.md); [H04 — How it works](../../H04-how-it-works.md).
