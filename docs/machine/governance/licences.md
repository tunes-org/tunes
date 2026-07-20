# Licences (provisional)

**Status:** Provisional recommendations pending legal review. Do not publish releases under these until confirmed.

## Proposed split

| Asset | Provisional licence | Notes |
| --- | --- | --- |
| Application code (`tunes-ios`, `tunes-web`) | MIT | Accepted provisional direction in ADR-012 |
| Documentation in `tunes` | CC BY 4.0 | Methodology text citable with attribution |
| Public datasets / schema examples | CC BY 4.0 | Accepted provisional direction in ADR-012 |
| Third-party methodology references (e.g. TfL R3291) | **Not redistributed** | Cite as reference only; FOI report is not open-licensed |

## Principles

- Code licence per app repo; scientific docs and open data centred in `tunes`
- Dataset releases must state schema version, pipeline version, and licence in machine-readable form
- Do not mix proprietary operator reports into redistributable packages

## Recommendation

Default planning assumption: **MIT** (code) + **CC BY 4.0** (docs/data), as accepted provisionally by ADR-012 and subject to legal confirmation before first public release.

**Confidence:** Low–Medium (needs legal).

**Depends on experiment/legal/user-test?** **Legal** required before publish.

**Links:** [decision-log.md](./decision-log.md); [ADR-012](../decisions/ADR-012-licences.md); [R10 open data](../research/10-open-data-reproducibility.md).
