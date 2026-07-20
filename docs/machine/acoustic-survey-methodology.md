# Acoustic Survey Methodology — Notes & References

Working notes on how professional interior-noise surveys are run, distilled from a
real TfL passenger-car survey and cross-referenced against the governing standards.
The goal is to reuse the *systematic* parts of this practice when we design our own
Tube-noise data collection, rather than reinventing (or accidentally weakening) an
established method.

> Source document that prompted these notes: **TfL Technical Services Report
> N&V – R3291 v1.1, "Acoustic Survey in Passenger Car of 1992 Tube Stock"**
> (Central line, measured 8 July 2023, issued 15 Sept 2023). Released via FOI
> (FOI-2746-2324). The report is public to read but **not open-licensed** — treat it
> as a methodology reference, not a redistributable dataset.

---

## 1. What the TfL report does "properly" (and why)

Reading R3291 as a template, the disciplined parts of the method are:

### 1.1 Traceable, class-rated instrumentation
- Uses **Class 1** sound level meters (SLMs) and a **Class 1** acoustic calibrator.
- Every instrument is listed with **manufacturer, type, serial number, calibration
  certificate number, and calibration date** (their Table 1). Nothing anonymous.
- SLMs calibrated to traceable standards **within the previous 2 years**; the
  acoustic calibrator **within the previous 12 months**.
- Conformance is explicitly claimed against named standards (BS EN 61672-1:2013,
  BS EN 61260-3:2016, BS EN 60942:2018).

**Why it matters:** the measurement is only as trustworthy as the chain back to a
national reference. Serial numbers + cert dates make the run auditable and repeatable.

### 1.2 Field calibration before *and* after
- A **94 dB @ 1000 Hz** calibration tone applied on-site **before and after** the
  survey, confirming the meters didn't drift during the run ("remained stable
  throughout").

**Why it matters:** a pre/post check catches drift. If the post-check disagrees with
the pre-check, the whole run is suspect — you find out *before* trusting the data.

### 1.3 Well-defined measurement positions
- Two fixed heights measured simultaneously:
  - **Standing: 1.6 m** above floor
  - **Seated: 1.2 m** above floor
- These correspond to ear height for standing vs seated passengers — the positions
  the standard prescribes (see §2.2).

**Why it matters:** "how loud is it" is meaningless without "measured where". Fixed,
justified heights make results comparable between runs and between vehicles.

### 1.4 Controlled, documented conditions
- Passenger car **unoccupied** for the run.
- **PA announcements disabled** throughout (removes a non-representative source).
- Operating conditions **representative of normal service**.
- **Deviations recorded**: the westbound Wanstead→Leytonstone leg where the train
  stood still mid-journey was **excluded**, and the exclusion is stated in the table
  footnote with the actual transit time.

**Why it matters:** controlling and *disclosing* conditions is what separates a survey
from an anecdote. The reader can see exactly what was and wasn't included.

### 1.5 Consistent spatial unit: station-to-station
- Every value is reported per **station-to-station section**, in **both directions**
  (eastbound Table 2 / westbound Table 3), each with the **transit duration** (mm:ss).

**Why it matters:** a stable, meaningful segment (platform to platform) is directly
mappable and comparable. Duration is reported so an Leq is never quoted without its
averaging time.

### 1.6 Multiple, layered metrics — not a single number
- Primary: **L<sub>Aeq,T</sub>** (A-weighted equivalent continuous level).
- Also: **L<sub>Ceq,T</sub>**, **L<sub>Cpeak</sub>**, and full **one-third-octave band
  L<sub>eq</sub> from 20 Hz to 20 kHz** in the appendix.

**Why it matters:** A-weighting tracks perceived loudness; C-weighting + peaks + octave
bands preserve the low-frequency and impulsive content that A-weighting hides. Keeping
them separate (never averaged together) lets you diagnose *why* a section is loud.

### 1.7 Reproducible analysis + provenance
- Names the **analysis software and version** (01dB Trait 6.3.1 build 1).
- Records the **train unit/reference** (775/1005134), date, author, reviewer.
- Cites its normative references explicitly.

**Why it matters:** version + unit + reviewer means someone else could rerun the
analysis and get the same numbers.

---

## 2. The governing standards (what "proper" is measured against)

### 2.1 ISO 3381:2021 — Railway acoustics, interior noise
`Railway applications — Acoustics — Noise measurement inside railbound vehicles.`
The core standard for measuring noise *inside* trains. Key points:
- Specifies methods for **stationary**, **constant speed**, and
  **accelerating/decelerating** running, plus **driver's cab** cases.
