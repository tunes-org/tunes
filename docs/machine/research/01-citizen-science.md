# R1 — Citizen science: trust, validation, and governance

Decision-oriented research for TUNES Wave 1. Practices transferable from environmental monitoring, participatory noise mapping, public mapping, and biodiversity-style observation projects. **Do not invent success rates or claim empirical outcomes TUNES has not measured.**

**Owns:** programme posture for contributor trust, validation, moderation, motivation, fraud resistance, and uncertainty communication — decisions that bind all three repos via ADRs in `tunes`.

**Does not own:** acoustic metric definitions (R2), device limits (R3), privacy/legal controller roles (R5), open-release mechanics (R10).

---

## 1. Decision question

What governance and validation posture should TUNES adopt so passenger contributions remain usable for research and quieter-journey comparison **without** implying engineering-grade accuracy, operator endorsement, or false precision?

Related open questions (assumptions doc): duplicate/fraud thresholds; ethics review before public beta campaigns; how quality tiers appear on the public map.

---

## 2. What “citizen science” means here

TUNES is not a replacement for Class 1 operator surveys. It is a **repeated, real-world passenger sensing programme**: ordinary journeys, consumer devices, optional perception reports, versioned open releases.

That framing matches participatory environmental sensing more than regulatory compliance monitoring:

| Trait | Implications for TUNES |
| --- | --- |
| Heterogeneous devices | Tier contributions; never silent equivalence |
| Volunteer effort | Minimise friction; reward usefulness, not volume alone |
| Public map consumers | Uncertainty and sample size must be visible |
| Open data consumers | Provenance, versions, and quality flags must travel with data |
| Independent civic project | No implied TfL endorsement; operator usefulness ≠ affiliation |

**Repo split:** `tunes` defines rules and releases; `tunes-ios` enforces collection and local review UX; `tunes-web` enforces honesty on map/pipeline (coverage, tiers, caveats).

---

## 3. Transferable practices (without fake metrics)

Drawn from established project *patterns* (e.g. participatory noise mapping such as NoiseCapture / Noise-Planet protocol ideas; OpenStreetMap-style community mapping; biodiversity observation programmes such as eBird / iNaturalist-style verification culture). Cite methods, not invented conversion rates.

### 3.1 Contributor trust

- **Local-first agency:** record → review → consent → upload. Trust starts with showing exactly what leaves the device (prefer **derived features**).
- **Transparent method over brand authority:** publish methodology, claim limits, and quality-tier definitions in `tunes` docs; the map must link to them.
- **Identity light:** prefer pseudonymous contribution IDs over social-login theatre; reputation should improve data handling, not create a public leaderboard that rewards gaming.
- **Role clarity:** distinguish casual contributors, campaign volunteers, and research partners. Different campaigns may require different consent and ethics paths (see R5).

### 3.2 Data validation (layered, not one score)

Borrow the multi-check habit of mature mapping/biodiversity projects: automated filters, peer or expert review for edge cases, and disclosed exclusions.

Recommended validation layers for TUNES:

1. **Device/session integrity** (ios): clipping, interruption, voice-processing mode, Bluetooth route, obstructed mic, pocket/bag flags — emit quality flags, don’t silently “fix.”
2. **Journey plausibility** (web pipeline + ios correction UX): impossible speeds, missing section assignment, mixed walking/station segments, branch ambiguity — surface for user correction before upload when possible.
3. **Acoustic sanity** (pipeline): empty/near-floor runs, pathological spectra, duration too short for a claimed **station-to-station section**, metric fields incomplete (missing duration `T` with any Leq).
4. **Cross-observation consistency** (research, later): overlapping sections and times can support *relative* calibration research (R4) — not automatic trust of absolute levels.
5. **Human review queues** (ops): campaign-critical or disputed sections; never required for every casual upload if automated layers + tiers are honest.

