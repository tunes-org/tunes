# R10 — Open data and reproducibility

**Status:** Wave 1 research recommendation  
**Audience:** Maintainers of `tunes` releases; pipeline authors in `tunes-web`; schema consumers in `tunes-ios`  
**Non-goals:** Invented coverage stats; implying operator endorsement; shipping product code in this doc

---

## 1. Decision question

How should TUNES publish passenger-generated acoustic evidence so that:

1. A release is **citable and auditable**
2. Reprocessing does **not** silently rewrite history
3. Layers stay honest (observation ≠ metric ≠ interpretation)
4. Ownership stays clear across the three repos

**Accepted constraints (do not reopen casually):**

- Open releases and citation live in **`tunes`** ([repos.md](../governance/repos.md))
- Pipeline runtime lives in **`tunes-web`**; capture in **`tunes-ios`**
- Prefer **derived** payloads over raw audio ([01-assumptions](../01-assumptions-and-open-questions.md))
- No implied TfL endorsement ([project-charter](../governance/project-charter.md))
- Licences provisional until legal review ([licences.md](../governance/licences.md))

---

## 2. Why reproducibility is a product feature

TUNES’s public value is not only a map. The charter puts equal weight on a **versioned public dataset** and methodology. Crowd in-service measurements are **survey-grade at best**. Without provenance, version pins, and quality flags, a map invites false precision; without immutable release semantics, researchers cannot cite what they used.

Professional practice (methodology notes from TfL R3291 as **reference only**, not redistributable data) already shows the pattern: name instruments, calibration state, analysis software version, exclusions, and section durations. TUNES must adapt that discipline to consumer devices and voluntary contributors — not claim Class 1 equivalence.

---

## 3. Ownership and flow

```text
tunes-ios   →  derived uploads (+ optional restricted tiers later)
tunes-web   →  validate, aggregate, map runtime, pipeline jobs
tunes       →  schema contracts, methodology, **canonical open releases**
```

| Artifact | Canonical home | May also appear in |
| --- | --- | --- |
| Schema definitions & changelogs | `tunes` | Consumed by ios/web |
| Public dataset packages + DOI/citation | `tunes` | Linked from web UI |
| Pipeline job code | `tunes-web` | Version string recorded in releases |
| Capture app builds | `tunes-ios` | Device/app version recorded in contributions |
| Map tiles / API serving | `tunes-web` | Must declare which release ID they surface |

**Decision:** `tunes-web` may **host mirrors or download UIs**, but the authoritative release record (manifest, licence, schema pin, changelog) is owned by **`tunes`**. Silent “the map changed, so the data changed” without a new release ID is a bug.

---

## 4. Three data layers (do not collapse)

Keep these separable in schema, export, and claim language.

### Layer A — Observations (contribution records)

