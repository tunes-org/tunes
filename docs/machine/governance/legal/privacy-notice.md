# Privacy notice

**Status:** Draft — counsel review required  
**Version:** 0.1.0-draft  
**Last-updated:** 2026-07-20  
**Canonical:** `tunes` · ship on `tunes-web` · summarise in `tunes-ios`

This notice explains how TUNES (Transit User Noise Experience Survey) uses personal information. It is written for UK users under the UK GDPR and the Data Protection Act 2018. Plain-language layered summary: see the iOS privacy summary and the top of the web privacy page.

TUNES is **independent**. It is **not** operated, approved, or endorsed by Transport for London (TfL).

---

## 1. Who we are (controller)

**Controller:** Hao-Tsun Kuo (informal project controller until incorporation)  
**Contact:** manglekuo@gmail.com  
**Website:** https://tunesurvey.com  

Until a company limited by guarantee is incorporated, Hao-Tsun Kuo is the controller. After incorporation, that company becomes the controller (see [governance-and-ownership.md](./governance-and-ownership.md)).

You can complain to the [Information Commissioner’s Office (ICO)](https://ico.org.uk/make-a-complaint/).

---

## 2. What we collect

| Category | Examples | Notes |
| --- | --- | --- |
| Account / identity | Google OAuth subject ID and email (web); Apple Sign In planned for iOS; display name if provided | Only if you sign in |
| Contribution (default) | Derived acoustic metrics, spectra summaries, station-to-station section IDs, quality flags, device model/OS class, app and pipeline versions, optional perception answers | **No raw audio** by default |
| Consent metadata | Notice version, privacy tier, timestamp, purposes accepted | Accountability |
| Security / abuse | IP address, rate-limit signals, hashed identifiers | Short retention; not published |
| Website technical | Cookies / similar tech as in the [cookie notice](./cookie-notice.md) | PECR rules apply |
| User-generated content | Votes, comments (if enabled) | Moderated; may be personal data |

**Raw audio** stays on your device unless a separate, clearly labelled research tier ever applies (not the default product path).

Recordings in shared carriages may include **incidental speech** of other people. We prefer derived features that are not intended for speech playback.

---

## 3. Why we use it (purposes)

1. Operate the recorder app, upload intake, map, and account features  
2. Validate, quality-flag, and aggregate contributions  
3. Publish versioned **open methodology and datasets** (minimised / aimed at anonymous aggregates)  
4. Moderate UGC and prevent abuse  
5. Improve the service (analytics only as allowed by the cookie notice)  
6. Respond to rights requests, reports, and legal obligations  

We do **not** use your data to sell advertising profiles. We do **not** claim health “risk scores” or regulatory-grade acoustic compliance from crowd data.

---

## 4. Lawful bases

| Purpose | Working lawful basis |
| --- | --- |
| Creating an account / OAuth | Consent and/or contract for the service |
| Uploading a derived contribution and agreeing to open publication | **Consent** (separate from terms; preview shows what leaves the device) |
| Security, fraud, and abuse prevention | **Legitimate interests** (keeping the service safe and usable) |
| Research curation of a minimised archive where counsel agrees | Legitimate interests with a documented assessment — or consent |
| Non-essential cookies / analytics | PECR **consent**, unless a documented PECR statistical-purposes exception applies |

If we ever collect information that is **special category** data (for example data concerning health), we will ask for **explicit consent** and explain it separately. Foundation launch avoids health/pain framing.

---

## 5. Who we share with (processors and recipients)

We use service providers who process data on our instructions, including (as deployed):

- **Vercel** — website and application hosting  
- **Supabase** — database and authentication backend  
- **Google** — OAuth sign-in (web; and elsewhere when enabled)  
- **Apple** — Sign in with Apple (planned for iOS; listed here so the notice stays accurate when enabled)  

We require appropriate contracts (Art 28). Some processing may involve transfers outside the UK. Where required, we rely on UK adequacy regulations (including the UK Extension to the EU–US Data Privacy Framework for certified US organisations) or other appropriate safeguards such as the ICO International Data Transfer Agreement / Addendum. Confirm each provider’s UK transfer mechanism before public beta.

Open dataset releases are published for anyone to download under the stated licence. Already-downloaded copies cannot be erased from the internet.

---

## 6. Retention

| Artefact | Working retention |
| --- | --- |
| Account data | While account active + short wind-down (typically 30–90 days) |
| Derived contributions | Retained for dataset integrity; subject to withdrawal |
| Security logs / IP | Short period (typically 14–90 days) unless needed for an investigation |
| Consent records | Kept as long as needed to demonstrate compliance |
| Public release packages | Versioned; withdrawals appear as omissions in later versions |

Exact periods may be refined after counsel review and will be updated here.

---

## 7. Your rights

Depending on the lawful basis, you may have rights to access, rectification, erasure, restriction, objection, and data portability. Where we rely on consent, you may **withdraw consent** at any time (this does not affect processing already carried out). Where we rely on legitimate interests, you may **object**.

Contact `manglekuo@gmail.com`. We aim to respond within one month.

**Withdrawal of contributions:** we will remove or tombstone personal data in operational systems and exclude it from future open releases where reasonably possible. We cannot recall copies already downloaded by third parties.

---

## 8. Children

TUNES is not directed at children under 13. Do not create an account or upload contributions if you are under 13. Perception questions about journeys “for a child” (if offered) describe suitability opinions — they do not enrol a child as a participant.

---

## 9. Automated decision-making

We do not make solely automated decisions that produce legal or similarly significant effects about you. Quality flags and abuse rate-limits may use automated signals with human review for significant account actions.

---

## 10. Changes

We will update this notice when our processing changes and show the new version date. Material changes to contribution processing will be brought to your attention before you upload under the new terms.

---

*Draft only — not lawyer-approved. Official transparency requirements: [ICO right to be informed](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/the-right-to-be-informed/).*
