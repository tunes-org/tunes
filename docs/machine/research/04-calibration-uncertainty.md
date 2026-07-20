# R4 — Calibration and uncertainty

**Status:** Wave 1 research recommendation  
**Repos:** `tunes` (methodology + schema contracts); feeds quality-tier ADR and honesty UX in `tunes-ios` / `tunes-web`  
**Must-read inputs:** [acoustic-survey-methodology.md](../acoustic-survey-methodology.md), [project-charter.md](../governance/project-charter.md), [01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)

---

## 1. Decision question

How should TUNES represent **calibration state** and **uncertainty** so that passenger contributions remain useful without claiming engineering-grade (ISO 3381 / ISO 12001) parity with Class 1 surveys?

Working assumptions this doc must not casually reopen:

- Crowd in-service data is **survey-grade at best**
- **Quiet-room check ≠ calibration**
- Quality contributions use working **tiers A–E**
- Prefer honest multi-dimension confidence over a single blended “accuracy score”

---

## 2. What professional practice requires (and what we cannot copy)

From the transferable checklist in [acoustic-survey-methodology.md](../acoustic-survey-methodology.md) (informed by TfL R3291 FOI as a **methodology reference only** — not affiliation, not redistributable data):

1. Traceable, class-rated instrumentation with serials and certificate dates  
2. Field calibration **before and after** the run; discard if post-check fails  
3. Fixed, justified measurement positions/heights  
4. Controlled + disclosed conditions  
5. Canonical spatial unit = **station-to-station section** with duration `T`  
6. Layered metrics (LAeq, LCeq, LCpeak, bands) — never silently blended  
7. Full provenance (device, software version, correction factor kept explicit)  
8. Honest grade: engineering vs survey vs below-survey monitoring  

TUNES passengers will almost never have IEC 61672 Class 1 SLMs or IEC 60942 calibrators. Peer-reviewed phone SLM work (e.g. NIOSH iOS SLM validation literature) supports treating phones as **adjunct / screening** tools after characterisation — not as regulatory substitutes. Exact tolerances vary by study, device, and protocol; this programme **must not invent project-specific dB claims** until TUNES runs its own side-by-side experiments.

**Implication:** calibration in TUNES is a **stated hierarchy of evidence**, not a single offset that magically upgrades a phone to Class 1.

---

## 3. Calibration hierarchy (recommended)

Store an explicit `calibration_state` (or equivalent) on every measurement session. Higher states may inform **quality tier** eligibility; they never erase provenance of lower-layer raw observations.

| Level | Label | Meaning | Typical path into TUNES |
| --- | --- | --- | --- |
| 0 | **Unknown consumer** | Supported or unsupported phone; no model profile; no individual correction | Default first session on a new device |
| 1 | **Model profile** | Device model (+ OS family) has a published TUNES correction / response profile from controlled experiments | After programme publishes a profile for that model |
| 2 | **Field-calibrated device** | This physical device has an individual correction from a documented field protocol (not quiet-room) | Contributor calibration event or research campaign |
| 3 | **Beside reference SLM** | Concurrent measurement beside a Class 1 (or otherwise documented) reference meter on the same journey/section | Pilot / validation runs |
| 4 | **External calibrated microphone** | Phone used with a characterised external mic + stated calibrator / sensitivity chain | Optional expansion after validation |
| 5 | **Professional survey equipment** | Class-rated SLM under a documented survey protocol | Reference / Tier A anchor data |

### Mapping to working tiers A–E (inputs, not final ADR)

| Tier (working) | Calibration hierarchy (typical floor) | Notes |
| --- | --- | --- |
| **A** | Level 4–5, or Level 3 under a written protocol | Survey-grade honesty still applies for *in-service* passenger conditions |
| **B** | Level 1 with complete metadata, no major quality flags | Model-profiled consumer path |
| **C** | Level 0 on project app with complete metadata | Usable for relative / dense coverage; weak for absolute claims |
| **D** | Imported / incomplete control (e.g. Voice Memos candidates) | Lower confidence; may be excluded from map defaults |
| **E** | Manual / legacy / insufficient technical metadata | Archive or research-only |

Final tier cut-offs belong in a Wave 2 ADR. This doc only requires that **tier ≠ silent promotion**: a Level 0 reading must never display as if it were Level 5.

---

## 4. Quiet-room check is not calibration

A quiet-room (or “near-silent room”) recording can help detect:

- Obvious microphone obstruction or case muffling  
- Unexpectedly high noise floor / continuous artefact  
- Gross malfunction (dead channel, stuck gain)

It **cannot**:

- Establish absolute level accuracy against a known acoustic pressure  
- Replace a 94 dB @ 1 kHz (or equivalent) calibrator check  
- Characterise frequency response  
- Substitute for before/after field calibration used in professional surveys  

**Rule for product copy and schema:** label such checks `sanity_check` / `obstruction_screen`, never `calibrated`. Do not apply a numeric “quiet-room offset” as if it were an SLM correction.

---

## 5. Uncertainty dimensions (keep separate)

Confidence must not collapse into one universal score. At minimum, persist and (where shown) communicate these dimensions:

| Dimension | Question it answers | Typical drivers |
| --- | --- | --- |
| **Absolute** | How close is this level to a traceable reference? | Hierarchy level, reference presence, frequency response |
| **Relative** | Can I compare section A vs B on *this* device/session? | Same device, similar placement, overlapping times |
| **Repeatability** | Same conditions → similar numbers? | Device stability, handling, OS audio path |
| **Device** | How much bias/variance is model- or unit-specific? | Model profile coverage, OS version, mic path |
| **Placement** | Pocket / bag / hand / seat height effects? | User metadata, protocol adherence |
| **Algorithmic** | Metrics / band extraction / weighting pipeline uncertainty? | Processing version, clipping, AGC/voice processing flags |
| **Route-inference** | Is this energy assigned to the correct **section** and `T`? | Alignment confidence (R7), manual corrections |

### Honesty rules (non-negotiable)

- Quote levels with **weighting** and **duration `T`** (ISO 1996-1 framing).  
- Keep A / C / peak / band fields separate (methodology notes §1.6, §3.4).  
- Store **correction factor explicitly**; retain uncorrected + corrected views where a correction exists.  
- Label crowd in-service results **survey-grade at best**; never imply engineering-grade type-test parity.  
- Public map (`tunes-web`) must surface coverage + uncertainty, not colour alone.

### What relative comparison can still do well

Even at Level 0–1, dense repeated measurements on the same device can support **within-device route comparisons** if placement and flags are comparable. Absolute cross-device ranking requires higher hierarchy levels or hierarchical modelling (below) — and still remains survey-grade for in-service conditions.

---

## 6. Crowdsourced hierarchical calibration (research hypothesis)

**Hypothesis (not a launch claim):** overlapping passenger measurements on the same **sections**, with known device models and quality flags, can support a hierarchical statistical model that estimates:

- Per-model bias components  
- Per-device residual offsets (where enough repeats exist)  
- Section-level “typical” distributions with uncertainty  

This is analogous in spirit to participatory mapping practice (e.g. NoiseCapture / Noise-Planet cross-calibration culture): store hardware metadata and correction factors so *a-posteriori* adjustment is possible. It is **not** a substitute for Class 1 surveys or for TUNES’s own reference side-by-sides.

### Conditions before treating hierarchical estimates as public “corrected” levels

1. Documented model priors from controlled experiments (Level 1 profiles)  
2. Enough overlapping coverage on priority sections (dense pilot, not shallow scrape)  
3. Explicit separation of **raw observation**, **model-adjusted estimate**, and **passenger map display layer**  
4. Reprocessing creates a **new derived dataset version** (open-data rule), never silent rewrite  
5. Public language never implies TfL endorsement or regulatory substitution  

Until those conditions hold, hierarchical outputs stay in research / internal evaluation — not default map truth.

---

## 7. Experiment programme (required before strong claims)

Prefer experiments over assumed dB tolerances. Minimum programme for Wave 1→2:

| Experiment | Purpose | Feeds |
| --- | --- | --- |
| Side-by-side phone vs Class 1 SLM on representative sections | Absolute + relative characterisation | Levels 1–3; Tier A/B floors |
| Pre/post reference tone or calibrator where available | Drift detection analogue to pro method | Field-calibrated protocol design |
| Orientation / case / pocket / bag matrix | Placement uncertainty | Quality flags; protocol UX in `tunes-ios` |
| OS / audio-session interruption matrix | Algorithmic + device path uncertainty | Flags; supported-device list |
| External mic candidates (later) | Level 4 feasibility | Expansion ADR |
| Overlap density pilot on few lines | Hierarchical calibration feasibility | Whether hypothesis graduates |

Do **not** publish numeric “TUNES accuracy ±X dB” marketing until these runs are analysed and versioned.

---

## 8. Repo implications

| Concern | Owner |
| --- | --- |
| Hierarchy definitions, tier ADR, uncertainty schema, experiment reports | `tunes` |
| Capture of device metadata, sanity checks, calibration-event UX, flag generation | `tunes-ios` |
| Map honesty (sample size, tier filters, uncertainty display), reprocessing jobs | `tunes-web` |

---

## Recommendation

1. Adopt the **six-level calibration hierarchy** (unknown → model profile → field-calibrated → beside reference SLM → external mic → professional) as the schema vocabulary for every session.  
2. Treat **quiet-room / obstruction screens as non-calibration**.  
3. Persist **separate uncertainty dimensions**; refuse a single unexplained accuracy score.  
4. Use hierarchy + flags as **inputs** to tiers A–E; keep in-service crowd data labelled **survey-grade at best**.  
5. Treat **crowdsourced hierarchical calibration as a research hypothesis** gated on experiments and versioned derived layers — not a launch claim.  
6. Run the side-by-side experiment programme before any absolute public accuracy claims.

**Confidence:** High for hierarchy vocabulary, quiet-room rule, and multi-dimension uncertainty; Medium for exact tier cut-offs and hierarchical model readiness until pilots run.

**Depends on experiment/legal/user-test?** Yes — acoustic side-by-sides and dense overlap pilots are mandatory for Levels 1–3 claims and for graduating the hierarchical hypothesis; user tests for placement-protocol compliance; no legal blocker specific to calibration itself.

**Links to related docs:**

- [acoustic-survey-methodology.md](../acoustic-survey-methodology.md)  
- [02-research-map.md](../02-research-map.md) (R4)  
- [01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md) (Q6, Q8; assumptions 4, 6)  
- [governance/project-charter.md](../governance/project-charter.md)  
- [governance/scope-statement.md](../governance/scope-statement.md)  
- Downstream: R2 acoustic methodology; R3 consumer-device limits; R7 journey alignment; Wave 2 calibration / tiers ADRs; `03-architecture` calibration model  
