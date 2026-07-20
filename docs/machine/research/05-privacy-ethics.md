# R5 — Privacy and research ethics

**Status:** Wave 1 research recommendation  
**Repos:** `tunes` (privacy model + consent contracts); implemented in `tunes-ios` (local control) and `tunes-web` (upload, retention, withdrawal)  
**Must-read inputs:** [project-charter.md](../governance/project-charter.md), [scope-statement.md](../governance/scope-statement.md), [01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md)

**Current disposition:** ADR-004/005 accept the raw-on-device and derived-only defaults; ADR-013 names the pre-incorporation controller. Exact retention and lawful-basis wording still require counsel review.

---

## 1. Decision questions

1. Should raw audio ever leave the device?  
2. Should the default contribution be **derived features only**?  
3. What GDPR / ethics posture fits a London-first open programme that is **not** TfL-operated or endorsed?

Working assumptions this doc reinforces:

- Privacy default = local record → review → consent → **derived-only** upload  
- Prefer derived over raw unless raw is demonstrably necessary  
- Offline-first during collection  

---

## 2. Local-first 8-step contribution flow (required)

Every scientific contribution path in `tunes-ios` should implement this sequence. Nothing leaves the device before step 7 completes successfully.

| Step | Action | Privacy purpose |
| --- | --- | --- |
| 1 | **Record locally** | Capture under user control; offline-capable |
| 2 | **Process locally** where practical | Derive metrics/spectra without requiring upload |
| 3 | **Infer journey sections** | Attach energy to station-to-station units without streaming audio |
| 4 | **User review / correct** | Fix alignment; prevent wrong-place disclosure |
| 5 | **Trim or delete** | Remove unwanted time ranges; discard session |
| 6 | **Show exact upload preview** | Informed choice; no hidden fields |
| 7 | **Explicit consent** | Purpose, tier, retention, withdrawal path stated |
| 8 | **Upload only selected information** | Least data necessary for the chosen tier |

### Product rules

- No silent background upload of audio or metrics.  
- Default selected payload = **derived acoustic features + consented metadata**.  
- Raw PCM remains on device unless the user opts into a separate, clearly labelled tier (if offered at all).  
- After successful derived upload, offer prominent **delete local raw** (and make deletion real, not soft-hide).  
- Preview must list field categories the user can understand (levels, bands, section IDs, device model class, flags) — not only a legal wall of text.

---

## 3. Why the derived-only default is the ethical centre of gravity

Railway carriages are shared spaces. Continuous microphone capture will inevitably include **incidental speech** (passengers, staff, PA). Derived features (e.g. LAeq,T, LCeq, LCpeak, band Leq, clipping flags) can support the programme’s public map and open methodology goals with far less speech reconstructability than waveform upload.

**Prefer derived** because it:

- Reduces personal-data intensity of the default path  
- Shrinks breach blast radius (storage, backups, research exports)  
- Aligns with “useful to professionals / honest to passengers” without building a speech corpus  
- Matches the charter’s privacy-preserving and auditable principles  

Raw audio remains scientifically useful for some validation (algorithm audits, disputed events, research replication). That usefulness does **not** justify making raw the default.

---

## 4. GDPR-oriented data tiers (working model)

ADR-013 identifies the pre-incorporation **data controller**; the legal pack must be updated when the CLG becomes controller. The technical tiers below assume UK GDPR / DPA 2018 duties bind the controller operating `tunes-web` uploads and `tunes` releases.

### Tier framing (contribution / retention, not acoustic quality A–E)

| Privacy tier | Payload | Typical lawful-basis sketch | Retention posture | Who may access |
| --- | --- | --- | --- | --- |
| **P0 — Local only** | Raw + derived stay on device | N/A (no transfer) | User-controlled | User |
| **P1 — Derived open** | Metrics, spectra summaries, section links, quality flags, coarse device class | Consent for research/open publication (confirm with counsel) | Versioned public releases with minimisation | Public / researchers |
| **P2 — Derived restricted** | P1 + contributor pseudonym / campaign IDs needed for withdrawal & fraud controls | Consent + documented research purposes | Limited; not in bulk open dump by default | Operators of TUNES systems; approved analysts |
| **P3 — Short excerpts** | Brief waveform snippets around consented events | Separate explicit consent; high bar | Short TTL; not default open data | Restricted research |
| **P4 — Full raw** | Full session audio | Separate explicit consent; rarely justified | Strict quarantine; deletion SLAs | Research-restricted only |
| **P5 — Research archive** | Any of the above under a written protocol + ethics review where required | Consent + ethics constraints | Protocol-defined; no silent promotion to P1 | Named projects only |