Confidence must remain **multi-dimensional** (acoustic level, frequency content, journey assignment, device calibration, metadata, subjective response) — not collapsed into one unexplained score. Objective metrics and subjective perception stay separate (charter / glossary).

### 3.3 Calibration vs quiet-room checks

Citizen-science programmes often over-claim “calibration.” TUNES working assumption: **quiet-room check ≠ calibration**. Quiet-room checks may flag obstruction, odd noise floor, or malfunction. Absolute accuracy belongs to R4’s hierarchy (unknown device → model profile → field offset → external mic → professional reference).

Public communication: never say “calibrated iPhone” without stating *what* was done and which **quality tier** (A–E working labels) applies.

### 3.4 Reputation systems — use carefully

Useful patterns:

- Soft reputation for **review completion**, correction diligence, and low fraud-flag rates.
- Campaign badges for methodology compliance (e.g. phone-in-hand protocol), not for “most recordings.”

Avoid:

- Public competitive rankings that incentivise fabricated journeys.
- Hiding low-tier data behind a reputation wall without labelling why it is excluded.

### 3.5 Moderation

Moderation covers **data integrity and community conduct**, not “censoring loud routes.”

- Auto-hold uploads that fail hard integrity checks.
- Soft-downrank or exclude from passenger-facing aggregates when quality flags fire (still keep in research layers with flags).
- Code of conduct for harassment / misuse of forums; scientific disagreement goes through issue trackers and ADRs, not silent deletion of inconvenient measurements.
- Disclose when campaign data or professional reference runs are mixed into public views.

### 3.6 Open licensing and governance

- Provisional licences live in `tunes` governance docs; citizen contributors need plain-language consent that matches licence and retention.
- Methodological disputes resolve via ADRs in `tunes`, not silent edits of peer research docs.
- Long-term maintenance: versioned releases, changelogs, and reprocessing that creates **new derived datasets** rather than rewriting history (R10).

### 3.7 Motivation (design for ordinary commutes)

Transferable motivators from successful volunteer sensing:

- **Personal utility first:** quieter-journey comparison for the contributor’s own routes.
- **Visible impact:** coverage maps that show where *more samples* help, without shaming sparse areas into false colour certainty.
- **Low friction:** minimise mandatory metadata (R8); protocol tips over long forms.
- **Respect for time:** offline-first collection; review after the journey.
- **Community belonging** without requiring constant social posting.

Do not promise health outcomes, operator fixes, or “official” status as motivators.

### 3.8 Handling disagreement

Expect disagreement between: devices; seated vs standing; crowded vs empty cars; perception vs metrics; passenger data vs professional surveys.

Practice:

- Keep metrics layered (R2); don’t average A/C/peak/octave into one blended claim.
- Publish both medians and spread when aggregating **sections**; show sample size.
- Treat professional surveys (including FOI methodology references) as **reference methods**, not as a mandate to silence crowd variance.
- Document exclusions the way professional surveys do (conditions and footnotes) — honesty over completeness theatre.

### 3.9 Fraud and low-quality submissions

Threats (illustrative categories, not measured rates):

- Fabricated timestamps / impossible journeys
- Pocket recordings labelled as held-phone protocol
- Duplicate spam uploads
- Synthetic audio or replayed files (especially if Voice Memos / imports are allowed as lower tiers)
- Strategic gaming if any public ranking exists

Defences:

- Prefer **derived-only** uploads by default (harder to launder identifiable raw audio; still need integrity checks on features).
- Session provenance: device model, OS, app version, processing pipeline version, quality flags.
- Idempotent upload and duplicate detection (R10 / architecture).
- Tier demotion for imports and incomplete control (Tier D working label for Voice Memos-style paths — finalize in R3/R4 ADRs).
- Do not punish honest edge cases (delays, held trains, late start) — those are **journey-alignment** problems (R7), not fraud.

Thresholds for auto-reject vs flag-for-review remain an **open experiment / ops decision**; document them when chosen.

### 3.10 Communicating uncertainty

