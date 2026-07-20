# Scope statement

## In scope (programme)

- Research and methodology for crowdsourced passenger rail noise
- London-first pilot with dense repeated coverage over shallow network-wide scrape
- iOS-first local recording → review → consent → derived upload
- Versioned open datasets with provenance, quality tiers, and uncertainty
- Public map that refuses false precision
- Generic railway schema capable of later cities/modes without Tube-only core types

## Out of scope (for now)

- Claiming TfL endorsement or official operator status
- Replacing professional / regulatory surveys
- Premature Android, Watch, AirPods, or worldwide network support as launch requirements
- Silent upload of raw audio or unexplained blended “risk scores”
- Product feature implementation during the docs-only research execution

## Initial product components (owned across repos)

| Component | Primary repo |
| --- | --- |
| A. Mobile recorder | `tunes-ios` |
| B. Data-processing pipeline | `tunes-web` (runtime); schemas/releases in `tunes` |
| C. Public map | `tunes-web` |
| D. Research / methodology publication | Content in `tunes`; presentation may be hosted via `tunes-web` |
| E. Contributor community mechanisms | Designed in `tunes`; implemented later across apps |

## Canonical comparison unit (working assumption)

**Station-to-station section** with explicit duration — aligned with professional survey practice (see [acoustic-survey-methodology.md](../acoustic-survey-methodology.md)). Test in research; do not abandon without ADR.

## Privacy default (working assumption)

**Derived-only upload** after local review and explicit consent. Raw audio leaves the device only under a separate, restricted tier if ever justified.

## Recommendation

Lock London-first + portable schema + three-repo ownership for planning; keep network-breadth and raw-audio edge cases as open decisions tracked in [../01-assumptions-and-open-questions.md](../01-assumptions-and-open-questions.md).

**Confidence:** High for defaults above; Medium for Underground-only vs all London rail at public launch.

**Depends on experiment/legal/user-test?** Yes for network breadth UX and legal retention.

**Links:** [project-charter.md](./project-charter.md); [repos.md](./repos.md).
