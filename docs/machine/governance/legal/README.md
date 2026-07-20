# Legal pack (canonical)

**Status:** Draft — counsel review required before public beta  
**Version:** 0.1.0-draft  
**Last-updated:** 2026-07-20  
**Owner repo:** `tunes`  
**Consumers:** `tunes-web`, `tunes-ios` (see [consumers/](./consumers/))

## Rule

1. Edit **here** first.  
2. Bump `Version` / `Last-updated`.  
3. Refresh `consumers/tunes-web/*` and `consumers/tunes-ios/*`.  
4. Copy into sibling repos per each `SYNC.md` if not done in the same change.  
5. Purpose / retention / processor changes → privacy notice + DPIA review.

## Documents

| File | Public? |
| --- | --- |
| [privacy-notice.md](./privacy-notice.md) | Yes |
| [terms-and-contributor-rules.md](./terms-and-contributor-rules.md) | Yes |
| [moderation-policy.md](./moderation-policy.md) | Yes |
| [cookie-notice.md](./cookie-notice.md) | Yes |
| [takedown-and-reporting.md](./takedown-and-reporting.md) | Yes |
| [governance-and-ownership.md](./governance-and-ownership.md) | Yes |
| [consent-record-fields.md](./consent-record-fields.md) | Internal / implementers |
| [claim-language-checklist.md](./claim-language-checklist.md) | Internal / press / UI review |

## Controller / contact (filled 2026-07-20)

| Field | Value |
| --- | --- |
| Controller | Hao-Tsun Kuo (until CLG incorporation) |
| Privacy / rights | manglekuo@gmail.com |
| Reports / takedown | manglekuo@gmail.com |
| Website | https://tunesurvey.com |
| Processors | Vercel (host), Supabase (DB/auth), Google OAuth; Apple Sign In planned for iOS |

Update this table and re-sync consumers if any field changes.

## Related

- Research: [../../research/12-uk-legal-governance-dp.md](../../research/12-uk-legal-governance-dp.md)  
- Privacy ethics: [../../research/05-privacy-ethics.md](../../research/05-privacy-ethics.md)  
- ADR-013: [../../decisions/ADR-013-controller-and-entity.md](../../decisions/ADR-013-controller-and-entity.md)  
- Agent skill: `skills/tunes-legal-privacy/`
