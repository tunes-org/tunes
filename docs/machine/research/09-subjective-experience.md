# R9 — Subjective passenger experience (perception survey)

**Status:** Wave 1 research recommendation  
**Instrument definition / claim language:** `tunes`  
**Survey UX timing and presentation:** `tunes-ios`  
**Aggregation and map layers:** `tunes-web` (must not blend unexplained scores)

## Problem

TUNES measures **acoustic conditions** and **passenger experience**. Those are related but not the same. A section can be energetically loud yet tolerable, or moderately loud yet sharp, screechy, or conversation-destroying. Parents and sensory-sensitive travellers often care about **character and coping**, not only a single level.

Open question #10: collect perception **during vs after** the journey? Programme lean: **after**. Open question #11 (claim language) intersects: discomfort and “risk” wording must not outrun evidence.

Working assumption #5: **objective ≠ subjective** in the data model; no unexplained blended score ([01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)).

## What this survey is — and is not

| Is | Is not |
| --- | --- |
| Optional structured **perception** report tied to confirmed sections or a whole session | A star-rating popularity contest for lines |
| Separate layer beside derived acoustic features | A substitute for Leq / spectra / events |
| Useful for research on annoyance, speech interference, child suitability | A clinical hearing or health diagnosis tool |
| Versioned instrument with stable item IDs | Free-text venting as the primary measure |
| Eligible for its own confidence / coverage display | Proof that a route is “safe” or “unsafe” |

Passenger reports are **first-person experience under stated conditions** (device placement, crowding, headphones, etc.), not votes to rank operators. TUNES remains independent and **not TfL-endorsed**.

---

## Timing: after, not during (default)

### Why after is preferred

- Recording UX must stay **eyes-free** and safe on moving trains.  
- Mid-journey questionnaires increase handling noise and distraction.  
- Perception of a section often crystallises after the interval ends (contrast effects are real in annoyance research literature; TUNES should not claim a specific bias magnitude without study).  
- Alignment confirmation (R7) should precede section-linked ratings so users know **what** they are rating.

### Allowed exceptions

| Mode | When | Constraint |
| --- | --- | --- |
| **Session-end survey (default)** | After stop + alignment review | Whole-journey items and/or per-section list |
| **Per-section quick mark (experimental)** | Optional one-tap “notable discomfort” while riding | Must not require reading scales mid-tunnel; campaign/experiment only |
| **During** full Likert battery | Not for v1 casual mode | Rejected as default |

**Decision lean:** ship **post-journey optional survey**; keep mid-ride interaction to non-survey status (recording health only) unless a named experiment says otherwise.

---

## Instrument design (structured, not popularity)

### Design rules

1. **Short core, optional depth** — a 30–60 second core; expand for campaigns.  
2. **Ordinal scales with labelled anchors** — not stars-only, not binary likes.  
3. **Section reference clarity** — “this journey” vs “section X→Y” must be explicit.  
4. **Allow skip / prefer not to say** on every item.  
5. **No forced ranking** of lines against each other in the contributor UI.  
6. **Separate items for separate constructs** — do not average discomfort + child suitability + avoid-future into one public “score” without a published model (and even then, prefer showing components).  
7. **Version the instrument** (`perception_instrument_id` + version); never silently rescale historical answers.

### Recommended core constructs (v1 candidate)

Exact wording to be finalised with accessibility advisors and user tests; constructs below are the decision targets:

| Construct | Intent | Notes |
| --- | --- | --- |
| **Overall discomfort** | Global affective load | Primary optional item |
| **Perceived loudness** | Subjective level | Distinct from measured LAeq |
| **Sharpness / piercing quality** | High-frequency / tonal bite | Complements spectra; not a lab sharpness claim unless method cited |
| **Rumbling / low-frequency heaviness** | LF character | Optional core or depth |
| **Screech / squeal noticeability** | Event character | May be section-linked |
| **Speech interference** | Talk / announcement difficulty | High passenger value |
| **Child suitability** (felt) | Caregiver planning signal | Clearly labelled as **felt suitability**, not safety certification |
| **Avoid in future** | Behavioural intention | Not a popularity downvote of the operator |

### Depth / campaign items (optional)

- Painfulness / ear-cover urge  
- Vibration felt through body/seat  
- Intermittency / startle  
- Fatigue / after-effect  
- Difficulty hearing announcements (vs conversation)  
- Headphones-on vs headphones-off context (link R8)

### Explicitly out of core casual survey

- Medical symptom checklists  
- Diagnoses (tinnitus severity scales, etc.) without ethics pathway  
- Open political complaints as structured data  
- “Rate TfL” or operator NPS-style items  

---

## Objective vs subjective in the model

```text
Contribution
├── objective_acoustic   (derived features, tiers, quality flags)
├── journey_alignment    (sections, durations, alignment confidence)
├── passenger_metadata   (placement, carriage, crowding, …)
└── perception_report?   (instrument version, items, scope: session|section[])
```

Rules:

