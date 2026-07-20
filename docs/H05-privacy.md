# H05 — Privacy

## Default flow

1. Record locally  
2. Process locally where practical  
3. Infer sections
4. Review and correct alignment
5. Trim or delete
6. Show **exactly** what will upload
7. Give explicit consent
8. Upload only the selected information; the default is **derived-only**

After upload, the contributor can delete local raw audio and use the documented withdrawal path.

## Defaults

| Topic | Rule |
| --- | --- |
| Raw audio | Stays on device (ADR-004) |
| Upload | Derived features default (ADR-005) |
| Location | Minimise; section assignment ≠ full GPS trail |
| Speech | Incidental speech is a risk — prefer features over audio |
| Free text | Extra personal-data risk — treat carefully |
| Controller / entity | Named controller(s); CLG by launch (ADR-013) |
| Legal copy | Canon in `tunes` legal pack; sync `tunes-web` / `tunes-ios` consumers |

## Contribution tiers (data sensitivity)

| Payload | When |
| --- | --- |
| Derived-only | Default / public path |
| Short excerpts | Rare, explicit, higher bar |
| Full raw | Research-restricted only, if ever |
| Research-restricted | Separate access controls |

## Detail

[privacy ethics](./machine/research/05-privacy-ethics.md) · [UK legal R12](./machine/research/12-uk-legal-governance-dp.md) · [legal pack](./machine/governance/legal/README.md) · [H11](./H11-legal-governance.md) · [recorder](./H14-recorder.md) · [`tunes-ios` client flow](../../tunes-ios/docs/privacy-client-flow.md) · [ADR-004](./machine/decisions/ADR-004-raw-audio-policy.md) · [ADR-005](./machine/decisions/ADR-005-derived-only-default.md) · [ADR-013](./machine/decisions/ADR-013-controller-and-entity.md)
