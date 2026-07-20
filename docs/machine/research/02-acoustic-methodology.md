# R2 — Acoustic methodology: metrics, standards, claim limits

Decision-oriented research for TUNES Wave 1. **Must be read with** [acoustic-survey-methodology.md](../acoustic-survey-methodology.md). TfL R3291 (FOI) is a **methodology reference only** — not redistributable data and **not** affiliation or endorsement.

**Owns:** which metrics to collect/publish; how standards apply (or do not); multi-metric and **station-to-station** discipline; what consumer devices cannot claim.

**Does not own:** citizen-science governance (R1); iPhone AGC/API experiment design detail (R3); full calibration hierarchy (R4); claim-language legal sign-off.

---

## 1. Decision questions

1. What metric set should the iOS collector compute and what should the public map / open dataset expose by default?
2. Which ISO/IEC (and related) standards apply **directly**, which are **informative**, and which claims are **unsupported** on consumer devices?
3. How do we reuse professional survey discipline (sections, layered metrics, provenance, grading) without pretending to be Class 1?

Open questions touched: #6 (research / profiled / informal grades), #11 (exposure / discomfort / loudness / risk wording).

---

## 2. Professional discipline to reuse (from methodology notes)

From R3291 practice notes + ISO 3381 framing — transferable *system*, not transferable Class 1 status:

1. Traceable (or best-available characterised) instrument with stated limits  
2. Pre/post checks where feasible; discard/suspect runs that fail stability checks  
3. Justified measurement position/height (or honest passenger-position metadata)  
4. Controlled **and disclosed** conditions; record exclusions  
5. Canonical spatial unit = **station-to-station section** with **duration**  
6. **Layered metrics** — never blend A / C / peak / bands into one unexplained number  
7. Full provenance: device, software/pipeline version, corrections stored separately  
8. Honest grade: in-service crowd data is **survey-grade at best**

TUNES adds passenger loads, ordinary behaviour, and optional perception — those enrich context; they do not upgrade the acoustic grade.

---

## 3. Spatial unit and analysis time

### 3.1 Station-to-station section

**Working assumption (accepted for research direction):** the canonical public comparison unit is a **station-to-station section** with duration `T`.

Why this matches professional practice:

- Maps cleanly to network topology  
- Comparable across days and contributors  
- Forces every Leq to carry an averaging time  

Implementation notes (product detail owned later by R6/R7 + ios/web):

- Report both directions separately when the network model distinguishes them  
- Exclude or flag non-representative legs (e.g. held mid-section) with disclosed reasons — same honesty pattern as professional footnotes  
- Do not publish a section Leq without `T`

### 3.2 Homogeneous sessions

Participatory noise-mapping practice (NoiseCapture-style protocol ideas): keep a session in a homogeneous environment; start a new logical segment when the environment changes (platform vs moving train). Underground GPS is unreliable — **snap to station-pair geometry**, don’t trust raw fixes as acoustic truth.

---

## 4. Metric set

Prefer **derived features** computed on device (or in a versioned pipeline) over uploading raw audio. Keep fields separate.

### 4.1 Core metrics (launch-directed)

| Metric | Role | Notes |
| --- | --- | --- |
| **LAeq,T** | Primary continuous level for section comparison | Always with A-weighting and duration `T` (ISO 1996-1 framing) |
| **LCeq,T** | Low-frequency / flatter weighting companion | `LCeq − LAeq` large → significant LF energy (rule-of-thumb diagnostic, not a health claim) |
| **LCpeak** | Instantaneous C-weighted peak | Not a time average; useful for impulsive events; regulatory *context* only |
| **Percentiles** (e.g. LA10, LA50, LA90 over `T`) | Distribution within the section | Helps distinguish steady rumble vs intermittent events; exact set finalized in architecture |
| **One-third-octave L_eq bands** | Spectral diagnosis | Prefer IEC 61260-style band centres; store as derived spectrum, not a single “tone score” |

Z-weighting / unweighted levels: useful for research exports when computationally available; not required for passenger-facing primary colouring.

### 4.2 Time structure

- Section-level aggregates are the public unit.  
- Optional finer internal frames (e.g. short Leq blocks) may support boundary detection and QA — version them; don’t silently redefine historical section values (R10).

### 4.3 Psychoacoustic and event candidates (research backlog, not launch claims)

