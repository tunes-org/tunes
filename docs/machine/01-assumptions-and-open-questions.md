# Assumptions and open questions

Separate **working assumptions**, **accepted decisions**, and **open questions**. Do not invent statistics. Prefer experiments, legal advice, or user tests where noted.

## Accepted (do not reopen casually)

| # | Decision | Where |
| --- | --- | --- |
| — | Three repos (`tunes` / `tunes-ios` / `tunes-web`) | [ADR-003](./decisions/ADR-003-multi-repo.md) |
| — | No implied TfL endorsement | Charter |
| — | Docs-first; no product feature code in this execution | Plan |

## Working assumptions (provisional)

1. **Canonical unit** = station-to-station section with duration (methodology notes + professional practice).
2. **Privacy default** = local record → review → consent → **derived-only** upload; raw audio on-device by default.
3. **Schema** = generic railway concepts; London data as instances (London-first portable schema).
4. **Quality** = tiered contributions (A–E working labels); crowd in-service data is **survey-grade at best**.
5. **Objective ≠ subjective** in the data model; no unexplained blended score.
6. **Quiet-room check ≠ calibration**.
7. **iPhone-first** scientific collector; not browser/PWA for v1 collector unless experiments prove otherwise.
8. **Prefer dense pilot coverage** over shallow network-wide mapping.

## Brief questions — Wave 2 disposition

| # | Question | Disposition |
| --- | --- | --- |
| 1 | Underground only vs all London rail? | [ADR-001](./decisions/ADR-001-initial-network-scope.md) — pilot Underground-first; launch breadth deferred |
| 2 | Tube-specific vs generic core? | [ADR-002](./decisions/ADR-002-generic-railway-schema.md) — **generic core** |
| 3 | Monorepo vs multi-repo? | [ADR-003](./decisions/ADR-003-multi-repo.md) — **three repos** |
| 4 | Raw audio leave device? | [ADR-004](./decisions/ADR-004-raw-audio-policy.md) — **default no** |
| 5 | Derived-only? | [ADR-005](./decisions/ADR-005-derived-only-default.md) — **yes** |
| 6 | Grade distinction? | [ADR-006](./decisions/ADR-006-quality-tiers.md) — tiers A–E |
| 7 | Watch / AirPods? | [ADR-007](./decisions/ADR-007-wearables-backlog.md) — experiment backlog |
| 8 | Voice Memos? | [ADR-008](./decisions/ADR-008-voice-memos-tier-d.md) — Tier D if at all |
| 9 | Manual metadata burden? | [ADR-009](./decisions/ADR-009-manual-metadata.md) — minimise |
| 10 | Subjective timing? | [ADR-010](./decisions/ADR-010-subjective-timing.md) — after journey |
| 11 | Claim language? | [ADR-011](./decisions/ADR-011-claim-language.md) — strict |
| 12 | Licences? | [ADR-012](./decisions/ADR-012-licences.md) — provisional; **legal before publish** |

## Additional open questions

- Exact retention periods and final lawful-basis wording (counsel) after ADR-013 entity path
- Whether ethics review is required before public beta campaigns (see R11 / R12; DPIA required before public recruitment)
- Duplicate / fraud detection thresholds without punishing honest edge cases
- Whether GPS is used at all underground (likely topology snap, not raw trust)

## Recommendation

Drive Wave 1 research to produce recommendations for #1–2 and #4–12; convert to ADRs in Wave 2. Keep assumptions 1–8 unless experiments falsify them.

**Confidence:** High for the separation of concerns; Low for licence and medical/claim language until legal/acoustic review.

**Depends on experiment/legal/user-test?** Yes — see table.

**Links:** [02-research-map.md](./02-research-map.md); [governance/decision-log.md](./governance/decision-log.md).