Acoustic **quality tiers A–E** (R4) are orthogonal: a Tier A acoustic measurement can still be P1 (derived-only). Never conflate “scientifically strong” with “may publish raw audio.”

---

## 5. Separate recommendations by payload class

### 5.1 Derived-only (default — recommend ship)

**Recommendation:** Make this the only path in early pilots and the default forever.

- Compute on device when practical; allow server reprocessing of **already-derived** uploads with versioned pipelines.  
- Publish open data from P1 fields after validation and provenance checks.  
- Include processing-pipeline version, calibration_state, quality flags, and section IDs.  
- Exclude free-text that re-identifies (or gate free-text behind stronger review — see §8).

**When insufficient:** algorithm disputes that require waveform inspection; rare tonal-event forensics — handle via optional higher tiers, not by weakening the default.

### 5.2 Short audio excerpts (optional, high friction)

**Recommendation:** Do not offer at public launch. Revisit only if experiments show derived features cannot answer a documented research question.

If ever offered:

- Hard duration caps and user-visible waveform/privacy preview  
- Separate consent screen explaining speech risk  
- Default **exclude** from open releases (P3 → not P1)  
- Prefer event-centred clips (e.g. flagged squeal window) over continuous carriage audio  

### 5.3 Full raw audio (discouraged as product feature)

**Recommendation:** Default **no** — raw does not leave the device, as accepted by ADR-004 (“only under restricted research protocols, if ever”).

If a future research campaign requires raw:

- Out-of-band enrolment, not a casual in-app toggle  
- Written information sheet, purpose limitation, deletion date  
- Encrypted transit and at-rest quarantine in `tunes-web`  
- No use for model training that redistributes speech content  
- No implied TfL custody or endorsement  

### 5.4 Research-restricted datasets

**Recommendation:** Support a governed path (P2/P5) for universities or accessibility researchers that need richer linkage (e.g. repeated contributor pseudonyms, detailed device serials for calibration studies) **without** placing that richness in the public dump.

- Access agreements, purpose binding, audit logs  
- Prefer derived + metadata enrichment over raw  
- Ethics review before campaigns targeting vulnerable groups or collecting raw  

---

## 6. Incidental speech

Assume speech is present in any continuous carriage recording.

| Control | Requirement |
| --- | --- |
| Default payload | Derived features that are not intended for speech playback |
| User messaging | State clearly that recordings may include others’ voices; derived upload is the privacy-preserving path |
| Open data | Do not release raw or excerpts by default |
| Quality flags | Optional “high speech / PA dense” flags for analysis — without uploading audio |
| Announcement recognition | If ever used for alignment (R7), prefer on-device, non-retained detection; do not build a public speech archive |
| Staff / passenger complaints | Publish a contact + deletion path; treat seriously |

TUNES is not a surveillance product. Feature design that rewards capturing intelligible conversation is out of scope.

---

## 7. Withdrawal, retention, and identifiers

### Withdrawal

- Every uploaded contribution needs a **withdrawal handle** the user can exercise later (contributor account, one-time recovery code, or equivalent — exact UX TBD).  
- Withdrawal must remove or tombstone personal data from operational stores and **schedule exclusion** from future public releases.  
- Already-downloaded third-party copies of open releases cannot be erased from the internet; the privacy notice must say so honestly.  
- Pseudonymous public rows should avoid stable cross-release personal identifiers where possible.

### Retention (working policy; confirm legally)

| Artefact | Working retention |
| --- | --- |
| Local raw on phone | User-controlled; encourage delete-after-upload |
| Derived uploads (P1/P2) | Retained for dataset integrity; subject to withdrawal |
| Short excerpts / raw (P3/P4) | Short, protocol-defined TTL; default delete |
| Server logs | No raw audio; redact tokens; limited TTL |
| Public releases | Versioned; withdrawal appears as omission in subsequent versions |

### Location minimisation

Underground GPS is unreliable; prefer **topology snap to sections** over storing precise raw tracks in open data (aligns with methodology GPS caveat). If coarse timing or station sequence is enough, do not keep high-resolution location trails in P1.

---

## 8. Children, vulnerable participants, and free text

### Children

- Do not target under-13 contributions.  
- Age-appropriate design: if a journey is planned “for a child,” that is **subjective metadata about suitability**, not enrolment of the child as data subject.  
- Any future youth programmes require separate safeguarding + parental consent design and legal review.

