# R7 — Journey alignment (boundaries and correction UX)

**Status:** Wave 1 research recommendation  
**Owns methodology / contracts:** `tunes`  
**Owns capture and correction UX:** `tunes-ios`  
**Consumes alignment outcomes:** `tunes-web` (validation, map association, quality flags)

## Problem

Acoustic metrics without a trustworthy **station-to-station section** assignment are not comparable. Professional interior surveys report levels **per section with duration** (see [acoustic-survey-methodology.md](../acoustic-survey-methodology.md), ISO 3381 practice). Crowdsourced phone recordings must produce the same comparison unit — honestly — despite delays, branch ambiguity, late starts, early stops, transfers, and walking inside stations.

Alignment is therefore a **scientific boundary problem** and a **product UX problem**. Predictions may suggest cuts; only user-confirmed (or campaign-protocol) section maps should enter public comparison layers.

## Working assumptions this doc inherits

- Canonical public unit = **station-to-station section with duration** ([scope-statement.md](../governance/scope-statement.md); provisional decision D-SEC).
- Privacy default = local record → infer → **review/correct** → consent → derived upload ([01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)).
- Underground GPS is **not** trustworthy as a primary clock; topology snap and motion/acoustic cues matter more ([acoustic-survey-methodology.md](../acoustic-survey-methodology.md) §3.2).
- Schema stays **generic railway** with London as instances (open Q #1–2; R6).

## What “aligned” means

A recording session is aligned when each retained time interval is assigned to exactly one of:

| Interval type | Public comparison? | Notes |
| --- | --- | --- |
| **In-motion section** | Yes (primary) | Between consecutive station stops on a declared service path |
| **Station dwell** | Optional / flagged | Platform or doors-open standing; often excluded from section Leq unless campaign says otherwise |
| **Held between stations** | Flag / exclude | Mid-section stop; disclose and usually exclude from section averages (pro practice excludes non-representative holds) |
| **Walking / interchange** | No (or separate layer) | Must not inflate or dilute section metrics |
| **Unassigned / trimmed** | No | User deleted or left unmapped; never silently filled |

Every published section metric must carry **duration T** and an **alignment confidence** dimension separate from acoustic confidence.

---

## Signal stack (prefer multi-cue, never one oracle)

Alignment should fuse **prior** (what the user said they would ride) with **posterior** cues (what sensors observed). No single cue is sufficient underground.

### 1. User-selected route (required prior)

Before or at recording start, the contributor selects:

- Network / system (e.g. London Underground instance)
- Line and **direction** (or terminus-facing direction)
- Origin station (boarding)
- Intended destination (or last intended stop)
- Optional: known branch choice where topology forks

This prior constrains the search space to a **path on the network graph**. Without it, automatic section IDs are not credible for v1 public data.

**Repo:** `tunes-ios` UX; path validity against network definitions owned by `tunes`.

### 2. Timetable / expected run expectations (soft prior)

Where open timetable or headway data is available and licence-compatible:

- Expected section transit durations (ranges, not point estimates)
- Typical dwell bands
- Known skip-stop / express patterns for that service type

Use as **priors and plausibility checks**, not as ground truth. Delays are normal; a model that forces timetable clocks will mis-cut late trains.

Do **not** imply operator endorsement by displaying branded “official” journey assurances. Open operational data ≠ affiliation ([project-charter.md](../governance/project-charter.md)).

### 3. Station dwell patterns

Dwells often appear as:

- Near-zero along-track progress (motion)
- Lower or differently textured acoustic envelope vs running
- Door/chime events at edges
- Possible GPS / Wi-Fi / cell context change when near surface or large stations (opportunistic only)

Variable dwell is the main reason **fixed-duration slicing** fails. Alignment must allow stretch/shrink of both motion and dwell intervals.

### 4. Door sounds and acoustic envelope

Useful **edge hints**, not speech recognition by default:

- Door close / open energy bursts
- Sudden envelope shifts at stop ↔ go
- Wheel-rail / traction texture changes when moving vs standing

**Announcement recognition** (station name ASR) is optional later research: high privacy cost, brittle accent/PA quality, and conflicts with derived-only defaults if audio snippets are retained. Prefer envelope + motion first; treat ASR as experiment-gated, campaign-only if ever.

### 5. Acceleration, braking, accelerometer / vibration

Phone IMU (when available and consented for motion capture):

- Longitudinal accel/brake patterns between stops
- Vibration floor differences: platform walk vs train run
- Possible curve/squeal correlation as secondary texture (not identity)

Motion helps separate **walking in stations** from **train motion** better than audio alone. Document sensor gaps (backgrounding, watch-only, user denying motion) as quality flags — do not invent motion.

### 6. Optional GPS / location

- **Above ground / Overground / some subsurface:** may refine absolute time ↔ place when accuracy is reported good.
- **Deep Tube:** treat GPS as weak or absent; snap to **topology + user path**, not raw track following.
- Prefer storing **snapped section IDs and relative timeline**, not high-rate raw traces, in derived uploads (location minimisation; R5).

### 7. Network topology

The graph supplies:

- Legal next stations given line + direction + branch
- Branch ambiguity sets (e.g. Northern line forks)
- Transfer edges (out-of-vehicle)
- Impossible transitions for fraud / error flags

Topology is authoritative for **which section IDs exist**; sensors only propose **when** cuts fall and whether the trip stayed on the declared path.

---

## Post-recording editor (subtitle / chapter metaphor)

**Primary UX owner: `tunes-ios`.**

After recording (and preferably after local feature extraction), show a **timeline editor** analogous to subtitle or chapter markers:

1. Waveform or level envelope strip (derived display; not a requirement to upload audio).
2. Proposed **section blocks** labelled with from→to station names.
3. User can **drag boundaries**, **stretch/compress** blocks, **merge/split**, **reassign** station labels from the legal topology set, **mark dwell/hold/walk**, **trim** start/end.
4. Live duration per section updates as boundaries move (required for honest Leq,T).
5. Explicit **confirm** before the contribution enters the upload preview.

Predictions are suggestions. Unconfirmed auto-alignment must not ship into public map aggregates without a documented campaign protocol that accepts auto-confirm under stated conditions (not default for informal contributors).

### Accessibility and commute constraints

- One-handed correction where practical
- Large hit targets for boundary handles
- Screen-off recording must not require watching the journey
- Correction should be understandable without acoustic training
- Colour alone must not encode confidence

Numeric UX targets (time-to-correct, error rates) belong in user tests — **not invented here**.

---

## Failure modes to design for (evaluation matrix)

| Failure | Risk if ignored | Design response |
| --- | --- | --- |
| **Delays / long dwell** | Boundaries drift; wrong station pairing | Soft timetable priors; dwell as first-class interval; user stretch |
| **Branch ambiguity** | Wrong section IDs on fork | Force branch choice when topology requires; post-edit reassignment |
| **Train held between stations** | Inflated section T; non-representative Leq | Detect long near-stationary mid-section; flag/exclude with disclosure |
| **Late start** (joined mid-journey) | Partial first section | Allow first block = “partial section”; quality flag; optional exclude from pairwise stats |
| **Early stop** (left before destination) | Trailing empty path | Trim unused planned stations; do not fabricate intervals |
| **Missed / skipped stop** | Extra or missing cuts | Topology + user correction; skip-stop service profiles when known |
| **Transfers** | Mixing lines in one section metric | Require explicit transfer break; separate sessions or marked interchange intervals |
| **Walking in stations** | Footfall / PA / retail noise in “section” | IMU + envelope classifiers → walk intervals; exclude from section Leq |
| **Sensor loss / interruption** | Silent gaps | Quality flags; do not interpolate fake motion; allow user mark gap |
| **Background audio route change** | Envelope artefacts at boundaries | Flag; avoid treating artefacts as station edges |

### Metrics to measure in experiments (no targets yet)

Define experiment protocols for:

- Section ID correctness (vs contributor ground truth diary)
- Boundary timing error distribution (seconds), reported with method
- Branch selection accuracy where forks exist
- Correction completion time and correction error rate (user test)
- Calibration of **alignment confidence** vs observed error (does “high” mean high?)

Publish method and sample description; do not claim accuracy percentages until measured.

---

## Confidence dimensions (alignment ≠ loudness)

Keep separate confidence axes (programme rule against one universal score):

- **Journey assignment confidence** — path and section IDs
- **Boundary timing confidence** — cut placement
- **Acoustic confidence** — device / clipping / placement (R3/R4)
- **Metadata confidence** — carriage etc. (R8)
- **Subjective completeness** — survey present or not (R9)

`tunes-web` must be able to filter map layers by journey-assignment confidence independently of acoustic tier.

## Quality flags (alignment-related)

Suggested flags (names illustrative; final enum in schema ADR):

- `alignment_unconfirmed`
- `partial_first_section` / `partial_last_section`
- `held_between_stations`
- `walk_or_interchange_mixed`
- `branch_ambiguous`
- `route_mismatch`
- `implausible_section_duration`
- `sensor_gap`
- `gps_weak_or_absent` (informational underground)

## Repo split

| Concern | Repo |
| --- | --- |
| Section unit definition, topology schema, flag enums, confidence dims | `tunes` |
| Recording, IMU/audio capture, inference, subtitle editor, confirm UX | `tunes-ios` |
| Reject impossible journeys, aggregate only confirmed sections, map honesty | `tunes-web` |

## Decisions recommended for Wave 2 ADRs

1. **User route prior required** for contributions eligible for public section comparison.
2. **Human confirm default** for section maps; auto-accept only under explicit campaign protocol.
3. **Dwell / hold / walk** are first-class interval types, not silent padding inside section Leq.
4. **GPS optional and minimised**; topology + motion + envelope primary underground.
5. **Announcement ASR** deferred; experiment-gated, not v1 dependency.
6. Alignment UX and offline correction owned by **`tunes-ios`**; science contracts in **`tunes`**.

## Open questions (do not invent answers)

- Exact fusion algorithm (HMM / DTW / rule-based) — spike in Phase 3.
- Whether surface GPS should ever raise tier alone (likely no).
- Minimum usable partial-section policy for map display.
- How aggressively to prompt branch choice vs infer-then-correct.

## Recommendation

Treat journey alignment as a **constrained path labelling** problem: user-selected route + topology define legal sections; dwell, doors, accel/brake, IMU, envelope, and optional GPS propose cuts; a **subtitle-style post-recording editor in `tunes-ios`** makes the passenger the final arbiter before derived upload. Design explicitly for delays, branches, late start, early stop, transfers, and in-station walking — and keep alignment confidence separate from acoustic metrics. Prefer excluding ambiguous intervals over publishing false station pairs.

**Confidence:** High for the signal stack shape, editor metaphor, and repo ownership; Medium for automatic cut quality until Phase 3 journey experiments; Low for any numeric accuracy claim until measured.

**Depends on experiment/legal/user-test?** **Yes** — real-journey boundary experiments; user tests of correction UX; privacy review if announcement audio features are ever proposed; licence check for any timetable data source.

**Links to related docs:** [06-railway-journey-model.md](./06-railway-journey-model.md) (when present); [05-privacy-ethics.md](./05-privacy-ethics.md); [08-passenger-metadata.md](./08-passenger-metadata.md); [02-acoustic-methodology.md](./02-acoustic-methodology.md); [acoustic-survey-methodology.md](../acoustic-survey-methodology.md); [../governance/scope-statement.md](../governance/scope-statement.md); [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md) (open Q #9 adjacent); `tunes-ios` [product-scope.md](../../../tunes-ios/docs/product-scope.md); `tunes-ios` [privacy-client-flow.md](../../../tunes-ios/docs/privacy-client-flow.md).
