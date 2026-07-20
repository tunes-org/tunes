# R3 — Consumer device limits: iPhone first, wearables later

Decision-oriented research for TUNES Wave 1. Focus: what consumer hardware and OS audio stacks can and cannot support for passenger railway noise measurement. **Recommend experiments, not marketing claims.** Do not invent device accuracy statistics.

**Owns:** collector constraints for `tunes-ios`; experiment backlog for Watch/AirPods/imports; quality-flag vocabulary tied to device behaviour.

**Does not own:** metric definitions (R2); calibration hierarchy math (R4); citizen-science moderation (R1); privacy of raw vs derived (R5) beyond preferring derived uploads.

---

## 1. Decision questions

1. What audio-session and microphone constraints must the v1 iPhone collector enforce?
2. Which failure modes become **quality flags** vs hard blocks?
3. Are Apple Watch, AirPods, or Voice Memos in scope for launch?
4. What experiments are required before any absolute-level marketing or Tier B “profiled device” claims?

Open questions: #7 (Watch/AirPods), #8 (Voice Memos as lower tier).

---

## 2. Posture (aligned with charter)

- **iPhone-first** scientific collector; not browser/PWA for v1 unless future experiments overturn this.  
- Crowd phone data is **survey-grade at best**.  
- Prefer **derived features** leaving the device; raw audio on-device by default.  
- **No TfL affiliation**; device capability claims are TUNES’s responsibility.  
- Quiet-room checks may detect obstruction/malfunction — they are **not** calibration (assumptions doc).

Android, external mics, and wearables are **validated expansions**, not launch requirements.

---

## 3. Why phones are hard measurement instruments

A sound level meter chain is designed for known sensitivity, flat-ish response in a stated range, controlled time/frequency weightings, and calibrator checks (IEC 61672 / 60942 world). A phone mic chain is designed for voice calls, video, and voice assistants.

Consequences for TUNES:

| Professional expectation | Typical phone reality |
| --- | --- |
| Stable sensitivity | Unknown / model-dependent; may drift with OS and accessories |
| Documented frequency response | Voice-oriented; LF and extreme HF often uncontrolled for SLM use |
| No sneaky dynamics | AGC, limiting, noise suppression, voice processing may alter levels |
| Known mic position | Multiple mics; OS picks route; cases/hands/pockets obstruct |
| Continuous exclusive audio | Calls, Siri, route changes, backgrounding interrupt sessions |

Literature on smartphone SLM apps (e.g. NIOSH’s iOS-focused programme; peer-reviewed app evaluations) generally treats phones as **screening / adjunct** tools and stresses model- and condition-dependence. Use those sources when citing external findings; **TUNES must run its own experiments** before stating project tolerances.

---

## 4. iPhone microphone and session limits (launch design drivers)

### 4.1 Automatic gain control (AGC) and level dynamics

**Risk:** AGC compresses or rides gain so that LAeq and peaks no longer track acoustic pressure faithfully.

**Collector posture:**

- Prefer audio session configurations intended for **measurement / unprocessed** input where APIs allow.  
- Detect and flag modes associated with voice processing / AGC when detectable.  
- If unprocessed input cannot be guaranteed on a given OS version, **lower the quality tier** and disclose — do not silently claim SLM behaviour.

**Experiment:** compare known steady tones and train-like spectra with reference SLM vs app under candidate session categories; document whether AGC engages.

### 4.2 Voice processing and noise suppression

**Risk:** NS/AGC “helpful” DSP removes rumble or reshapes spectra — fatal for railway LF content and for 1/3-octave derived features (R2).

**Collector posture:**

- Avoid voice-chat IO modes for measurement.  
- Quality flag: `voice-processing-mode` (or equivalent) → exclude from higher tiers / passenger aggregates.  
- Bluetooth headset mics are voice-oriented — treat as impaired input unless proven otherwise.

### 4.3 Clipping and headroom

**Risk:** Loud tube sections and impulsive events saturate the ADC; LCpeak and LAeq become biased (often low for peaks, distorted for averages).

**Collector posture:**

- Monitor peak/clip indicators during recording.  
- Flag `audio-clipping`; consider section-level usability rules (e.g. high clip fraction → demote or exclude absolute metrics, keep research flags).  
- Do not invent “reconstructed true peak” marketing.

