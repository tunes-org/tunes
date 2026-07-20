# R8 — Passenger and carriage metadata

**Status:** Wave 1 research recommendation  
**Schema / required-field policy:** `tunes`  
**Capture UX (minimise form burden):** `tunes-ios`  
**Validation / campaign profiles:** `tunes-web` + campaign configs in `tunes`

## Problem

Placement and context change what a phone hears. Professional surveys fix **height, position, occupancy, and exclusions** and disclose deviations ([acoustic-survey-methodology.md](../acoustic-survey-methodology.md)). Crowdsourced TUNES cannot demand a laboratory form on every commute — but omitting carriage position, phone placement, and crowding makes aggregates harder to interpret and easier to misuse.

Open question #9: **How much route and carriage metadata should users enter manually?** Answer with a **tiered metadata policy**: infer what is safe, ask little before record, allow rich optional after, reserve long forms for campaigns.

## Principles

1. **Minimise pre-recording friction** — starting a valid session must stay commute-friendly.
2. **Prefer derived / automatic fields** over typed fields when accuracy is adequate.
3. **Never block contribution** on optional human factors metadata for informal public tiers.
4. **Campaigns may require more** — research protocols can demand fields that casual mode does not.
5. **Metadata confidence is its own axis** — incomplete metadata lowers metadata confidence, not a fake blended score.
6. **No unsafe behaviour** — never instruct contributors to obstruct doors, lean into tracks, or stand in forbidden positions for “better” data (see code of conduct).

## Classification model

Every candidate field falls into one (primary) collection mode:

| Mode | Meaning | When shown |
| --- | --- | --- |
| **Auto-infer** | Device / clock / network / sensors | Always attempted; user may override if wrong |
| **Pre-select** | Needed to constrain the session | Before or at record start; keep short |
| **Post-add** | Useful, recallable after the ride | After stop / during review |
| **Optional** | Improves interpretation; skip forever OK | Progressive disclosure |
| **Campaign-required** | Mandatory only under named protocol | Campaign profile gate |

A field may be **auto-infer with optional confirm** (best of both).

---

## Field catalogue (decision-oriented)

### A. Journey context (mostly R7; listed for completeness)

| Field | Mode | Notes |
| --- | --- | --- |
| System / line / direction | Pre-select | Required for comparable section IDs |
| Origin / destination | Pre-select | Required prior path |
| Branch choice | Pre-select when topology needs it | Else post-correct |
| Local wall time / timezone | Auto-infer | Provenance |
| Planned vs actual timing flags | Auto + post | Disruption noted if user marks |
| Service disruption (subjective) | Optional / post | Free-text carefully — privacy (R5) |

### B. Vehicle and carriage

| Field | Mode | Notes |
| --- | --- | --- |
| Train / unit identity | Optional / campaign | Rarely known to passengers; do not require |
| Rolling stock / train type | Auto-infer if network service implies; else optional | Prefer service→stock maps in `tunes` data over guessing |
| **Front / middle / rear of train** | Post-add (recommended optional) | High interpretive value; coarse 3-way control beats precise carriage numbers |
| Approximate carriage number | Optional / campaign | Hard on many fleets; campaign-only unless user knows |
| Position in carriage (end / centre / near doors / near bogie) | Post-add optional | Affects door chimes, bogie/rail noise; coarse chips not free text |
| Sitting vs standing | Post-add optional | Maps to ISO-ish height intent (1.2 m vs 1.6 m) without claiming compliance |

**Recommendation lean:** Default informal UI asks **front / middle / rear** after recording (one tap row). Deeper carriage geometry is optional expand or campaign.

### C. Phone placement and measurement hygiene

