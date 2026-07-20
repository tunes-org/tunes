# Public data model

Owned by **`tunes`**. `tunes-web` produces candidates; releases are versioned artefacts of this programme.

## Layers (keep separate)

| Layer | Contents | Mutability |
| --- | --- | --- |
| L0 Contribution records | Derived metrics per section, flags, device/app versions, consent class | Immutable once released; corrections via superseding records |
| L1 Derived reprocess | Same inputs, new algorithm version | **New dataset version**, never silent overwrite |
| L2 Aggregates | Section summaries, ranges, sample counts, tier mix, time-of-day slices | Regenerable from L0/L1 with version pin |
| L3 Interpretations | Passenger-facing copy, map styles, “quieter” rankings | Explicitly labelled as interpretation; not raw science |

Objective metrics and subjective perception stay in separate fields and should not be fused into one unexplained public score.

## Required provenance fields (minimum)

- schema_version, processing_pipeline_version
- network_profile_id (e.g. london-underground@date)
- section_id, direction, duration_T
- metrics with weighting (never mix A/C/peak into one field)
- device_model, os_version, app_version
- calibration_state / tier
- quality_flags[]
- uncertainty / confidence dimensions present or explicitly null
- contribution_pseudonym or equivalent withdrawal handle (not public identity)

## Release package

- Machine-readable export (e.g. Parquet/JSON Lines) + data dictionary
- Checksums, changelog, licence, citation snippet
- Methodology pointer (docs in `tunes`)

## Map honesty contract

Public map layers must expose sample size, uncertainty, tier distribution, and caveats. Sparse sections must not be ranked as if precise.

## Recommendation

Publish L2 for the first public map; offer L0/L1 to researchers under the same open licence once anonymisation review passes.

**Confidence:** Medium until schema freeze (Phase 1).

**Depends on experiment/legal/user-test?** Legal for anonymisation; pilot for aggregate stability.

**Links:** [../research/10-open-data-reproducibility.md](../research/10-open-data-reproducibility.md); [data-flow-and-privacy-boundaries.md](./data-flow-and-privacy-boundaries.md); `tunes-web/docs/tunes/data-contracts.md`.
