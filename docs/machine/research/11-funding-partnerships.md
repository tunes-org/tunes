# R11 — Funding and partnerships (useful without affiliation)

**Status:** Wave 1 research recommendation  
**Audience:** Programme leads; anyone drafting MoUs, grant bids, or public claim language  
**Non-goals:** Invented impact metrics; assuming TfL approval or endorsement; committing to specific funders by name as decided partners

---

## 1. Decision question

How should TUNES relate to operators, authorities, universities, charities, and funders so that:

1. Passenger and research value grow without **implied endorsement**
2. Evidence offered to professionals is **useful and honest**
3. Funding does **not** capture open data or silence inconvenient findings
4. Ethics and legal timing match campaign ambition

**Accepted constraints:**

- TUNES is **independent**; not operated, approved, or endorsed by Transport for London ([project-charter](../governance/project-charter.md))
- Professional practice notes (e.g. TfL R3291 via FOI) may inform methodology as **references**, not affiliation or redistributable data
- Open releases owned by **`tunes`**; apps in sibling repos ([repos.md](../governance/repos.md))
- Prefer derived over raw; refuse unexplained health/risk scores until justified ([01-assumptions](../01-assumptions-and-open-questions.md))

---

## 2. Relationship model: adjacent, not affiliated

Think in **lanes**, not a single “partner” label.

| Lane | Typical orgs | What “good” looks like | What to avoid |
| --- | --- | --- | --- |
| **Operator / authority awareness** | TfL, Network Rail (as relevant), GLA transport policy teams | They can read open methods and datasets; optional technical conversations; FOI/open-data hygiene respected | Logos implying endorsement; “official TfL noise map”; co-branded claims without written scope |
| **Academic collaboration** | Universities, research groups (acoustics, HCI, transport, public health **methods** — not clinical claims) | Joint methods papers; ethics pathways; calibration experiments; student projects under TUNES licences | Exclusive data lock-ups; delayed publication that blocks open releases |
| **Civic / charity** | Sensory / accessibility orgs, parent groups, open-data NGOs | Needs validation; inclusive UX; honest claim language | Over-promising quieter journeys; fundraising copy that invents stats |
| **Funding** | Research councils, foundations, civic tech funds, university seed | Cash + time for pilots, ethics, open infrastructure | Grant terms that forbid open publication or require operator approval of results |

**Decision:** Default public language is **independent citizen / research programme**. Any deeper relationship needs a written scope that preserves non-affiliation and open-release rights (R10).

---

## 3. What evidence is useful to operators (without being them)

Operators already run (or can procure) Class-rated surveys. TUNES should not sell itself as a cheaper Class 1 substitute. Useful adjacent evidence tends to be:

1. **Repeated in-service coverage** across times of day, loads, and carriage positions that one-off engineering runs rarely sample densely  
2. **Passenger-reported problem recurrence** — where subjective complaints cluster *alongside* (not blended into) objective section metrics  
3. **Spatial/temporal hotspots as hypotheses** — ranked sections for follow-up professional measurement, not regulatory proof  
4. **Method transparency** — schema, quality tiers, uncertainty, exclusions, pipeline versions so staff can dismiss or trust knowingly  
5. **Portable comparison units** — station-to-station sections with duration, aligned with practice they already recognise in methodology notes  

Useful packaging for a professional reader:

- Versioned open release (R10) with clear limitations  
- Quality-filtered subset (e.g. higher tiers only) as an optional export  
- Separation of objective metrics vs perception  
- Explicit “not engineering-grade / not regulatory” framing  

Do **not** invent coverage percentages or dB deltas in outreach. Cite only measured releases once they exist.

---

## 4. What makes operators and authorities cautious

Anticipate friction; design partnership asks accordingly.

| Caution | Why it arises | TUNES response |
| --- | --- | --- |
| **Reputation / media** | “Noise map” headlines may be read as official failure | Honest UX; refuse false precision; non-affiliation in every public surface |
| **Method quality** | Consumer phones ≠ Class 1 | Quality tiers; uncertainty; charter limits; cite standards applicability in R2 |
| **Liability / complaints** | Crowdsourced data used in disputes | Claim-language ADR; no unsupported health risk scores |
| **Data protection** | Voice / location / journey patterns | Derived-only default; local review; R5; controller clarity |
| **Brand capture** | Public assumes TfL runs the project | No TfL logo use without explicit written permission; never imply endorsement |
| **Operational security / misuse** | Detailed network artefacts | Stick to passenger-relevant section metrics; don’t republish non-open internal reports |
| **Resource drain** | Informal asks for free validation labour | Clear, time-boxed technical exchanges; prefer self-serve open docs |

**Decision:** Do not seek endorsement as a launch gate. Seek **clarity of independence** first; optional technical dialogue second; formal MoU only when mutual obligations are concrete.

---

## 5. Academic partners — value and sequencing

Universities add:

- Ethics board pathways and research-governance literacy  
- Calibration / device-limit experiments (R3, R4) with proper protocols  
- Statistical and acoustic review of claim language  
- Citation and archival norms for open datasets  
- Possible access to Class-rated reference gear for **comparison studies** (still not making TUNES Class 1)

Sequencing recommendation:

1. **Internal** methodology + privacy defaults documented  
2. **Ethics advice** on whether public beta campaigns need review (see §7)  
3. **Pilot-scale** collaboration on calibration / validation experiments  
4. **Publication** of methods + versioned data under TUNES licences  
5. Only then larger consortium grants that name TUNES as open infrastructure  

Avoid exclusive IP or embargos that prevent `tunes` from releasing L2 aggregate packages.

---

## 6. Charities and community groups

High alignment with charter public value (parents, sensory-sensitive travellers). Useful roles:

