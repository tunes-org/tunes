# H06 — Quality tiers

Crowd data is **survey-grade at best** — never implied Class 1 / engineering-grade.

## Tiers (working)

| Tier | Meaning |
| --- | --- |
| **A** | Reference SLM / validated external mic + documented protocol |
| **B** | Supported phone model with experimental correction profile |
| **C** | App on unprofiled device; complete metadata; no major warnings |
| **D** | Import / incomplete session / reduced control |
| **E** | Manual / legacy / insufficient metadata |

## Map honesty rules

- Show sample size + uncertainty  
- Do not rank sparse sections as precise fact  
- Do not hide device-quality mix  
- Separate **measured noise** vs **passenger perception**  
- Quiet-room check ≠ calibration  

## Confidence (multi-axis, not one score)

Acoustic level · frequency · journey assignment · device calibration · metadata · subjective

## Detail

[calibration & tiers](./machine/architecture/calibration-and-quality-tiers.md) · [acoustic methodology](./machine/research/02-acoustic-methodology.md) · [R3291 notes](./machine/acoustic-survey-methodology.md) · [measurement philosophy](./H12-measurement-philosophy.md) · [public map](./H13-public-map.md)
