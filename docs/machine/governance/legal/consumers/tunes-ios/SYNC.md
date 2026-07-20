# Syncing legal copy into `tunes-ios`

**Canon:** `tunes/docs/machine/governance/legal/`  
**These files:** in-app summaries and consent/safety strings  
**Version aligned to:** 0.1.0-draft (2026-07-20)

Full privacy notice stays on the website; the app shows layered summaries and links out.

## Suggested paths in `tunes-ios`

| Consumer file | Suggested destination |
| --- | --- |
| `privacy-summary.md` | `docs/legal/privacy-summary.md` + Localizable strings |
| `consent-preview-copy.md` | Consent / upload preview screens |
| `contributor-safety.md` | First-run or pre-record safety sheet |
| `withdrawal-and-deletion.md` | Settings / contribution history |
| `account-and-oauth.md` | Sign-in screen (if OAuth in app) |
| `ui-microcopy.md` | Perception survey + incidental-speech warnings |

Also update `docs/privacy-client-flow.md` to cite these drafts — do not invent a second privacy model.

## Rules

1. Edit canon in `tunes` first.  
2. Implement the R5 **8-step** flow; nothing leaves the device before consent.  
3. Default payload = derived-only (ADR-004/005).
4. Replace placeholders before public beta.  
5. Link to full web privacy notice: `https://tunesurvey.com/privacy`

## Copy command (from `tunes` repo root)

```bash
IOS=../tunes-ios/docs/legal
mkdir -p "$IOS"
cp docs/machine/governance/legal/consumers/tunes-ios/*.md "$IOS/"
# then exclude SYNC.md from product bundle if desired
```
