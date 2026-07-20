# Data flow and privacy boundaries

## Happy path (default)

1. User records on device (`tunes-ios`) — PCM + motion stay local
2. On-device / local processing extracts **derived acoustic features** per candidate section
3. App suggests station-to-station boundaries; user corrects
4. User trims/deletes; sees **exact upload preview**
5. Explicit consent → upload derived package to `tunes-web`
6. Pipeline validates, flags, aggregates
7. Periodic **dataset release** published under `tunes` with new version IDs

## Trust boundaries

| Zone | Allowed data | Notes |
| --- | --- | --- |
| Device private | Raw PCM, full traces, drafts | User-controlled deletion |
| Upload (default) | Derived metrics, spectra summaries, section IDs, device model/OS, app+pipeline versions, quality flags, optional subjective answers, consent metadata | No raw waveform |
| Pipeline internal | Upload + server-side reprocessing artefacts | Access-controlled |
| Public release | Aggregates and/or record-level derived data per licence & anonymisation rules | No contributor identity; minimise free text |
| Research-restricted (optional future) | May include short excerpts or raw under separate consent | Not the default product path |

## Defaults locked for architecture

- Prefer **derived over raw**
- Nothing leaves device before consent
- Reprocessing creates a **new derived dataset version**
- Objective metrics and subjective responses remain separate fields/layers

## Threat themes (for later formal threat model)

- Incidental speech in raw audio
- Precise location trajectories
- Free-text deanonymisation
- Server logs retaining payloads
- Malicious fabricated journeys

## Recommendation

Ship v1 with derived-only uploads; treat any raw/excerpt path as a separate ADR-gated tier with stronger consent and retention limits.

**Confidence:** High for default; Medium for research-restricted tier design (needs legal).

**Depends on experiment/legal/user-test?** Legal + privacy threat model before public beta.

**Links:** [../research/05-privacy-ethics.md](../research/05-privacy-ethics.md); `[privacy-client-flow.md](../../../../tunes-ios/docs/privacy-client-flow.md)`; [../decisions/ADR-005-derived-only-default.md](../decisions/ADR-005-derived-only-default.md).