- Co-design of subjective instruments (R9) and accessibility of the recorder/map  
- Review of claim language for harm (over-reassurance or alarm)  
- Recruitment ethics for pilots (consent clarity, no coercion)

Keep measurement science ownership in `tunes`; community partners advise, they do not silently redefine tiers.

---

## 7. Ethics approval — timing

Open question in [01](../01-assumptions-and-open-questions.md): whether ethics review is required before public beta campaigns.

**Working guidance (not a substitute for institutional advice):**

| Activity | Likely posture |
| --- | --- |
| Private dogfooding, docs-only, no public recruitment | Usually pre-ethics engineering |
| Public call for recordings + identifiable journey data | Seek ethics / DPIA advice **before** campaign |
| Academic co-analysis of released open data | May use existing open-data pathways; still check local rules |
| Perception questions that could distress | Review instrument and support language early (R9) |
| Any health-outcome framing | Strong caution; out of foundation claims (charter) |

**Decision:** Treat **ethics + DPIA timing as a launch gate for public recruitment**, not for writing methodology docs. Prefer university or qualified privacy counsel over informal “we’ll be fine.”

If no academic partner yet, still commission privacy/legal review before wide collection; controller identity follows ADR-013.

---

## 8. Funding compatible with open data independence

### Compatible patterns

- Grants that **require** open methods and open data  
- Funding for infrastructure (pipeline, schema, accessibility) without editorial control of findings  
- University seed that pays student time under TUNES licences  
- Civic tech funds that accept independent branding  

### Incompatible or high-risk patterns

- Sponsor approval rights over publications or release contents  
- Exclusive commercial licence that blocks CC BY / CDLA-style reuse  
- Co-branding that implies operator endorsement as a condition of payment  
- Embargos that prevent publishing negative or null results  
- Bundling non-open operator reports into “the” dataset  

### Safeguards to write into bids and MoUs

1. TUNES retains right to publish versioned releases under the programme licence (R10 / licences.md)  
2. Non-affiliation clause: funder/operator logos only with written permission; no endorsement language  
3. Scientific disputes resolve via ADRs in `tunes`, not sponsor memo  
4. Privacy defaults (derived-first) are non-negotiable without a public ADR  
5. Claim-language limits remain in force  

Provisional licence direction (MIT code + CC BY docs/data) supports independence; final text still needs **legal** review under ADR-012. Prefer avoiding non-commercial-only data licences if they later conflict with mixed academic–civic reuse — confirm with counsel.

---

## 9. GLA and city-level actors

GLA / city innovation or environment teams may care about exposure evidence and inclusive transport. Same rules as TfL lane:

- Useful as **audience and possible funder**, not as owner of the science  
- City open-data portals may **mirror** `tunes` releases; canonical citation stays with `tunes`  
- Policy interest ≠ methodological endorsement  

Do not invent citywide prevalence claims from a dense London-first pilot.

---

## 10. Partnership sequencing (recommended)

```text
Phase 0  Docs, charter, non-affiliation, privacy defaults
Phase 1  Legal + ethics/DPIA advice; no mass recruitment yet
Phase 2  Small pilot; academic calibration experiments; first internal derived sets
Phase 3  Versioned public release (R10); self-serve operator/academic reading
Phase 4  Optional MoUs: data use talks, accessibility collabs, grants
Phase 5  Only if mutual value clear: deeper technical exchange (still no endorsement claim)
```

Seeking endorsement or formal operator partnership **before** Phase 3 invites either capture or rejection based on an immature method. Open reproducible releases are the primary “handshake.”

---

## 11. Communication checklist (every external touch)

- [ ] State independence / non-affiliation  
- [ ] State survey-grade / not Class 1 substitute  
- [ ] Point to schema, quality tiers, uncertainty (or “not yet released”)  
- [ ] No invented statistics  
- [ ] No blending objective + subjective into one score  
- [ ] No redistribution of non-open FOI reports as open data  
- [ ] Funding asks preserve open-release rights  

---

## 12. Decisions deferred to Wave 2

- Named target funders and bid calendar  
- Whether a light-touch advisory board (academic + civic) is worth the overhead  
- Exact MoU template clauses (legal)  
- Whether any operator data-sharing agreement is ever needed (default: no — we publish ours)  

---

## Recommendation

Treat operators and the GLA as **informed audiences and optional later collaborators**, never as implied endorsers. Lead with **versioned open evidence** that is useful as in-service, multi-condition **hypothesis generation**, not as regulatory proof. Prioritise **academic partners** for ethics pathways and calibration experiments; **charities** for accessibility and claim-language review. Gate public recruitment on **ethics/DPIA advice**. Accept only funding that preserves **open releases, non-affiliation, and editorial independence** of methodology and results.

**Confidence:** High for non-affiliation sequencing and “useful without substituting Class 1.” Medium for exact ethics trigger points (institution-dependent). Low for specific funder fit until bids are drafted with legal review.

**Depends on experiment/legal/user-test?** **Legal** (licences, controller, MoU clauses). **Ethics/DPIA** before public campaigns. **User tests** (R8/R9) strengthen charity/accessibility partnerships. Calibration **experiments** (R3/R4) strengthen academic and operator credibility — they do not require endorsement.

**Links to related docs:**

- [../governance/project-charter.md](../governance/project-charter.md)
- [../governance/scope-statement.md](../governance/scope-statement.md)
- [../governance/licences.md](../governance/licences.md)
- [../governance/repos.md](../governance/repos.md)
- [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)
- [../02-research-map.md](../02-research-map.md)
- [../acoustic-survey-methodology.md](../acoustic-survey-methodology.md)
- [10-open-data-reproducibility.md](./10-open-data-reproducibility.md)
- [05-privacy-ethics.md](./05-privacy-ethics.md)
- [01-citizen-science.md](./01-citizen-science.md)
