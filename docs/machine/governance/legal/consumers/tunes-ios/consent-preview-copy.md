# Consent and upload preview copy

**Status:** Draft — counsel review required  
**Version:** 0.1.0-draft  
**Aligns with:** R5 8-step contribution flow

## Screen title

`Review what will upload`

## Intro

```
Nothing leaves this device until you agree. Check the list below. Raw audio is not included.
```

## Preview sections (show real values / categories)

- Journey sections (station → station) and durations  
- Derived levels / spectra summaries (as implemented)  
- Quality flags and device class  
- App / pipeline version  
- Optional perception answers (if any selected)  
- Consent / privacy notice version  

## Incidental speech

```
Train recordings may pick up other people’s voices. We upload derived metrics designed not for speech playback.
```

## Open publication

```
If you continue, we may include minimised derived data in versioned open releases under the stated licence. Third-party downloads cannot be erased from the internet. You can withdraw future inclusion later where reasonably possible.
```

## Non-affiliation / limits

```
TUNES is not TfL. Crowd data is survey-grade at best — not a health or regulatory assessment.
```

## Primary actions

- `Upload derived data` (requires checkbox below)  
- `Cancel` / `Keep on device only`  

## Required checkbox (not pre-ticked)

```
I have reviewed what will upload and I agree to the Privacy notice (v{{privacy_notice_version}}) for this derived contribution and open publication.
```

## After success

```
Upload complete. You can delete local raw audio now. Withdrawal: Settings → Contributions.
```

Store consent using [consent-record-fields.md](../../consent-record-fields.md).