- Public map may show **side-by-side** layers (e.g. measured level distribution vs reported discomfort) with independent sample sizes.  
- **Forbidden:** one unexplained colour that mixes dB and survey.  
- **Allowed later:** published, cited composite indices with formula, inputs, and limitations — as a **third derived layer**, versioned, never overwriting raw items or acoustic features.  
- Claim language: prefer “reported discomfort”, “reported speech interference”, “felt child suitability”; avoid “acoustic risk”, “harm”, “unsafe” unless a separate ADR and evidence bar are met (open Q #11).

## Attachment scope

| Scope | Use |
| --- | --- |
| **Session-level** | Default for short surveys; lowest burden |
| **Per confirmed section** | Better science; more taps — offer for multi-section trips or campaigns |
| **Event-linked** | Optional mark near detected squeal/peak — experimental |

If the user rates only session-level, do not fabricate per-section perception by copying the session score into every section.

## Popularity vote vs perception measurement

| Popularity pattern | Perception pattern (TUNES) |
| --- | --- |
| Stars, likes, upvotes | Labelled ordinal constructs |
| Rank routes to crown a winner | Describe experience under conditions |
| Incentivise extreme scores for visibility | No gamified “harshest reviewer” rewards |
| Aggregate as mean stars only | Report distributions, n, instrument version |
| Ignore context | Join to metadata + acoustics for analysis |

Community mechanisms (challenges, coverage) must not reward extreme subjective scores ([research-plan.md](../research-plan.md) contributor community caution).

## Privacy and ethics

- Perception answers can be sensitive (child suitability, pain, avoidance). Treat as personal data in the privacy model (R5).  
- Default upload still **after consent** with field-level preview.  
- Prefer enums over free text; if free text exists, extra retention/moderation rules.  
- Children as **subjects of rating** (“suitable for a child”) ≠ children as **contributors**; under-age contribution needs separate rules.  
- Ethics review may be required before campaigns that recruit clinical or vulnerable cohorts — flag for partnership / legal track (R11), not blocked for a minimal optional commute survey of adults.

## UX ownership (`tunes-ios`)

Flow placement in the existing privacy client sequence:

1. Record locally  
2. Process / infer sections  
3. User corrects alignment  
4. **Optional:** perception survey (core chips)  
5. Optional metadata chips (R8) — order may swap with (4); test which abandons less  
6. Upload preview → consent → derived upload (including perception items if selected)

Accessibility: Dynamic Type, VoiceOver labels, no colour-only scale meaning, one-handed taps.

## Aggregation honesty (`tunes-web`)

Display when perception layer is on:

- Instrument version  
- n reports (session vs section scope counted honestly)  
- Distribution, not only mean  
- Filter by time-of-day / crowding metadata when available  
- Clear separation from acoustic layers  
- Caveat: self-selected contributors; not a population census  

Do not imply operator endorsement of findings.

## Decisions recommended for Wave 2 ADRs

1. **Default timing = after journey**, post-alignment; not during.  
2. **Survey optional** for casual contributions; campaigns may require it.  
3. **Separate perception object** in schema; never blend into acoustic metric records.  
4. **Core constructs** as in the table above; final copy via user test + advisor review.  
5. **No popularity UI**; no operator NPS.  
6. **Claim language ADR** must vet “risk”, “harm”, “safe for children” before public map copy.  
7. Open Q #10 → **after**.  

## Open questions

- Session-only vs prompting per-section on long trips (usability vs resolution).  
- Scale length (5 vs 7) — choose via test, don’t invent psychometrics here.  
- Whether “avoid in future” should be section-scoped only (more actionable).  
- Need for ethics approval before public beta perception prompts (legal/stakeholder).

## Recommendation

Ship an **optional, post-journey structured perception survey** in `tunes-ios`, completed after section alignment, with a short core (discomfort, perceived loudness, sharpness, speech interference, felt child suitability, avoid-in-future) and campaign depth items. Keep perception in a **separate model object and map layer** from objective acoustics; never reduce TUNES to star ratings or an unexplained blended score. Treat wording as experience reports, not health or safety certification, and version the instrument for reproducibility.

**Confidence:** High for after-vs-during and objective/subjective separation; Medium for exact core item list and scale anchors until user testing and claim-language ADR; Low for any population representativeness claim.

**Depends on experiment/legal/user-test?** **Yes** — usability tests for length and timing; accessibility review of wording; claim-language ADR (open Q #11); legal/ethics check before clinical or child-focused campaigns; not required to draft the schema separation itself.

**Links to related docs:** [08-passenger-metadata.md](./08-passenger-metadata.md); [07-journey-alignment.md](./07-journey-alignment.md); [02-acoustic-methodology.md](./02-acoustic-methodology.md); [05-privacy-ethics.md](./05-privacy-ethics.md); [10-open-data-reproducibility.md](./10-open-data-reproducibility.md); [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md) (open Q #10–11); [../governance/project-charter.md](../governance/project-charter.md); [../governance/scope-statement.md](../governance/scope-statement.md); `tunes-ios` [privacy-client-flow.md](../../../../tunes-ios/docs/privacy-client-flow.md); `tunes-ios` [product-scope.md](../../../../tunes-ios/docs/product-scope.md).
