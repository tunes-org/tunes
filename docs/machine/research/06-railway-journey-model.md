# R6 — Railway journey model

**Status:** Wave 1 research recommendation  
**Repos:** `tunes` (canonical schema + London instance data); consumed by `tunes-ios` (journey UX) and `tunes-web` (map, alignment, releases)  
**Must-read inputs:** [project-charter.md](../governance/project-charter.md), [scope-statement.md](../governance/scope-statement.md), [acoustic-survey-methodology.md](../acoustic-survey-methodology.md), [01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)

---

## 1. Decision questions

1. Should the core schema use **Tube-specific** types or **generic railway** concepts?  
2. Is **station-to-station** the right canonical public comparison unit?  
3. How do we stay **London-first** without baking London terminology into the core model?

Working assumptions this doc tests and largely confirms:

- Canonical unit = **section** (station-to-station) with explicit duration  
- **London-first portable schema**: pilot on London; core model stays generic  
- Dense coverage over shallow network-wide scrape  

---

## 2. Design principle: London as instance, not ontology

**Recommendation:** Core entities are generic. London Underground, Elizabeth line, Overground, and National Rail services appear as **instances** (systems, operators, lines, stock) under that schema.

Do **not** make `TubeLine`, `Zone`, or `UndergroundStation` the root types of the model. London-specific labels, branding, and operational quirks belong in:

- Instance data files / network definitions owned by `tunes`  
- Optional profile modules (e.g. `profiles/london.yaml`)  
- Display strings in `tunes-web` / `tunes-ios`  

ADR-002 accepts this answer to brief question #2: **generic core; London as profile**. It also keeps later cities from forking the schema.

Independence reminder: using publicly available network facts or open transport data does **not** imply TfL operation, approval, or endorsement.

---

## 3. Generic railway schema (conceptual)

The following is a decision-oriented conceptual model for Phase 1 JSON examples — not a frozen DDL.

### 3.1 Geography and governance

| Entity | Role | Notes |
| --- | --- | --- |
| **City** | Pilot geography container | e.g. London; future cities add rows, not new core types |
| **Transport system** | Named network the passenger recognises | e.g. “London Underground”, “National Rail (London terminal approaches)” |
| **Operator** | Organisation running services | May differ from system brand; multiple operators per system possible |

### 3.2 Network structure

| Entity | Role | Notes |
| --- | --- | --- |
| **Line** | Named passenger-facing route identity | Generic; not subclassed as Tube-only |
| **Branch** | Divergence within a line | Essential for Northern, District, etc.; same type elsewhere |
| **Direction** | Travel orientation on a line/branch | Prefer stable IDs + localised labels (eastbound/westbound are labels) |
| **Station** | Stop with stable ID | Shareable across systems where physically shared |
| **Platform** | Boarding face at a station | Optional for v1 map; valuable for research metadata later |
| **Section** | Directed interval between consecutive stations | Canonical comparison unit — see §4 |
| **Track / running direction** | Physical sense if known | Optional; do not require for crowd contributions |

### 3.3 Service and vehicle

| Entity | Role | Notes |
| --- | --- | --- |
| **Service / trip** | A particular run (timetabled or observed) | Links planned vs actual timing |
| **Rolling stock / train type** | Vehicle class | e.g. 1992 Tube Stock as instance data — methodology reference context, not a core type name |
| **Unit / set ID** | Specific train identity | Rare for passengers; optional research field |
| **Carriage** | Car within the unit | Index or label if known |
| **Carriage position (train)** | Front / middle / rear (approx.) | Passenger-friendly enum for R8 |
| **Position within carriage** | End / centre / doors / bogie (approx.) | Optional; affects acoustics |
| **Passenger posture** | Sitting / standing | Aligns with professional height rationale (1.2 m / 1.6 m) without requiring exact height |

### 3.4 Timing

| Field group | Role |
| --- | --- |
| **Planned timing** | Timetable expectations for boundary hints (R7) |
| **Actual timing** | Observed section `T`, dwell, holds |
| **Disruptions** | Held between stations, skipped stops, partial journeys |
| **Express / skip-stop** | Section topology may differ from “all stops” lines |

### 3.5 Measurement attachment

Acoustic observations attach primarily to:

1. **Section** (required for public comparison)  
2. **Duration `T`** for that section (required with any Leq)  
3. Optional: service/trip, stock, carriage position, posture, device/calibration (R4), perception report (R9, separate)

Platforms, exact unit IDs, and fine track models enrich research but must not block ordinary contributions.

---

## 4. Canonical unit: station-to-station **section**

### 4.1 Why this unit

Professional interior surveys report per **station-to-station** leg with transit duration (methodology notes §1.5; ISO 3381 context for in-vehicle measurement). That practice transfers cleanly to a public map:

- Passengers already think in stops  
- Sections compose into journeys  
- Duration `T` makes LAeq interpretable  
- Bidirectional reporting stays natural (A→B ≠ B→A)  

Glossary alignment: **section** = directed interval between consecutive stations, with duration.

### 4.2 Test the assumption (do not freeze blindly)

Treat section-as-canonical as a **working decision to validate**, not dogma. Pilot / prototype tests should check:

