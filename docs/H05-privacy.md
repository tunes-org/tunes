# H05 — Privacy

## Default flow

1. Record locally  
2. Process locally where practical  
3. Infer sections · user reviews / trims  
4. Show **exactly** what will upload  
5. Explicit consent  
6. Upload **derived only**  
7. User can delete raw / withdraw later  

## Defaults

| Topic | Rule |
| --- | --- |
| Raw audio | Stays on device (ADR-004) |
| Upload | Derived features default (ADR-005) |
| Location | Minimise; section assignment ≠ full GPS trail |
| Speech | Incidental speech is a risk — prefer features over audio |
| Free text | Extra personal-data risk — treat carefully |
| Controller / entity | Named controller(s); CLG by launch (ADR-013) |
| Legal copy | Canon in `tunes` legal pack; sync web/ios consumers |

## Contribution tiers (data sensitivity)

| Payload | When |
| --- | --- |
| Derived only | Default / public path |
| Short excerpts | Rare, explicit, higher bar |
| Full raw | Research-restricted only, if ever |
| Research-restricted | Separate access controls |

## Detail

[privacy ethics](./machine/research/05-privacy-ethics.md) · [UK legal R12](./machine/research/12-uk-legal-governance-dp.md) · [legal pack](./machine/governance/legal/README.md) · [H11](./H11-legal-governance.md) · [ios client flow](../../tunes-ios/docs/privacy-client-flow.md) · ADR-004/005/013
