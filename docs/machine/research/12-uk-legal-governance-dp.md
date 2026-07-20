# R12 — UK legal, governance, and data protection

**Status:** Wave 1 research recommendation  
**Owns:** Entity form recommendation; minimum public legal pack; GDPR classification and lawful-basis sketch; DPIA timing; OSA/UGC posture; staged launch checklist; founder decision list  
**Does not own:** Solicitor-signed contracts; the controller identity and entity transition accepted in ADR-013; application code; TfL affiliation
**Must-read inputs:** [project-charter.md](../governance/project-charter.md), [05-privacy-ethics.md](./05-privacy-ethics.md), [11-funding-partnerships.md](./11-funding-partnerships.md), [ADR-011](../decisions/ADR-011-claim-language.md), [ADR-013](../decisions/ADR-013-controller-and-entity.md)

**Disclaimer:** Operational guidance for founders and agents — **not legal advice**. Counsel should review before public beta. Material claims link to official UK sources.

---

## 1. Decision questions

1. Start as informal project, company limited by guarantee (CLG), or CIC?  
2. What minimum legal documents are required before public beta?  
3. How should TUNES classify anonymous / pseudonymous / personal data and choose lawful bases?  
4. What risks do OAuth, hashes, IP controls, postcodes, comments, NLP, and UGC create?  
5. What gates apply at private prototype, limited beta, and public launch?

---

## 2. Entity recommendation

### Decision (locked in ADR-013)

| Stage | Form |
| --- | --- |
| Private prototype / early dogfood | **Informal** — named individual controller(s) |
| Limited beta (if any trigger) or **public launch** (latest) | **Private company limited by guarantee (CLG)** |
| Later (optional) | **CIC** only if funders need a statutory asset lock |

**Do not start as a CIC.**

### Why