Candidates for later derived features / research layers only until validated:

| Candidate | Why interesting | Claim limit |
| --- | --- | --- |
| Tonality / wheel-squeal indicators | Passenger-relevant tonal events | Algorithm + version required; not “official squeal index” |
| Sharpness, roughness, fluctuation strength | Timbre / modulation character | Psychoacoustic models are method-dependent; keep out of unexplained blended scores |
| Impulsiveness indicators | Door slams, bangs | Complement LCpeak; don’t replace it |
| Speech masking / conversation difficulty proxies | Links to accessibility concerns | Prefer pairing with **subjective** items (R9); avoid medical claims |
| Vibration-related experience | Felt vibration ≠ mic pressure | Needs sensors/methods beyond SLM metrics; separate channel |

**Do not** ship a single “discomfort score” that mixes objective bands and survey answers without an explicit, documented model version.

### 4.4 What not to do

- One decibel number as a complete passenger-experience description  
- Averaging LAeq with LCpeak or octave bands into one field  
- Baking calibration offsets into published values without retaining unadjusted + offset provenance  
- Calling crowd results engineering-grade

---

## 5. Standards applicability

### 5.1 Directly informative for method design

| Standard | Relevance to TUNES |
| --- | --- |
| **ISO 3381:2021** | Interior railway noise methods; heights 1.2 m seated / 1.6 m standing; Class 1 instrumentation requirement; grades via ISO 12001; in-service / relaxed monitoring is **below** engineering grade — crowd Tube runs are **survey-grade at best** |
| **ISO 1996-1:2016** | Definitions of Leq, weightings, how to express quantities — always quote weighting + duration |
| **IEC 61672-1** | SLM Class 1 vs Class 2 performance — defines what phones are *not* |
| **IEC 61260** | Fractional-octave filters — target for band features |
| **IEC 60942** | Sound calibrators — relevant when external mic + calibrator exist (Tier A paths) |
| **ISO 12001** | Engineering vs survey grade language — use for honesty labels |

### 5.2 Occupational / environmental context (informative, not TUNES compliance)

| Instrument | Use carefully |
| --- | --- |
| Control of Noise at Work Regulations 2005 (UK) | Explains why dose metrics (e.g. LEX,8h) and LCpeak appear in workplace framing — **does not** make TUNES an occupational compliance tool |
| Environmental assessment practice | Informative for descriptor vocabulary; passenger map ≠ statutory noise map |

### 5.3 What standards do *not* authorize on consumer phones

Uncalibrated or lightly characterised iPhones **cannot** honestly claim:

- Conformance to IEC 61672 Class 1 (or typically even Class 2 without demonstrated verification)  
- ISO 3381 engineering-grade type-test equivalence  
- Substitution for operator acceptance tests or regulatory surveys  
- Traceable chain to a national reference without documented calibrator + procedure  
- Health risk classification, hearing-damage dose, or medical advice from map colours  

Smartphone literature (e.g. NIOSH SLM app programme on iOS; peer-reviewed app-vs-SLM evaluations) supports treating apps as **adjunct / screening** tools with model- and condition-dependent error — cite primary sources when quoting any numeric tolerance; **do not invent project-specific accuracy figures** here. Any TUNES tolerance bands must come from **TUNES experiments** (R3/R4).

---

## 6. Measurement positions and passenger reality

ISO 3381 fixed heights (1.2 m / 1.6 m) are the professional ideal. Ordinary passengers will sit, stand, hold phones at variable heights, and sometimes obstruct mics.

Decision posture:

- Capture **position metadata** (sitting/standing; phone in hand vs pocket/bag; approximate carriage location) rather than pretending ISO heights.  
- Protocol guidance: phone in hand, mic unobstructed; don’t tap/handle mid-run; avoid pocket/bag for higher tiers (R1/R3).  
- Pocket/bag or voice-processed sessions → quality flags and tier demotion, not silent “correction to ISO.”

---

## 7. Quality tiers and grading (working)

Align acoustic honesty with **quality tiers A–E** (glossary working labels):