- Divides the vehicle into **acoustic areas**; areas are split into **segments of max
  5 m**, each with ≥1 measurement position.
- Prescribes measurement heights: **1.2 m at seated** positions, **1.6 m in standing**
  areas (exactly what R3291 uses).
- Requires **Class 1** instrumentation per IEC 61672-1, IEC 60942, IEC 61260-1.
- Grades results per **ISO 12001**:
  - Constant-speed / stationary type tests → **engineering grade (grade 2)**.
  - Accelerate/decelerate → **survey grade (grade 3)**.
  - **Relaxed / in-service monitoring is explicitly *below* engineering grade** —
    important: it means our in-service Tube runs are, by definition, survey-grade at
    best, and we should label them that way.
- Weather/background rules: no rain/hail/snow, external wind < ~5 m/s, background at
  least ~10 dB below the measured signal, reported before/after each series.
- <https://www.iso.org/standard/77368.html>

### 2.2 Instrumentation standards
- **IEC/BS EN 61672-1** — sound level meter specifications (defines Class 1 vs 2).
  <https://www.iso.org/standard/... (IEC 61672-1)>
- **IEC/BS EN 61260** — octave / fractional-octave band filters (the 1/3-octave bands).
- **IEC/BS EN 60942** — sound calibrators (the 94 dB / 1 kHz reference source).

Class 1 ≈ ±0.7 dB tolerance (lab/precision); Class 2 ≈ ±1.0–1.5 dB (general field).
Most smartphones, at best, approximate Class 2 and only after calibration (see §3).

### 2.3 ISO 1996-1:2016 — Environmental noise descriptors
Defines the quantities and how to express them. Relevant definitions:
- **L<sub>eq,T</sub>** — equivalent continuous level: the energy-average over a stated
  duration `T`. Always quote with a weighting **and** a duration (e.g. `LAeq,5min`).
- **A-weighting (dBA)** — approximates the ear at moderate levels; the default for
  loudness/exposure. Attenuates lows heavily (~-40 dB at 63 Hz).
- **C-weighting (dBC)** — near-flat 31.5 Hz–8 kHz; used for peaks and low-frequency
  content. `L_Ceq − L_Aeq > ~10 dB` flags significant low-frequency energy.
- **L<sub>Cpeak</sub>** — the maximum *instantaneous* C-weighted pressure (not
  time-averaged). The regulatory peak metric.
- <https://www.iso.org/standard/59765.html>

### 2.4 Occupational context (UK)
- **Control of Noise at Work Regulations 2005** — uses **L<sub>EX,8h</sub>** (daily
  A-weighted exposure) for action/limit values and **L<sub>Cpeak</sub>** for peaks.
  Useful framing for why cab/driver surveys report dose, not just section Leq.

---

## 3. Applying this to our own (crowdsourced / smartphone) collection

We won't have Class 1 meters on a volunteer's phone. The research is clear about what
that means and how to stay honest:

### 3.1 Smartphone accuracy — what's realistic
- **iOS is far more trustworthy than Android**: uniform hardware lets apps be verified.
  The **NIOSH SLM app** (iOS) is validated to **±2 dBA** in lab conditions and shows
  strong correlation with professional SLMs. Android hardware is too fragmented for
  NIOSH to certify.
- Uncalibrated apps tend to **under-report** — the dangerous direction for a health
  message. From a public-health view, err slightly *high*, not low.
- An **external calibrated microphone** can bring a phone to ~±1 dB; without it, expect
  ~2 dB variability at best.
- Apps are an **adjunct/screening tool**, not a replacement for regulatory measurement.

References:
- NIOSH SLM app — <https://www.cdc.gov/niosh/noise/about/app.html>
- App-vs-SLM evaluation (Nature Sci Rep 2025) — <https://www.nature.com/articles/s41598-025-29111-1>
- OHS app accuracy study (JMIR/PMC) — <https://pmc.ncbi.nlm.nih.gov/articles/PMC10686533/>

### 3.2 Participatory-mapping protocol (borrow from NoiseCapture / Noise-Planet)
Practical rules that keep crowd data usable:
- **Phone in hand**, microphone unobstructed — never in a pocket/bag.
- **Don't handle/tap** the phone mid-measurement (handling noise).
- **Wait ~4 s** after starting for GPS to stabilise before recording.
- Keep each session to a **homogeneous sound environment**; start a new session when
  the environment changes (e.g. platform → moving train). ~10–15 min max per session
  to avoid data loss from calls/GPS drop/battery.
