# Public documentation outline

**Content source of truth:** `tunes`. **Public site hosting:** likely `tunes-web` (landing + docs pages) linking to releases in `tunes`.

## Site / README structure

1. **What is TUNES** — passenger noise experience survey; open methodology + dataset; not an operator product
2. **Affiliation disclaimer** — not TfL-operated/approved/endorsed
3. **How it works** — ios capture → review/consent → derived upload → pipeline → open releases
4. **Limitations** — survey-grade; consumer devices; uncertainty
5. **Get the app / contribute** — when available
6. **Explore the map** — with honesty explanation
7. **Open data** — releases, licence, checksums, citation
8. **Methodology** — protocol, metrics, tiers, calibration hierarchy
9. **Privacy notice** — controller, retention, withdrawal ([governance/legal/privacy-notice.md](./governance/legal/privacy-notice.md))
10. **Contributor guide** — safe practice, alignment, metadata
11. **Researcher guide** — schema, reproducibility, known biases
12. **Data dictionary**
13. **Governance** — ADRs, decision log, CoC, [ownership statement](./governance/legal/governance-and-ownership.md)
14. **Corrections & disputes** — [takedown/reporting](./governance/legal/takedown-and-reporting.md)
15. **Press / FAQ** — [claim-language checklist](./governance/legal/claim-language-checklist.md)
16. **Contact**
17. **Terms · Cookies · Moderation** — legal pack siblings

Canonical legal drafts live in `tunes`; public pages ship from `tunes-web` via [legal/consumers/tunes-web/](./governance/legal/consumers/tunes-web/).

## Citation (draft shape)

Cite dataset release ID + schema/pipeline versions + date; cite methodology doc version separately from map screenshots.

## Recommendation

Write Limitations and Privacy before marketing launch pages; keep claim language checklist on the press page.

**Confidence:** High for outline.

**Depends on experiment/legal/user-test?** Legal for privacy notice.

**Links:** [00-index-full.md](./00-index-full.md); `tunes-web/README.md`; [governance/licences.md](./governance/licences.md).
