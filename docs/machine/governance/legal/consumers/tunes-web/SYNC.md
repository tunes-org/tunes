# Syncing legal copy into `tunes-web`

**Canon:** `tunes/docs/machine/governance/legal/`  
**These files:** ready-to-copy bodies for the web app  
**Version aligned to:** 0.1.0-draft (2026-07-20)

**Controller filled:** Hao-Tsun Kuo · manglekuo@gmail.com · https://tunesurvey.com  
**Stack:** Vercel + Supabase + Google OAuth (Apple Sign In planned for iOS)

## Suggested paths in `tunes-web`

| Consumer file | Suggested destination |
| --- | --- |
| `privacy.md` | `docs/legal/privacy.md` and/or MDX route e.g. `app/(marketing)/privacy/page.mdx` |
| `terms.md` | `docs/legal/terms.md` + `/terms` |
| `cookies.md` | `docs/legal/cookies.md` + `/cookies` + cookie banner component strings from `ui-microcopy.md` |
| `moderation.md` | `docs/legal/moderation.md` + `/moderation` |
| `report-content.md` | `docs/legal/report.md` + `/report` (+ form) |
| `governance.md` | `docs/legal/governance.md` + `/governance` |
| `ui-microcopy.md` | `docs/legal/ui-microcopy.md` or i18n/message catalogues |

## Rules

1. Edit canon in `tunes` first; re-copy these consumer files.  
2. Footer must link: Privacy · Terms · Cookies · Report · Governance.  
3. Do **not** enable analytics until cookie rules are implemented.  
4. Confirm Art 28 / transfer terms for Vercel, Supabase, and Google before public beta.  
5. Run claim-language checklist on map and press pages.

## Copy command (from `tunes` repo root)

```bash
WEB=../tunes-web/docs/legal
mkdir -p "$WEB"
cp docs/machine/governance/legal/consumers/tunes-web/privacy.md "$WEB/"
cp docs/machine/governance/legal/consumers/tunes-web/terms.md "$WEB/"
cp docs/machine/governance/legal/consumers/tunes-web/cookies.md "$WEB/"
cp docs/machine/governance/legal/consumers/tunes-web/moderation.md "$WEB/"
cp docs/machine/governance/legal/consumers/tunes-web/report-content.md "$WEB/"
cp docs/machine/governance/legal/consumers/tunes-web/governance.md "$WEB/"
cp docs/machine/governance/legal/consumers/tunes-web/ui-microcopy.md "$WEB/"
```