| Field | Mode | Notes |
| --- | --- | --- |
| Phone in hand / pocket / bag | Post-add **strongly recommended**; campaign-required for higher tiers | Pocket/bag is a major quality flag (NoiseCapture-style protocol) |
| Orientation / which mic facing | Auto where OS allows; else optional | Do not quiz every user |
| Microphone obstructed / case concern | Auto hints (level floor) + optional confirm | Quiet-room check ≠ calibration (assumption #6) |
| Headphones worn (playback) | Optional post | Affects perception survey more than mic; still useful |
| Bluetooth / voice-processing / route changes | Auto-infer from audio session | Quality flags (R3) |

**Protocol guidance (contributor education, not a claim of Class 1):** prefer hand-held, unobstructed mic, minimise handling noise — aligned with participatory mapping practice notes, labelled as guidance.

### D. Crowding and environment

| Field | Mode | Notes |
| --- | --- | --- |
| Crowding (coarse) | Post-add optional | e.g. empty / light / busy / packed — ordinal chips |
| Estimated load % | Avoid in casual UX | Too precise; campaign only if trained |
| Windows / doors open | Optional where mode relevant | More for surface/overground; N/A many Tube cars |
| Weather | Auto (if on-surface + permission) or skip | Weak underground; do not require |
| Child / buggy / wheelchair space proximity | Optional | Accessibility research value; never required |

Crowding is **context**, not a substitute for acoustic metrics. Store separately.

### E. Subjective discomfort (pointer only)

Overall discomfort and perception items belong in **R9**, not buried in metadata forms. Metadata may include a single optional “add perception survey” entry point after journey alignment confirm.

### F. Device and processing (almost never asked)

| Field | Mode |
| --- | --- |
| Device model, OS, app version | Auto-infer |
| Calibration / profile state | Auto from device profile store |
| Clipping / dropout / AGC suspicions | Auto quality flags |
| Contributor pseudonymous ID | System | Privacy design (R5) |

---

## Burden budget (UX policy for `tunes-ios`)

**Pre-recording (casual mode) — keep to journey essentials:**

1. Line + direction  
2. From station  
3. To station (or “until I stop”)  
4. Branch if required  

Optional one-liner: “You can add carriage details after.”

**During recording:** no forms. Status only (recording healthy / clipped / interrupted).

**Post-recording — progressive, skippable:**

1. Confirm / edit section alignment (R7) — **required** for public comparison eligibility  
2. Phone placement chip (hand / pocket / bag / other) — **recommended**, not blocking  
3. Train third (front / middle / rear) — **recommended**  
4. Crowding coarse — optional  
5. Sitting/standing + in-carriage position — optional expand  
6. Perception survey (R9) — optional  

**Campaign mode:** a versioned **campaign profile** can mark any optional field `required`, add trained codes (stock, carriage number), and require reference-protocol placement. Casual uploads must not inherit campaign required-sets by accident.

## What not to ask casually

- Exact dB guesses from the user  
- Medical diagnoses or hearing conditions (separate ethics path if ever researched)  
- Free-text venting as a substitute for structured fields (privacy + moderation cost)  
- Fine GPS share “to help metadata”  
- Anything that encourages unsafe positioning  

## Interaction with quality tiers

Illustrative coupling (final tiers in calibration / quality ADR):

| Metadata completeness | Effect |
| --- | --- |
| Journey confirmed + device auto fields only | Eligible for lower public tiers if acoustics OK |
| + phone placement + train third | Raises **metadata confidence**; helps stratified analysis |
| Campaign-complete placement protocol | May be required for designated research subsets |
| Pocket/bag without disclosure | Auto flag; may cap tier regardless of other fields |

Missing optional metadata must **not** look like acoustic failure. Map and exports should expose “n with placement known” separately from “n measured”.

## Schema implications (`tunes`)

- All human metadata fields nullable unless campaign profile says otherwise.  
- Store **source**: `auto` | `user_pre` | `user_post` | `campaign`.  
- Prefer enums / ordinals over strings.  
- Version the enum sets; additive changes preferred.  
- Do not put subjective scale items in the objective measurement object (R9).

## Anti-patterns

- Long pre-flight questionnaires that kill recording starts  
- Requiring carriage numbers on fleets where numbers are invisible  
- Treating crowding self-report as occupancy telemetry  
- Silent defaults like “hand-held” when unknown  
- Blending metadata completeness into a single “trust score” with loudness  

## Decisions recommended for Wave 2 ADRs

1. **Casual pre-select = journey path only** (plus branch when needed).  
2. **Post-add recommended chips:** phone placement + front/middle/rear.  
3. **Everything else optional** unless campaign-required.  
4. **Auto-infer device, audio-session, and clock fields**; never re-ask.  
5. **Campaign profiles** are data, not hard-coded app modes — owned as config in `tunes`, enforced in `tunes-ios` / `tunes-web`.  
6. Open Q #9 → resolve as: **minimise manual entry; prefer post-recording coarse chips over pre-forms.**

## Open questions for user tests

- Will contributors actually answer two post chips if skip is easy?  
- Does asking placement **before** start improve behaviour (hand-held) more than asking after? (Hypothesis: short pre-nudge + post-confirm may win — test, don’t assume.)  
- Ordinal crowding labels: wording that travels across cultures/cities.  
- Whether “until I stop” destination reduces destination pre-select errors.

## Recommendation

Adopt a **burden budget**: pre-recording asks only for the route prior needed for alignment; after recording, offer **two recommended chips** (phone placement; front/middle/rear) and keep carriage geometry, crowding, and posture optional. Auto-infer device and session quality fields. Use **campaign-required** profiles for research density instead of burdening every commuter. Record metadata source and keep metadata confidence separate from acoustic and alignment confidence.

**Confidence:** High for the mode taxonomy and burden-budget shape; Medium for the exact “recommended” chip set until usability testing; Low for any predicted completion rates (not invented).

**Depends on experiment/legal/user-test?** **Yes** — user tests for form abandonment vs metadata completeness; privacy review of any free-text; campaign ethics if required fields expand; no legal blocker for coarse carriage chips themselves.

**Links to related docs:** [07-journey-alignment.md](./07-journey-alignment.md); [09-subjective-experience.md](./09-subjective-experience.md); [04-calibration-uncertainty.md](./04-calibration-uncertainty.md); [03-consumer-device-limits.md](./03-consumer-device-limits.md); [05-privacy-ethics.md](./05-privacy-ethics.md); [acoustic-survey-methodology.md](../acoustic-survey-methodology.md); [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md) (open Q #9); [../governance/project-charter.md](../governance/project-charter.md); `tunes-ios` [product-scope.md](../../../tunes-ios/docs/product-scope.md).