### Vulnerable / sensory-sensitive contributors

- Accessibility and quieter-journey goals are central to public value — participation must remain **voluntary**, with clear ability to abort, delete, and skip subjective questions.  
- Avoid pressure mechanics that encourage unsafe recording behaviour.  
- Perception items about pain, fatigue, or child suitability are sensitive; keep them optional and separate from objective metrics (R9).

### Free-text reports

Free text can contain names, medical detail, or incident narratives. **Recommendation:** keep free text out of P1 open releases by default; moderate before any publication; prefer structured perception scales.

---

## 9. Consent and ethics review

### Informed consent (minimum content)

- The controller and current contact stated in the legal pack
- What is uploaded for the selected privacy tier  
- That TUNES is **independent** and not TfL-endorsed  
- Survey-grade limits of crowd acoustics (no false health certainty)  
- Retention, withdrawal, and open-licence implications for P1  
- Incidental speech risk  

### Ethics review

- Ordinary derived-only adult pilot: document an ethics self-assessment; seek formal review if a partner university requires it or if raw/excerpt collection begins.  
- Raw audio, children, or clinical framing (“risk scores,” diagnosis language): **ethics + legal before collection**.  
- Claim language for exposure / discomfort / loudness / risk remains gated by R2 and a claim-language ADR — privacy docs must not invent medical authority.

---

## 10. Threat-model sketch (engineering checklist)

| Threat | Mitigation |
| --- | --- |
| Upload before consent | Hard client gate; server rejects unauthenticated/unconsented payloads |
| Raw included “by accident” | Schema allow-lists; integration tests; preview shows MIME/size class |
| Trimmed audio reconstructed | Do not upload pre-trim buffers; verify deletion |
| Re-identification via trajectory | Section-level publication; minimise precise GPS in open data |
| Log leakage | Ban audio/text from logs; structured metrics only |
| Insider misuse of raw quarantine | Access control, audit, short TTL, separate storage |
| Malicious “research” scrape of speech | Don’t publish speech-bearing tiers openly |

Implement and test in `tunes-ios` + `tunes-web` per the privacy test list in [research-plan.md](../research-plan.md).

---

## 11. Repo split

| Concern | Owner |
| --- | --- |
| Privacy principles, tier definitions, public notices outline, ADRs | `tunes` |
| 8-step flow, on-device processing, preview, local delete | `tunes-ios` |
| Consent records, encryption, retention jobs, withdrawal API, release scrubbing | `tunes-web` |

---

## Recommendation

1. Ship the **8-step local-first flow** as a non-negotiable product requirement.  
2. Default forever to **derived-only (P1)** uploads after preview + explicit consent.  
3. Answer “should raw leave the device?” with **no by default**; allow only **research-restricted** protocols (P4/P5) after legal/ethics gates — not as a casual consumer toggle.  
4. Do not offer short excerpts at launch; revisit only with a documented scientific need.  
5. Implement **withdrawal**, location minimisation, and honest limits on open-data erasure.  
6. Protect children and vulnerable users with non-targeting defaults, optional perception items, and ethics escalation for raw/clinical framing.  
7. Keep the **data-controller identity** and CLG transition current under ADR-013; obtain legal review before public beta.

**Confidence:** High for the derived-only default, 8-step flow, and raw-as-exception; Medium for exact lawful bases and retention periods until counsel reviews; Low for any raw/excerpt productisation until ethics + threat model sign-off.

**Depends on experiment/legal/user-test?** Yes — **legal** (controller, lawful basis, licences interplay); **user-test** (consent/preview comprehension, withdrawal UX); ethics review before raw/vulnerable campaigns; privacy threat-model exercise in Phase 4.

**Links to related docs:**

- [governance/project-charter.md](../governance/project-charter.md)  
- [governance/scope-statement.md](../governance/scope-statement.md)  
- [01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md) (Q4, Q5; privacy assumption)  
- [02-research-map.md](../02-research-map.md) (R5)  
- [governance/licences.md](../governance/licences.md)  
- [research-plan.md](../research-plan.md) (privacy tests; Phase 4)  
- [H14 recorder](../../H14-recorder.md)
- Current disposition: [privacy-boundary architecture](../architecture/data-flow-and-privacy-boundaries.md); [ADR-004](../decisions/ADR-004-raw-audio-policy.md); [ADR-005](../decisions/ADR-005-derived-only-default.md); [ADR-011](../decisions/ADR-011-claim-language.md)
