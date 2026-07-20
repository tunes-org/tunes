# Risk register

| ID | Risk | Impact | Likelihood | Mitigation | Owner repo |
| --- | --- | --- | --- | --- | --- |
| R01 | Misleading measurements presented as precise | High | Medium | Tiers, uncertainty UX, claim ADR-011 | tunes-web + tunes |
| R02 | Unsupported medical / “acoustic risk” claims | High | Medium | ADR-011; press review | tunes |
| R03 | Privacy breach / incidental speech | High | Medium | Derived-only default; raw on-device; threat model | ios + web |
| R04 | Device fragmentation / OS audio changes | High | High | Model profiles; quality flags; spike tests | ios |
| R05 | Poor contributor retention | Medium | Medium | Minimise forms; offline-first; motivation design (R1) | ios + tunes |
| R06 | Sparse coverage → false map confidence | High | High | Honesty chrome; gates; dense pilot first | web |
| R07 | Malicious / fabricated contributions | Medium | Medium | Provenance, duplicates, reputation light-touch | web + tunes |
| R08 | Operator objections | Medium | Medium | Transparent method; no affiliation; useful evidence framing | tunes |
| R09 | Accidental TfL endorsement implication | High | Medium | Charter language; site footer; PR review | web + tunes |
| R10 | Academic criticism of method | Medium | Medium | Cite limits; survey-grade labelling; open pipeline | tunes |
| R11 | Licensing conflict | Medium | Low | ADR-012; legal before publish | tunes |
| R12 | Dataset maintenance burden | Medium | High | Versioned releases; don’t silently mutate | tunes + web |
| R13 | Cost/risk of audio storage | Medium | Low if derived-only | Keep ADR-004/005 | web |
| R14 | International expansion complexity | Medium | Low near-term | Portable schema; delay Phase 10 | tunes |
| R15 | Alignment errors → wrong section stats | High | Medium | User confirmation gate; confidence dims | ios |
| R16 | Quiet-room mistaken for calibration | Medium | Medium | Explicit UX + docs | ios + tunes |

## Recommendation

Treat R01, R03, R06, R09 as launch blockers; review this register each phase exit.

**Confidence:** Medium.

**Depends on experiment/legal/user-test?** Legal for R03/R11; experiments for R04/R15.

**Links:** [04-roadmap.md](./04-roadmap.md); [decisions/ADR-011-claim-language.md](./decisions/ADR-011-claim-language.md).
