# Journey segmentation model

## Canonical unit

**Station-to-station section** in a given direction, with explicit **duration T** for every equivalent-level metric. This matches professional survey practice summarised in [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md).

## Logical entities (generic railway schema)

```text
City → TransportSystem → Operator?
     → Line → Branch? → Direction
     → Station → Platform?
     → Section (from_station → to_station, direction, topology id)
     → Service / Trip instance (optional)
     → Vehicle / RollingStock (optional)
     → Carriage / position-within-train (optional metadata)
```

London Underground lines are **instances**, not hard-coded core types. Tube-specific labels live in a London network profile.

## Recording session vs sections

- A **session** is one continuous recording attempt (may span transfers if user continues — discouraged for v1 clarity).
- **Sections** are the comparable units after alignment.
- Users may delete/trim segments (e.g. standing mid-tunnel hold) analogous to survey exclusions — exclusions must be flagged.

## Alignment outputs

For each section boundary: suggested timestamp, confidence, user-confirmed flag, optional user override reason.

## Recommendation

Freeze section-as-unit for public comparison; allow multi-section sessions but require confirmed boundaries before upload.

**Confidence:** High for unit choice; Medium for automatic boundary accuracy (needs field tests).

**Depends on experiment/legal/user-test?** **Experiments + user tests** for alignment UX (`tunes-ios`).

**Links:** [../research/06-railway-journey-model.md](../research/06-railway-journey-model.md); [../research/07-journey-alignment.md](../research/07-journey-alignment.md); [../decisions/ADR-002-generic-railway-schema.md](../decisions/ADR-002-generic-railway-schema.md); [H16 — Schema](../../H16-schema.md).
