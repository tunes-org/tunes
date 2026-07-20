# Decision log

Template for programme-level decisions. Detailed rationale lives in ADRs under `docs/machine/decisions/`.

| ID | Date | Decision | Status | ADR |
| --- | --- | --- | --- | --- |
| D-001 | 2026-07-17 | London pilot prioritises selected Underground lines; schema stays portable | Accepted | [ADR-001](../decisions/ADR-001-initial-network-scope.md) |
| D-002 | 2026-07-17 | Generic railway core schema; London as network profile | Accepted | [ADR-002](../decisions/ADR-002-generic-railway-schema.md) |
| D-003 | 2026-07-17 | Three repositories: `tunes`, `tunes-ios`, `tunes-web` | **Accepted** | [ADR-003](../decisions/ADR-003-multi-repo.md) |
| D-004 | 2026-07-17 | Raw audio does not leave device by default | Accepted | [ADR-004](../decisions/ADR-004-raw-audio-policy.md) |
| D-005 | 2026-07-17 | Derived-only contribution default | Accepted | [ADR-005](../decisions/ADR-005-derived-only-default.md) |
| D-006 | 2026-07-17 | Quality tiers A–E (working); survey-grade honesty | Accepted | [ADR-006](../decisions/ADR-006-quality-tiers.md) |
| D-007 | 2026-07-17 | Watch/AirPods out of v1; experiment backlog | Accepted | [ADR-007](../decisions/ADR-007-wearables-backlog.md) |
| D-008 | 2026-07-17 | Voice Memos/imports Tier D if accepted; optional for v1 | Accepted | [ADR-008](../decisions/ADR-008-voice-memos-tier-d.md) |
| D-009 | 2026-07-17 | Minimise manual metadata; optional chips post-recording | Accepted | [ADR-009](../decisions/ADR-009-manual-metadata.md) |
| D-010 | 2026-07-17 | Subjective survey after journey; separate from objective | Accepted | [ADR-010](../decisions/ADR-010-subjective-timing.md) |
| D-011 | 2026-07-17 | Strict claim language; no unsupported risk/health claims | Accepted | [ADR-011](../decisions/ADR-011-claim-language.md) |
| D-012 | 2026-07-17 | Provisional MIT (code) + CC BY 4.0 (docs/data) | Accepted provisional | [ADR-012](../decisions/ADR-012-licences.md) |
| D-013 | 2026-07-20 | Named controller(s); informal → CLG by launch; CIC later optional | Accepted provisional | [ADR-013](../decisions/ADR-013-controller-and-entity.md) |
| D-SEC | 2026-07-17 | Canonical unit = station-to-station section with duration | Accepted | Architecture + R2/R6 |
| D-AFFIL | 2026-07-17 | No implied TfL endorsement | **Accepted** | Charter |

## How to add an entry

1. Write or update an ADR in `docs/machine/decisions/`
2. Add a row here: Proposed / Accepted / Superseded / Rejected
3. Link related research docs

## Brief questions — disposition

| Brief # | Disposition |
| --- | --- |
| 1 | ADR-001 (pilot Underground-first; launch breadth deferred) |
| 2 | ADR-002 |
| 3 | ADR-003 (**closed**) |
| 4–5 | ADR-004 / ADR-005 |
| 6 | ADR-006 |
| 7 | ADR-007 |
| 8 | ADR-008 |
| 9 | ADR-009 |
| 10 | ADR-010 |
| 11 | ADR-011 |
| 12 | ADR-012 (legal still required before publish) |
| 13 | ADR-013 (named pre-incorporation controller; CLG by launch) |
