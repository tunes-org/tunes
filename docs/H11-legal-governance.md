# H11 — Legal & governance

**Drafts — counsel review before public beta.** Not lawyer-approved.

## Entity (ADR-013)

| Stage | Form |
| --- | --- |
| Prototype / dogfood | Informal — **Hao-Tsun Kuo** (manglekuo@gmail.com) |
| By limited beta (if trigger) or **public launch** | Company **limited by guarantee** |
| Later (optional) | CIC only if funders need asset lock |

**Stack (processors):** Vercel · Supabase · Google OAuth · Apple Sign In (planned iOS) · site https://tunesurvey.com  

**ICO fee (self-assessment):** Tier 1 **£52** — pay registration (browser left open for you).
## Before public beta (minimum docs)

Privacy notice · Terms/contributor rules · Moderation · Cookies · Takedown/reporting · Ownership/governance  

Canon: [`machine/governance/legal/`](./machine/governance/legal/) · Web/ios copies: [`legal/consumers/`](./machine/governance/legal/consumers/)

## Privacy gates (short)

| Do | Don’t |
| --- | --- |
| Derived-only default; upload preview + consent | Raw audio by default |
| Hashes = **pseudonymous** (still personal) | Call hashes “anonymous” |
| DPIA before public recruitment | Skip DPIA because “small project” |
| Pre-moderate or delay public comments | Open UGC without report path |

## Agents

Apply skill **`tunes-legal-privacy`** when touching auth, cookies, UGC, consent, location, open data, or claims.

## Detail

[R12 UK legal](./machine/research/12-uk-legal-governance-dp.md) · [ADR-013](./machine/decisions/ADR-013-controller-and-entity.md) · [R5 privacy](./machine/research/05-privacy-ethics.md) · [H05](./H05-privacy.md)