- **CLG** — GOV.UK non-profit / membership company form: guarantors, no shares, surplus reinvested; liability limited to guarantee amount. Sources: [Types of limited company](https://www.gov.uk/limited-company-formation/limited-company-types); [Incorporation and names](https://www.gov.uk/government/publications/incorporation-and-names/incorporation-and-names).  
- **CIC** — Limited company + community interest statement + asset lock + CIC Regulator + annual CIC report. Disproportionate for early volunteer research. Sources: [Set up a social enterprise](https://www.gov.uk/set-up-a-social-enterprise); [CIC guidance](https://www.gov.uk/government/publications/community-interest-companies-how-to-form-a-cic/community-interest-companies-guidance-chapters).  
- **Informal** — Still binds whoever determines purposes/means as **controller** under UK GDPR. Fee exemption may apply for some not-for-profit processing; UK GDPR duties remain. Sources: [ICO fee exemptions](https://ico.org.uk/for-organisations/data-protection-fee/data-protection-fee/exemptions/); [ICO data protection fee](https://ico.org.uk/for-organisations/data-protection-fee/).

### Incorporation triggers (any one → incorporate)

1. Dedicated bank account for grants/donations/sponsorship  
2. Contractors, project insurance, or hosting billed to the project  
3. Public dataset/map with meaningful defamation, IP, or data-subject exposure  
4. Public OAuth + comments/votes at scale (liability + Online Safety Act)  
5. University MoUs / ethics sponsorship / funders requiring a legal person  
6. Shared control among founders without a written ownership rule  

Until incorporation: name **one primary controller contact**; if purposes/means are jointly determined, document a joint-controller split ([ICO data sharing agreements](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/data-sharing/data-sharing-a-code-of-practice/data-sharing-agreements/)).

---

## 3. Minimum legal documents before public beta

Canonical drafts: [../governance/legal/](../governance/legal/). Consumers for web/ios: [../governance/legal/consumers/](../governance/legal/consumers/).

| Document | Purpose | Official anchor |
| --- | --- | --- |
| Privacy notice | Art 13 transparency | [ICO — what privacy information to provide](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/the-right-to-be-informed/what-privacy-information-should-we-provide/) |
| Terms / contributor rules | Use rules; non-affiliation; claim limits | Charter; ADR-011 |
| Moderation policy | What is removed; appeals | Practical + OSA if U2U |
| Cookie / analytics notice | PECR storage/access | [ICO PECR cookies](https://ico.org.uk/for-organisations/direct-marketing-and-privacy-and-electronic-communications/guide-to-pecr/cookies-and-similar-technologies/); [PECR exceptions](https://ico.org.uk/for-organisations/direct-marketing-and-privacy-and-electronic-communications/guidance-on-the-use-of-storage-and-access-technologies/what-are-the-exceptions/) |
| Takedown / reporting | Illegal content, privacy, defamation | [Ofcom illegal content duties](https://www.ofcom.org.uk/online-safety/illegal-and-harmful-content/illegal-content-duties-under-the-online-safety-act); [ICO right to erasure](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/individual-rights/right-to-erasure/) |
| Governance / ownership | Who owns what; independence | Charter; [repos.md](../governance/repos.md) |

**Internal before beta:** RoPA; Art 28 processor contracts ([ICO contracts](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/guide-to-accountability-and-governance/contracts/)); LIA if using legitimate interests; DPIA; transfer mechanism for US processors ([UK–US data bridge factsheet](https://www.gov.uk/government/publications/uk-us-data-bridge-supporting-documents/uk-us-data-bridge-factsheet-for-uk-organisations); [ICO international transfers](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/international-transfers/a-brief-guide-to-international-transfers/)); ICO fee self-assessment.

**Online Safety Act:** User-to-user comments can make the service a regulated U2U service; comments only on *provider* content may be excluded from regulated UGC. Prefer pre-moderation or delayed comments until assessed ([OSA explainer](https://www.gov.uk/government/publications/online-safety-act-explainer/online-safety-act-explainer)).

---

## 4. GDPR plan

### 4.1 Classification (ICO meanings)

| Class | Meaning | TUNES examples | UK GDPR? |
| --- | --- | --- | --- |
| Personal data | Identified or identifiable person | OAuth email/`sub`, IP, account ID, free text, precise tracks | Yes — [What is personal data?](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/personal-information-what-is-it/what-is-personal-data/what-is-personal-data/) |
| Pseudonymous | Identifiers replaced; re-ID with separate key | Contributor UUID + offline key; abuse hashes | Yes — [Pseudonymisation](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/data-sharing/anonymisation/pseudonymisation/) |
| Anonymous | Not identifiable by reasonably available means | Section aggregates with suppression; map tiles without contributor keys | No *if effective* — [Anonymisation](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/data-sharing/anonymisation/introduction-to-anonymisation/) |

Map to R5 privacy tiers P0–P5. **Never** call hashed IDs anonymous.

### 4.2 Lawful bases (working recommendation)

Private/third-sector research: ICO typically points to **legitimate interests** for research processing; consent is high-bar ([ICO research grounds](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/the-research-provisions/principles-and-grounds-for-processing/); [Lawful basis guide](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/lawful-basis/a-guide-to-lawful-basis/)).

| Processing | Basis | Notes |
| --- | --- | --- |
| Account / OAuth | Consent or contract + LI for security | Unbundle; [Consent](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/lawful-basis/a-guide-to-lawful-basis/consent/) |
| Derived upload + open publication | **Consent** for upload (product honesty); counsel may prefer LI for research archive with LIA | R5 preview + explicit opt-in |
| Abuse (IP, rate limits) | **Legitimate interests** + LIA | Short retention |
| Non-essential analytics cookies | PECR **consent** | Or PECR statistical-purposes exception design |
| Health/pain perception items | Avoid at launch; else Art 6 + Art 9 (usually explicit consent) | [Special category data](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/lawful-basis/special-category-data/what-is-special-category-data/) |

### 4.3 Retention, deletion, consent records

- Accounts: active period + short wind-down (e.g. 30–90 days)  
- Derived contributions: integrity retention; withdrawal → tombstone / exclude from future releases (R5 §7); tell users open downloads cannot be recalled ([Right to erasure](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/individual-rights/right-to-erasure/))  
- Logs/IP: short TTL (e.g. 14–90 days) unless investigation hold  
- Consent records: see [consent-record-fields.md](../governance/legal/consent-record-fields.md)  
- Raw/excerpt tiers: protocol TTL; default delete  

### 4.4 DPIA

**Complete a DPIA before limited public beta / public recruitment.** Screening likely hits innovative tech, geolocation/behaviour tracking, highly personal data, vulnerable users, dataset matching ([When do we need a DPIA?](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments-dpias/when-do-we-need-to-do-a-dpia/)). Residual high risk that cannot be mitigated → consult ICO before processing.

---

## 5. Feature-specific risks

| Feature | Risk | Control |
| --- | --- | --- |
| OAuth | Stable IDs; profile leakage | Minimise scopes; DPA; deletion |
| Hashed IDs | Still personal (pseudonymous) | Per-purpose salts; never publish joinable hashes |
| IP abuse | Personal data; false positives | LI + LIA; short TTL; human review before bans |
| Postcode | Location over-collection | Prefer self-attest / discard after check / district only |
| Public comments | Defamation; OSA illegal content | Pre-moderate at beta; report path; ADR-011 |
| NLP on UGC | Special-category inference | Prefer rules; disclose; DPIA; human review |
| UGC generally | Licence; third-party data | Contributor licence; moderate free text out of open data |

Processors (Supabase, Vercel, OAuth): Art 28 terms; UK Extension or IDTA/Addendum + TRA as applicable.

---

## 6. Staged checklist

### A — Private prototype

- [ ] Name controller(s) + contact  
- [ ] ICO fee self-assessment  
- [ ] Processor DPAs  
- [ ] Draft privacy notice + RoPA  
- [ ] Derived-only only; no public comments/open dataset  
- [ ] Non-affiliation + ADR-011 on demos  
- [ ] DPIA screening notes  

### B — Limited beta

- [ ] Publish privacy, terms, cookies, governance  
- [ ] DPIA complete; LIAs for security  
- [ ] Consent records + withdrawal  
- [ ] Moderation + takedown; **pre-moderate** or delay comments  
- [ ] OSA illegal-content risk assessment if U2U  
- [ ] Incorporate if trigger fired; else schedule before launch  
- [ ] Invite-only; watch re-ID  

### C — Public launch

- [ ] CLG in place (default)  
- [ ] Licences counsel-reviewed (ADR-012)  
- [ ] Open-release anonymisation assessment  
- [ ] Map honesty + claim checklist  
- [ ] Retention/erasure runbooks  
- [ ] Full CoC  
- [ ] CIC only if funders require asset lock  

---

## 7. Founder decisions (pros / cons)

1. **Controller before incorporation** — One named founder (clear / personal liability) vs joint (shared / needs written split).  
2. **Incorporate now vs at trigger** — Early liability shield / admin cost vs low overhead / personal exposure.  
3. **CLG vs CIC first** — Simpler duties vs funder asset-lock signal + CIC report.  
4. **Consent vs LI for research uploads** — Trust + preview UX vs ICO research fit + harder explanation.  
5. **Comments at beta** — Delay/pre-moderate (safer) vs open (engagement + OSA).  
6. **Health/pain items** — Exclude (avoid Art 9) vs include with explicit consent + DPIA.  
7. **Analytics** — First-party aggregate / PECR exception vs third-party + cookie consent.  

---

## Recommendation

1. Stay informal until a trigger; incorporate **CLG** by public launch at latest.  
2. Ship the [legal pack](../governance/legal/) and sync [web/ios consumers](../governance/legal/consumers/) before limited beta.  
3. Treat hashed IDs as **pseudonymous**; DPIA before public recruitment.  
4. Agents implementing privacy-touching features must follow **`tunes-legal-privacy`**.  
5. Counsel review before public beta.

**Confidence:** High for entity sequencing and document set; Medium for exact lawful bases/retention until counsel; Low for OSA categorisation until product UGC shape is fixed.

**Depends on experiment/legal/user-test?** **Legal** (controller, DPIA, licences); user-test for consent/preview comprehension; ethics if raw/vulnerable campaigns.

**Links:** [../governance/legal/](../governance/legal/); [05-privacy-ethics.md](./05-privacy-ethics.md); [11-funding-partnerships.md](./11-funding-partnerships.md); [ADR-013](../decisions/ADR-013-controller-and-entity.md); humans [`../../H11-legal-governance.md`](../../H11-legal-governance.md).