| Test | Pass signal | Fail / revise signal |
| --- | --- | --- |
| Map usefulness | Users can compare alternate paths by sections | Users only care about whole-line averages |
| Alignment UX (R7) | Boundaries editable as section chapters | Users cannot reliably assign sections |
| Sparse data | Section aggregation still honest with sample counts | Forced section stats fabricate precision |
| Holds / stalls | Exclusions or flagged sub-intervals work (cf. methodology deviation disclosure) | Section Leq polluted without remedy |
| Shared tracks / complex junctions | Section IDs remain stable | Constant redefinition / ambiguity |

**Recommendation:** Keep section canonical for public comparison through the London pilot unless tests falsify it; any change requires an ADR. Allow additional aggregates (whole line, station ambient) as **secondary** layers later — not replacements.

### 4.3 What a section record must carry

Minimum for a public comparison cell:

- `from_station_id`, `to_station_id`  
- `line_id` (+ `branch_id` when ambiguous)  
- `direction_id`  
- `duration_T` for the measurement interval used  
- Metric fields with weighting (never mix)  
- Provenance: device/calibration/processing version/quality tier  
- Uncertainty / sample-count display hooks for `tunes-web`  

Optional but valuable: stock, carriage position, load, time-of-day bucket, disruption flags.

### 4.4 Non-section intervals

Recordings will include walking, platform waits, transfers, and mid-section holds. Model these as:

- **Non-revenue / non-section intervals** trimable in review (R5 step 5), or  
- Explicitly flagged exclusions (methodology: disclose deviations)

Do not silently average platform noise into a moving-section Leq.

---

## 5. London profile (instance sketch)

Illustrative only — not a completeness claim:

| Generic entity | London examples (instances) |
| --- | --- |
| City | London |
| Systems | London Underground; London Overground; Elizabeth line; National Rail (as scoped) |
| Operators | Instance rows as applicable — not an endorsement relationship |
| Lines / branches | Central, Jubilee, Victoria, Northern (with branches), etc. |
| Sections | Stratford→Leyton style directed pairs (example pattern from methodology notes) |
| Rolling stock | Stock classes as data, e.g. historic 1992 Tube Stock references in external FOI methodology — not copied proprietary tables |

### Scope decision #1 (network breadth)

Schema portability does **not** force Underground-only or all-London-rail at launch. Breadth is a pilot-capacity and UX decision:

- **Schema:** ready for multiple London systems  
- **Launch content:** may still be Underground-priority  

Document the launch cut in an ADR when stakeholder/pilot capacity decides.

---

## 6. Identity, stability, and open data

| Concern | Guidance |
| --- | --- |
| Stable IDs | Prefer opaque stable IDs + human names as labels; names change, IDs should not |
| Shared stations | One station entity may participate in multiple systems/lines |
| Section identity | Directed pair + line/branch; document how multi-path corridors are disambiguated |
| External references | Optional links to open dataset stop IDs where licences allow — operational data ≠ endorsement |
| Versioning | Network definition versions sit beside measurement releases (R10) so old sections remain interpretable |

---

## 7. Interaction with alignment and metadata (boundaries)

This model intentionally stops where R7/R8 begin:

- **R7** consumes section topology to propose boundaries; users correct them.  
- **R8** decides which of stock / carriage / posture fields are required vs optional.  
- **R4** attaches calibration_state to the measurement, not to the network entity.  
- **R5** ensures section assignment is reviewable before upload (wrong section is a privacy and science defect).

Crowd measurements remain **survey-grade at best** even when section IDs are perfect.

---

## 8. Repo implications

| Artefact | Owner |
| --- | --- |
| Generic schema docs + JSON examples + London instance definitions | `tunes` |
| Line/branch/section pickers, correction timeline bound to sections | `tunes-ios` |
| Map geometries keyed by section IDs; aggregation queries | `tunes-web` |

---

## Recommendation

1. Adopt a **generic railway core** (city, system, operator, line, branch, direction, station, platform, **section**, stock, carriage position, timing).  
2. Represent **London as instance/profile data**, not Tube-specific core types.  
3. Treat **station-to-station sections with duration** as the canonical public comparison unit; **test** in alignment and map prototypes; change only via ADR if falsified.  
4. Keep platform waits, walks, and holds out of section Leq unless explicitly modelled/excluded.  
5. Separate launch **network breadth** (Underground-only vs wider London rail) from schema portability — schema stays ready either way.  
6. Version network definitions with dataset releases for reproducibility.

**Confidence:** High for generic-vs-Tube and section-as-default canonical unit; Medium for platform/stock field requirements and exact multi-path ID rules until R7/R8 prototypes; Medium for launch network breadth pending stakeholder/pilot capacity.

**Depends on experiment/legal/user-test?** Yes — **user-test** section comparison UX and metadata friction; **prototype tests** for alignment on branched lines and holds; legal only where external stop-ID datasets and licences are imported; no experiment blocks adopting the generic schema vocabulary now.

**Links to related docs:**

- [governance/project-charter.md](../governance/project-charter.md)  
- [governance/scope-statement.md](../governance/scope-statement.md)  
- [acoustic-survey-methodology.md](../acoustic-survey-methodology.md) (§1.5 station-to-station practice)  
- [01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md) (Q1, Q2; assumptions 1, 3)  
- [02-research-map.md](../02-research-map.md) (R6)  
- [H10 glossary](../../H10-glossary.md) (section, London-first portable schema)
- [H16 schema](../../H16-schema.md)
- [H17 portability](../../H17-portability.md)
- Current disposition: [journey-segmentation architecture](../architecture/journey-segmentation-model.md) and [ADR-002](../decisions/ADR-002-generic-railway-schema.md); related detail in R7, R8, and R10