Passenger-facing honesty rules (bind `tunes-web`):

- Show coverage, sample size, recency, and quality-tier mix — not only a colour.
- Label crowd in-service data as **survey-grade at best**.
- Separate “quieter on average in our samples” from health risk / regulatory exposure claims.
- Prefer intervals / ranges / “insufficient evidence” states over false precision.
- Colour must not be the only quality indicator (accessibility).

Research-facing honesty:

- Export quality flags and confidence dimensions with every record.
- Never silently bake correction factors into published levels without retaining raw-adjusted provenance (methodology notes).

---

## 4. Recommended posture (decision draft)

| Topic | Recommendation |
| --- | --- |
| Validation | Layered automated checks + user correction + optional human review for campaigns |
| Reputation | Soft, private-ish diligence signals; no competitive public volume leaderboards at launch |
| Moderation | Integrity and conduct; disclose campaign vs casual; ADR for science disputes |
| Motivation | Personal utility + honest coverage needs; no official-affiliation framing |
| Fraud | Derived-default + provenance + duplicate/journey checks; tier demotion for weak control |
| Uncertainty UX | Multi-dimension confidence; survey-grade labelling; sample size always visible |
| Tiers | A–E working labels must appear in map legend and open data; low tiers never silently equal Tier A |

**Quality tiers (working labels — finalize with R4):**

| Tier | Intent |
| --- | --- |
| A | Professional reference or validated external mic under documented protocol |
| B | Supported consumer model with experimentally established correction profile |
| C | Project app on unprofiled device; complete metadata; no major quality warnings |
| D | Import / incomplete session / reduced processing control |
| E | Manual / legacy / insufficient technical metadata |

---

## 5. What TUNES should *not* copy blindly

- Biodiversity “research-grade” badges that imply taxonomic certainty — our analogue is acoustic/journey confidence dimensions, not a single badge.
- Mapping karma that rewards edit volume — volume without protocol compliance harms acoustics.
- Closed moderation without public method docs — undermines the open-science half of the charter.

---

## 6. Repo implications

| Repo | Citizen-science obligations |
| --- | --- |
| `tunes` | Charter, ADRs, tier definitions, contributor terms, release notes, methodology |
| `tunes-ios` | Protocol prompts, quality flags, local review, consent UX, offline collection |
| `tunes-web` | Honest aggregation, uncertainty UI, moderation tooling, public caveats, non-affiliation |

---

## Recommendation

Adopt a **trust-through-transparency** citizen-science posture: local review and derived-default uploads; layered validation with multi-dimensional confidence; soft reputation for diligence not volume; quality tiers A–E visible on map and in open data; fraud handled via provenance and plausibility checks without punishing honest journey edge cases. Resolve thresholds and ethics-review triggers in Wave 2 ADRs after R5 and pilot ops design — do not invent numeric success rates to justify launch readiness.

## Confidence

**Medium–High** for qualitative posture (aligned with charter and participatory sensing practice). **Low** for specific fraud thresholds, reputation weights, and ethics-review timing until legal/ops input.

## Depends on experiment/legal/user-test?

**Yes.** User tests for review/consent friction (R8/R9); legal for controller roles and contributor terms (R5, licences); pilot experiments for duplicate/fraud false-positive rates; optional ethics review before public recruitment campaigns.

## Links to related docs

- [../governance/project-charter.md](../governance/project-charter.md)
- [../02-research-map.md](../02-research-map.md)
- [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)
- [../00-index.md](../00-index-full.md) — shared glossary
- [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md) — survey-grade honesty; participatory protocol notes
- [02-acoustic-methodology.md](./02-acoustic-methodology.md)
- [03-consumer-device-limits.md](./03-consumer-device-limits.md)
- [../governance/code-of-conduct-outline.md](../governance/code-of-conduct-outline.md)
- Downstream: R4 calibration/uncertainty; R5 privacy/ethics; R10 open data; map honesty ADRs