**Experiment:** controlled high-level exposures beside Class 1 SLM; characterise onset of clipping per model.

### 4.4 Microphone selection and multi-mic arrays

**Risk:** OS switches between bottom/top/other mics; beamforming changes response.

**Collector posture:**

- Record which input route was active when APIs expose it.  
- Discourage cases that cover primary mics; protocol: phone in hand, mic unobstructed (participatory mapping practice).  
- Flag mic route changes mid-section.

### 4.5 Sample rate and clock behaviour

**Risk:** rate switches, resampling, or dropouts break filter and Leq assumptions.

**Collector posture:**

- Lock a supported rate for the session; flag `sample-rate-change` and dropouts.  
- Version the DSP pipeline with the rate assumptions (R10).

### 4.6 Orientation, grip, cases, pockets, bags

**Risk:** body and case shadowing; pocket/bag measurements are not comparable to held-phone protocol.

**Collector posture:**

- Metadata: orientation; in-hand vs pocket/bag; obstructed mic self-report + heuristics if available.  
- Pocket/bag → strong quality penalty (often Tier demotion).  
- Guidance over nagging: short protocol screen, not a novel.

**Experiment:** same section, same device, held vs pocket vs case on/off — quantify *relative* deltas for guidance copy (report measured deltas only after tests).

### 4.7 Interruptions and audio route changes

**Risk:** calls, alarms, Siri, Bluetooth connect/disconnect, headphone plug, app background policy gaps.

**Collector posture:**

- Offline-first; survive backgrounding within Apple’s audio session rules where measurement continues.  
- On interruption: mark timeline, pause or split section integrity, prompt review.  
- Flags: `incoming-call`, `app-interruption`, `bluetooth-input`, `audio-route-change`.  
- Recovery after crash: local draft integrity (product requirement).

### 4.8 OS and app version churn

**Risk:** iOS audio behaviour changes; yesterday’s “unprocessed” path may not hold.

**Collector posture:**

- Store OS version + app version on every contribution.  
- Re-validate measurement path on major iOS releases before promoting Tier B profiles.  
- Supported-model lists are living documents in `tunes` / ios release notes.

### 4.9 Built-in vs external microphones

External calibrated mics can raise tier toward **Tier A** when paired with documented protocol and calibrator practice (R2/R4). They are not required for v1 launch but should be schema-ready (input device identity, calibration offset fields).

---

## 5. Watch, AirPods, and OS “environmental noise” values

### 5.1 Working decision

**Apple Watch and AirPods are experiment backlog, not launch collectors.**

Do not assume wearables are superior measurement devices. Investigate before product commitment:

| Topic | Why it matters |
| --- | --- |
| Available APIs / raw audio access | May be restricted or heavily processed |
| Proprietary processing | Unknown transfer function |
| Calibration consistency across units | Population variance unknown |
| Mic placement on body/ear | Not ISO 3381 interior positions |
| Battery and background limits | Long Tube journeys |
| Sync with iPhone session | Clock and missing data |
| Export of OS environmental-noise figures | May be opaque, non-reproducible, not independently verifiable |

Until experiments show otherwise: do not display Watch/AirPods readings as equivalent to `tunes-ios` section metrics.

### 5.2 Voice Memos / imports (open question #8)

**Lean recommendation:** if accepted at all, **Tier D** (working label) — reduced control over processing, gain, and interruptions.

- Prefer native app capture for anything in passenger-facing aggregates.  
- Imports need explicit provenance and lower map weight.  
- Fraud surface is higher (replayed files) — tie to R1 integrity checks.

---

## 6. Quality flags (device-centric starter set)

Emit flags rather than silently “fixing” audio (aligns with methodology honesty rules):

- Audio clipping / dropout  
- Sample-rate change  
- Bluetooth input  
- Voice-processing mode / AGC suspected  
- Obstructed microphone / phone in pocket or bag  
- Incoming call / app interruption / audio-route change  
- Recording too short for claimed **station-to-station section**  
- Insufficient usable frequency range (if diagnosable)  
- Unknown device profile  

Flags feed **quality tiers A–E** and multi-dimensional confidence (acoustic vs journey vs calibration) — not one magic score.