| Tier | Acoustic reading |
| --- | --- |
| A | Reference SLM or validated external mic + documented protocol — still label survey vs engineering per actual method |
| B | Supported iPhone model with experimental correction profile — relative and profiled absolute claims only within published uncertainty |
| C | Project app, unprofiled device, complete metadata, no major flags — useful for relative patterns with caveats |
| D | Imports / incomplete control (e.g. Voice Memos path if ever allowed) — research curiosity / weak public weight |
| E | Insufficient metadata — archive or exclude from passenger aggregates |

Crowd in-service data maxes out at **survey-grade at best** even at Tier A when conditions are not type-test controlled.

---

## 8. Public claim language (decision draft for ADR)

| May say (with caveats) | Must not say (foundation stage) |
| --- | --- |
| Section LAeq from passenger samples; sample size; tier mix | “Scientifically validated public map” without tiers + experiments |
| “Often louder in our samples than section Y” | “Unsafe,” “hearing damage,” “exceeds legal limit” |
| Low-frequency energy suggested by LCeq−LAeq | Medical diagnosis or accessibility guarantee |
| Survey-grade passenger monitoring | Engineering-grade / Class 1 equivalent / TfL-approved |

Exact allowed vocabulary for exposure / discomfort / loudness / risk → claim-language ADR after acoustic + legal review (open question #11).

---

## 9. Minimum derived payload (schema starter)

Mirror auditability from professional tables without Class 1 pretence:

- Network: line, direction, from/to station (**section**)  
- Metrics: name, weighting, value, unit, duration `T`  
- Optional: percentiles, 1/3-octave vector, peak  
- Device: model, OS, app version, pipeline version  
- Calibration: offset if any (stored separately), tier, quality flags  
- Context: position/height proxy, crowding, exclusions  
- Grade label: survey-grade (crowd) unless a documented reference protocol says otherwise  
- Alignment: snapped vs GNSS accuracy note  

Prefer this **derived** package for upload; raw PCM stays on device by default (R5).

---

## 10. Repo implications

| Repo | Acoustic obligations |
| --- | --- |
| `tunes` | Metric definitions, claim limits, methodology versions, open releases with provenance |
| `tunes-ios` | On-device derived feature computation, flags, section timing, offline buffering |
| `tunes-web` | Aggregation per section, multi-metric display, uncertainty, no blended mystery scores |

---

## Recommendation

Adopt a **multi-metric, section-based, survey-grade-honest** methodology: public comparison on **station-to-station** LAeq,T plus LCeq,T, LCpeak, percentiles, and 1/3-octave derived features; never blend metrics or objective/subjective scores; label crowd data survey-grade at best; use ISO 3381 / IEC 61672 / ISO 1996-1 as normative *vocabulary and honesty bounds*, not as a certificate for iPhones. Psychoacoustic indices stay in research backlog until versioned and validated. Finalize numeric uncertainty bands only after R3/R4 experiments — do not invent them.

## Confidence

**High** for section unit, layered metrics, survey-grade labelling, and “phones ≠ Class 1.” **Medium** for exact percentile set and which psychoacoustic candidates enter v1 derived schema. **Low** for public risk/exposure wording until legal/acoustic ADR.

## Depends on experiment/legal/user-test?

**Yes.** Device accuracy and orientation experiments (R3); calibration hierarchy (R4); user tests for how multi-metric maps are understood; legal review for claim language (#11); optional expert review of band/psychoacoustic feature specs.

## Links to related docs

- [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md) — **required companion**
- [../governance/project-charter.md](../governance/project-charter.md)
- [../02-research-map.md](../02-research-map.md)
- [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)
- [../00-index.md](../00-index-full.md) — glossary (section, derived features, survey grade, tiers)
- [01-citizen-science.md](./01-citizen-science.md)
- [03-consumer-device-limits.md](./03-consumer-device-limits.md)
- Downstream: R4 calibration/uncertainty; R6 journey model; claim-language ADR; open-data layers (R10)

### Primary standards and references (do not treat as TUNES results)

- ISO 3381:2021 — <https://www.iso.org/standard/77368.html>  
- ISO 1996-1:2016 — <https://www.iso.org/standard/59765.html>  
- IEC 61672-1, IEC 61260, IEC 60942; ISO 12001  
- NIOSH SLM app programme — <https://www.cdc.gov/niosh/noise/about/app.html>  
- NoiseCapture protocol FAQ — <https://noise-planet.org/faq_NoiseCapture.html>  
- TfL R3291 via FOI — methodology reference only; not open-licensed data; **no TfL endorsement**