- **Avoid rain and strong wind** (>~5 m/s), matching ISO 3381.
- **Cross-calibrate** each device against a reference (Class 1 SLM or an
  already-calibrated phone) and store the **per-device correction factor**.
- Record **hardware metadata** (device model, OS, app version) so we can do
  *a-posteriori* bias correction and filtering.
- **GPS/tunnel caveat:** underground GPS is unreliable — expect to **snap to
  station-pair geometry** (we already have OSM track geometry) rather than trust raw
  fixes, and filter points with poor reported accuracy.

References:
- NoiseCapture FAQ / protocol — <https://noise-planet.org/faq_NoiseCapture.html>
- Open-science crowdsourcing noise maps (Build. Env. 2019) — <https://doi.org/10.1016/j.buildenv.2018.10.049>
- Crowdsourced city noise mapping (MDPI Urban Sci 2024) — <https://www.mdpi.com/2413-8851/8/1/13>

### 3.3 Minimum metadata to capture per measurement (our schema starter)
Mirror what makes R3291 auditable:

| Field | Example | Why (from the pro method) |
|---|---|---|
| line + direction | `central` / `eastbound` | comparable spatial unit (§1.5) |
| from / to station | `Stratford` → `Leyton` | station-to-station segment |
| metric | `LAeq` | never mix metrics (§1.6) |
| weighting | `A` / `C` | required with every level (§2.3) |
| value + unit | `98.2 dBA` | — |
| duration `T` | `143 s` | Leq is meaningless without T |
| device model / OS | `iPhone 13 / iOS 18` | a-posteriori correction (§3.1) |
| app + version | `NIOSH SLM 1.2.6` | reproducibility (§1.7) |
| calibration offset | `+1.4 dB` | traceability substitute (§1.1) |
| position/height | `standing, held ~1.5 m` | measurement position (§1.3) |
| conditions/exclusions | `crowded; door chime included` | disclose deviations (§1.4) |
| grade | `survey (grade 3)` | honest quality label (§2.1) |
| gps accuracy (m) | `snapped` / `12 m` | filter bad fixes (§3.2) |

### 3.4 Honesty rules (non-negotiable)
- Label everything crowd-collected as **survey grade at best** — never imply
  engineering-grade parity with the FOI surveys.
- Keep **A / C / peak / octave** data in separate fields; don't blend.
- Store the **correction factor**, don't silently bake it in — keep raw + adjusted.
- Show **coverage and uncertainty**, not just a colour.

---

## 4. TL;DR — the transferable checklist

1. Class-rated (or best-available, characterised) instrument, with a stated tolerance.
2. Calibrate **before and after**; discard runs that fail the post-check.
3. Fixed, justified **measurement positions/heights**.
4. **Controlled + documented** conditions; disclose every exclusion.
5. Consistent spatial unit = **station-to-station**, with **duration**.
6. **Layered metrics** (LAeq + LCeq + LCpeak + octaves), never averaged together.
7. Full **provenance**: device, software version, operator, date, correction factor.
8. Grade the result honestly (**engineering vs survey**) per ISO 12001 / ISO 3381.

---

## 5. Source index

- TfL R3291 v1.1 passenger-car acoustic survey (FOI-2746-2324) — methodology reference,
  not open data.
- ISO 3381:2021 — <https://www.iso.org/standard/77368.html>
- ISO 1996-1:2016 — <https://www.iso.org/standard/59765.html>
- IEC 61672-1 (SLMs), IEC 61260 (band filters), IEC 60942 (calibrators).
- ISO 12001 — noise test-code grades (engineering vs survey).
- Control of Noise at Work Regulations 2005 (UK).
- NIOSH SLM app — <https://www.cdc.gov/niosh/noise/about/app.html>
- NIOSH app validity, Nature Sci Rep 2025 — <https://www.nature.com/articles/s41598-025-29111-1>
- Mobile app accuracy, PMC — <https://pmc.ncbi.nlm.nih.gov/articles/PMC10686533/>
- NoiseCapture FAQ — <https://noise-planet.org/faq_NoiseCapture.html>
- Open-science crowdsourced noise maps — <https://doi.org/10.1016/j.buildenv.2018.10.049>
- Crowdsourced noise mapping, MDPI — <https://www.mdpi.com/2413-8851/8/1/13>