---

## 7. Experiment backlog (required before strong claims)

Run and document in `tunes` (methods + results versions); implement harnesses in `tunes-ios` where applicable.

### 7.1 Launch-blocking / early pilot

1. **Session category audit** — confirm measurement-oriented session vs voice modes on supported iOS versions.  
2. **Repeatability** — same device, same controlled stimulus, repeated runs.  
3. **Reference comparison** — beside Class 1 SLM for steady noise and representative spectra (report results when measured; no pre-claimed ±dB).  
4. **Clipping onset** — high-level behaviour per model class.  
5. **Orientation & obstruction** — held vs pocket vs case.  
6. **Interruption matrix** — call, route change, background, lock screen.  
7. **Long journey endurance** — 30–90 min offline stability, storage pressure.

### 7.2 Tier B profiling (post-pilot)

8. Per-model correction profiles vs reference (store offset separately; never silent bake-in).  
9. Major iOS upgrade regression suite.  
10. External mic + calibrator path (Tier A protocol draft with R4).

### 7.3 Explicitly deferred

11. Apple Watch environmental noise export validation.  
12. AirPods mic as cabin sensor.  
13. Android fragmentation study (separate programme phase).  
14. Browser/PWA mic path (assume unsuitable until proven).

**Rule:** publish experiment plans and later results; do not fill docs with placeholder accuracy numbers.

---

## 8. Implications for quieter-journey UX

Until Tier B+ profiles and uncertainty UX exist:

- Prefer **relative** language (“often higher in our samples”) over absolute regulatory-sounding dB authority.  
- Always show tier / flags / sample size on `tunes-web`.  
- Live UI on ios: status and warnings, not fake Class 1 precision readouts that invite screenshot misuse.

---

## 9. Repo implications

| Repo | Device-limit obligations |
| --- | --- |
| `tunes` | Supported-device policy, experiment reports, tier rules, claim limits |
| `tunes-ios` | Session config, flags, interruption handling, derived feature pipeline, offline integrity |
| `tunes-web` | Respect flags/tiers in aggregation; no promotion of Watch/import data as equal |

---

## Recommendation

Ship an **iPhone-native collector** that prioritises unprocessed (or best-available characterised) input, aggressive **quality flags** for AGC/voice processing/clipping/interruptions/obstruction, and **derived-feature** uploads. Treat Watch/AirPods as **experiment backlog**, not launch. Allow Voice Memos-style imports only as **Tier D** (if at all). Make no absolute accuracy marketing claims until documented reference experiments exist; quiet-room checks remain non-calibration. Align all public numbers with R2’s survey-grade, multi-metric, **station-to-station** discipline.

## Confidence

**High** for iPhone-first launch, wearables-deferred, flag-driven honesty, and “no invented ±dB.” **Medium** for exact session API choices per iOS version (must be verified in code + lab). **Low** for any wearable usefulness until experiments run.

## Depends on experiment/legal/user-test?

**Yes — primarily experiments.** Lab/field reference comparisons, interruption tests, orientation/pocket tests, and iOS upgrade regressions. User tests for protocol compliance (in-hand vs pocket) and warning UX. Legal only if OS environmental-noise APIs impose attribution/use constraints; privacy defaults remain R5.

## Links to related docs

- [../governance/project-charter.md](../governance/project-charter.md)
- [../02-research-map.md](../02-research-map.md)
- [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)
- [../00-index.md](../00-index-full.md) — glossary (derived features, quality tiers, survey grade)
- [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md) — smartphone adjunct framing; participatory protocol
- [01-citizen-science.md](./01-citizen-science.md)
- [02-acoustic-methodology.md](./02-acoustic-methodology.md)
- Downstream: R4 calibration/uncertainty; ios product audio-session ADR; supported-devices list

### External starting points for experiments (not TUNES results)

- Apple audio session / AVAudioSession documentation (primary for implementation)  
- NIOSH SLM app programme — <https://www.cdc.gov/niosh/noise/about/app.html>  
- Peer-reviewed smartphone SLM evaluations (cite specifically when quoting numbers)  
- NoiseCapture contributor protocol ideas — <https://noise-planet.org/faq_NoiseCapture.html>