What a contributor submitted after local review and consent. Prefer **derived features** (levels, spectra summaries, timing, section IDs, metadata). Raw PCM stays on-device by default (open Q #4–5).

Minimum provenance fields (conceptual — exact names in schema ADR):

- Contribution / session ID
- Schema version the client encoded against
- App version (`tunes-ios`) and OS / device model class
- Capture mode / mic path (as known)
- Calibration / check status (quiet-room check ≠ calibration; see R4)
- Journey alignment confidence / correction flags (R7)
- Consent timestamp and scope
- Quality tier label (working A–E; see assumptions)
- Optional: GPS policy used (e.g. topology snap only underground)

### Layer B — Derived metrics (pipeline outputs)

Aggregations and section-level summaries produced by **named pipeline versions** in `tunes-web`:

- Station-to-station section metrics with **duration**
- Sample counts, filters applied, exclusions
- Uncertainty / spread descriptors (not a single false-precise “the dB”)
- Objective metrics only — no blended “comfort score”

### Layer C — Passenger interpretations (subjective)

Perception survey responses, kept **structurally separate** from Layer B. Never average into an unexplained single score (assumption #5; R9).

**Decision:** Public map defaults should surface Layer B with quality and uncertainty cues; Layer C only as clearly labelled perception overlays or separate views. Layer A is for researchers / reproducibility, not for naive “loudness” pins without context.

---

## 5. Versioning contracts

### 5.1 Schema version

- SemVer (or documented equivalent) on the contribution and section schemas
- Breaking changes → new major; clients must declare which major they wrote
- London network instances may version separately from the **generic railway core** (portable schema assumption)

### 5.2 Pipeline version

- Every Layer B artifact pins `pipeline_version` (and preferably git commit / release tag of `tunes-web` jobs)
- Analysis software/library versions that affect metrics belong in the release manifest

### 5.3 Dataset release ID

- Immutable package: e.g. `tunes-london-YYYY.MM.N` or UUID + human label
- Manifest must include: schema version(s), pipeline version, licence, generation time, geographic/network scope, known limitations
- Citation string recommended in README of the release

### 5.4 Device and calibration context

Record enough to explain disagreement between contributions without inventing correction factors:

- Device class / OS version (as available)
- Whether a quiet-room check ran; result band if any
- Whether any external calibrator / Class-rated reference was used (rare; higher tier)

Do **not** silently “correct” all phones to a fictitious ground truth without a published method and a **new** derived release.

---

## 6. Quality flags and uncertainty

Honest crowd data needs machine-readable honesty:

| Flag / field type | Purpose |
| --- | --- |
| Quality tier | Survey-grade honesty; filters for map vs research export |
| Exclusion reason | Deviations (doors open long dwell, non-running, user discarded segment) |
| Alignment confidence | Topology snap / manual correction reliability |
| Coverage / n | Counts behind a section summary — refuse to hide empty cells as quiet |
| Spread / range | Percentiles or IQR-style descriptors when n allows; otherwise “insufficient” |
| Claim language tag | What this field may be called (loudness metric vs discomfort vs risk) — align with R2 / claim ADR |

**Decision:** Prefer **small valid releases** over large misleading ones. Empty or low-n sections should be explicit, not interpolated into confident colours.

Uncertainty is multi-dimensional (device, alignment, load, position, method). Do not collapse to one σ without stating what it covers (R4).

---

## 7. Reprocessing rule (non-negotiable)

When methodology, filters, or pipeline code change:

1. **Do not** overwrite a published release in place
2. Re-run → emit a **new** derived dataset release with a new ID
3. Document parent release(s) and changelog of method deltas
4. Map / API should pin or clearly switch to a release; “latest” must resolve to an ID

Raw contribution store (if retained under privacy rules) may be re-derived repeatedly; each public package is a **snapshot of a method**, not a mutable blob.

This mirrors scientific practice: revised analysis = new paper/version, not silent PDF replacement.

---

## 8. Licences and third-party material

Provisional planning assumption ([licences.md](../governance/licences.md)):

| Asset | Provisional |
| --- | --- |
| App code | MIT or Apache-2.0 |
| Docs / methodology in `tunes` | CC BY 4.0 |
| Public datasets | CC BY 4.0 or CDLA-Permissive |

**Hard rules:**

- Do **not** redistribute TfL R3291 or other non-open operator reports inside data packages; cite as methodology reference only
- Do **not** mix proprietary operator datasets into open packages without explicit licence compatibility
- Machine-readable licence + attribution in every release manifest
- Legal review **before** first public publish (open Q #12)

Independence goal: prefer licences that allow civic and academic reuse without a non-commercial trap that later conflicts with partnerships (see R11).

---

## 9. Export shapes

Offer at least:

1. **Research package** — Layer A (derived observations) + Layer B + Layer C, with full provenance columns  
2. **Map package** — Layer B section summaries + quality/uncertainty fields only  
3. **Schema + methodology bundle** — docs and JSON Schema / OpenAPI-style contracts from `tunes`

Formats: prefer open tabular + JSON for machine use; document encodings. Do not require proprietary GIS to read core metrics.

Exports must state: schema version, pipeline version, release ID, licence, generation timestamp.

---

## 10. Privacy interaction

Reproducibility must not fight the privacy default:

- Derived-only public releases by default
- Strip or generalise fields that re-identify individuals (exact timestamps + rare routes; device serials; free-text that names people)
- Retention and controller roles are open (additional open questions in [01](../01-assumptions-and-open-questions.md)); they constrain how long Layer A can be reprocessed
- If a restricted raw-audio tier ever exists, it is **not** part of the default open release

Detail belongs in R5 / privacy ADR; this doc only requires that open packages are designed as **derived, versioned, and minimised**.

---

## 11. Operational checklist before a public release

- [ ] Schema version frozen and tagged in `tunes`
- [ ] Pipeline version pinned; jobs reproducible from that pin
- [ ] Manifest complete (licence, scope, limitations, parent releases)
- [ ] Quality tier and uncertainty fields present; map claim language reviewed
- [ ] No proprietary third-party reports embedded
- [ ] Legal sign-off on licence and controller statements
- [ ] Changelog explains method deltas vs previous release
- [ ] Citation guidance published alongside download

---

## 12. Open items for Wave 2 ADRs

- Exact schema field names and SemVer policy  
- Whether contribution store is re-derivable indefinitely or time-limited  
- DOI / archive host (Zenodo, institutional, self-hosted)  
- Fraud / duplicate handling without punishing honest edge cases  
- How “latest” on the map maps to release IDs in UX copy  

---

## Recommendation

Adopt **immutable, versioned releases owned by `tunes`**, with three explicit layers (observations / derived metrics / passenger interpretations), mandatory pins for **schema + pipeline + device/calibration context**, machine-readable **quality and uncertainty**, and a hard rule that reprocessing creates a **new** derived dataset. Prefer derived exports; keep raw audio off the open release path by default. Treat licences as provisional until legal review; never package non-open operator reports.

**Confidence:** High for ownership, immutability, and layer separation (aligned with charter and repos). Medium for exact export formats and archive host. Low for final licence text until legal.

**Depends on experiment/legal/user-test?** **Legal** for licences and controller/retention. **Architecture ADR** for schema/pipeline pins. Experiments (R3/R4) inform which device/calibration fields are meaningful; not required to accept the immutability rule.

**Links to related docs:**

- [../governance/project-charter.md](../governance/project-charter.md)
- [../governance/repos.md](../governance/repos.md)
- [../governance/licences.md](../governance/licences.md)
- [../governance/scope-statement.md](../governance/scope-statement.md)
- [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)
- [../02-research-map.md](../02-research-map.md)
- [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md)
- [04-calibration-uncertainty.md](./04-calibration-uncertainty.md) (when written)
- [05-privacy-ethics.md](./05-privacy-ethics.md) (when written)
- [11-funding-partnerships.md](./11-funding-partnerships.md)
