# Consent record fields

**Status:** Draft — implementers  
**Version:** 0.1.0-draft  
**Last-updated:** 2026-07-20

Store these fields whenever a user consents to upload or to a distinct processing purpose. Required for accountability under UK GDPR.

| Field | Description |
| --- | --- |
| `consent_id` | Unique ID for this consent event |
| `subject_ref` | Account ID or anonymous upload handle (pseudonymous OK) |
| `timestamp` | ISO-8601 UTC |
| `privacy_notice_version` | e.g. `0.1.0-draft` |
| `terms_version` | Terms/contributor rules version |
| `purposes` | Array of purpose codes (e.g. `derived_upload`, `open_publication`, `account`) |
| `privacy_tier` | P0–P5 (see R5); default upload = P1 |
| `payload_summary_hash` | Hash of the previewed field list / schema (not the raw audio) |
| `app_version` | iOS or web client version |
| `pipeline_version` | Expected / declared pipeline version if known |
| `locale` | UI language of the consent screen |
| `withdrawal_handle` | How the user can withdraw later |
| `method` | `in_app_checkbox` / `web_form` / etc. |

**Rules**

- Do not bury contribution consent inside general terms acceptance alone.  
- Keep consent records even after contribution withdrawal (as evidence), unless counsel directs otherwise.  
- Never log raw audio or free text inside consent records.
