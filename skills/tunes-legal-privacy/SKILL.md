---
name: tunes-legal-privacy
description: >-
  UK legal, privacy, and claim-language gates for TUNES. Use when implementing
  or deciding features that touch personal data, OAuth, cookies/analytics,
  comments/votes/UGC, moderation, consent/upload, location/postcode,
  hashing/IPs, NLP, open-data releases, claim language, TfL branding, or legal
  pages in tunes / tunes-web / tunes-ios.
---

# TUNES legal & privacy (agent skill)

**Canon:** `docs/machine/governance/legal/`  
**Research:** `docs/machine/research/12-uk-legal-governance-dp.md` · `docs/machine/research/05-privacy-ethics.md`  
**ADRs:** ADR-004, ADR-005, ADR-011, ADR-013  
**Consumers:** `docs/machine/governance/legal/consumers/tunes-web/` · `…/tunes-ios/`  
**Checklist:** [feature-gate-checklist.md](./feature-gate-checklist.md)

Draft legal text is **not** lawyer-approved. Do not invent controller identity, retention years, or Art 9 health framing — escalate to founders/counsel.

---

## Before coding privacy-touching work

1. Read this skill and the relevant canon file under `docs/machine/governance/legal/`.  
2. If behaviour changes purposes, retention, processors, or UGC → update canon **then** consumer copies.  
3. Paste the [feature-gate checklist](./feature-gate-checklist.md) into the PR description when relevant.

---

## DO

1. Read this skill + canon legal pack before coding privacy-touching features.  
2. Keep **derived-only upload** default (ADR-004/005); show exact upload preview; require explicit consent before anything leaves the device.  
3. Preserve **non-affiliation** and **ADR-011** claim limits in every user-facing string.  
4. Classify data as personal / pseudonymous / anonymous per ICO meanings; **never** call hashes “anonymous”.  
5. Prefer structured enums over free text; keep free text out of open releases unless moderated.  
6. Document lawful basis / PECR consent implications when adding cookies, analytics, abuse IPs, or new processors.  
7. Update canon legal drafts + `consumers/tunes-web` + `consumers/tunes-ios` when behaviour changes; keep H05 / R5 aligned.  
8. For public comments/UGC: assume Online Safety Act risk; add report path; prefer pre-moderation until assessed.  
9. Minimise OAuth scopes and location (section snap ≫ GPS trails in open data).  
10. Escalate to founders/counsel for controller identity, final retention periods, special-category (health) data, or CIC/CLG filing text.

---

## DO NOT

1. Do **not** upload raw audio by default or add “convenient” raw toggles without a new ADR + ethics/DPIA gate.  
2. Do **not** imply TfL endorsement, official status, or regulatory-grade accuracy.  
3. Do **not** add health / acoustic “risk” scores or clinical framing (ADR-011).  
4. Do **not** set non-essential cookies/analytics before PECR-compliant consent (or a documented analytics-exception design).  
5. Do **not** publish contributor identity, stable cross-release personal IDs, or joinable hashes in open data.  
6. Do **not** store full postcodes or high-resolution tracks when coarse eligibility or section IDs suffice.  
7. Do **not** ship open public comments without moderation + reporting copy from the legal pack.  
8. Do **not** use NLP to infer special-category attributes without disclosure + DPIA.  
9. Do **not** duplicate conflicting privacy policies across repos — change canon first.  
10. Do **not** treat “we’re a small volunteer project” as an exemption from UK GDPR / PECR / OSA where they apply.  
11. Do **not** present draft legal text as lawyer-approved.  
12. Do **not** target under-13s or enrol children as data subjects in foundation scope.

---

## Repo ownership

| Concern | Repo |
| --- | --- |
| Canon legal text, ADRs, open releases | `tunes` |
| Consent preview, local raw, 8-step flow | `tunes-ios` |
| Public legal pages, cookies, OAuth web, comments, map honesty | `tunes-web` |

Human glance: `docs/H11-legal-governance.md` · `docs/H05-privacy.md`
