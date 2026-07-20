# Calibration and quality tiers

Informed by [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md): professional surveys use Class 1 instruments, pre/post calibration, fixed positions, station-to-station reporting, and layered metrics. Crowdsourced phone data is **survey-grade at best** and must be labelled accordingly.

## Calibration hierarchy

| Level | Description | Typical use |
| --- | --- | --- |
| 0 | Unknown consumer device | Informal only |
| 1 | Known model, no project profile | Tier C candidate |
| 2 | Model profile from controlled experiments | Tier B |
| 3 | Individual field offset vs reference | Tier B or Tier A eligibility under the documented protocol |
| 4 | External calibrated microphone | Tier A candidate |
| 5 | Professional SLM survey protocol | Tier A / reference campaigns |

**Quiet-room / noise-floor check** may detect obstruction or malfunction; it is **not** calibration.

## Quality tiers (accepted working labels)

| Tier | Meaning (working) |
| --- | --- |
| **A** | Reference equipment or validated external mic under documented protocol |
| **B** | Supported consumer model with experimental correction profile |
| **C** | Project app on unprofiled device; complete metadata; no major quality warnings |
| **D** | Imported recording (e.g. Voice Memos) or incomplete session |
| **E** | Manual/legacy/insufficient technical metadata |

Low tiers must not silently appear equivalent to high tiers on the public map.

## Uncertainty dimensions (not one score)

Report separately where possible:

- Acoustic level confidence
- Frequency content confidence
- Journey assignment confidence
- Device calibration confidence
- User metadata confidence
- Subjective response confidence (if present)

## Quality flags (non-exhaustive)

Clipping, dropout, sample-rate change, Bluetooth input, voice-processing mode, AGC suspicion, obstructed mic, pocket/bag, call/interruption, too short, missing stations, implausible speed, walking mixed with train, route mismatch, duplicate, excessive speech, unknown device profile.

## Recommendation

Gate public map colouring on tier + sample size; always show tier mix and uncertainty. Store raw derived values plus optional correction factor without baking corrections irreversibly into the only stored number.

**Confidence:** Medium (tier boundaries need pilot data).

**Depends on experiment/legal/user-test?** **Experiments** for model profiles; pilot for tier gates.

**Links:** [../research/04-calibration-uncertainty.md](../research/04-calibration-uncertainty.md); [../research/02-acoustic-methodology.md](../research/02-acoustic-methodology.md); [../decisions/ADR-006-quality-tiers.md](../decisions/ADR-006-quality-tiers.md).
