# ADR-003: Multi-repo layout (tunes / tunes-ios / tunes-web)

- **Status:** Accepted
- **Date:** 2026-07-17
- **Deciders:** Programme lead (docs wave)

## Context

The research brief listed unresolved decision #3: whether the first repository should combine app, web map, data processing, and methodology (monorepo) or split.

## Decision

Use **three repositories**:

| Repo | Owns |
| --- | --- |
| `tunes` | Charter, governance, research, methodology, schemas, open dataset releases |
| `tunes-ios` | iOS recorder product |
| `tunes-web` | Landing, public map, server-side pipeline (from nextjs-starter scaffold) |

Do **not** reopen “investigate monorepo” as a research question.

## Consequences

- Cross-repo contracts (schemas, licences, claim language) are owned by `tunes`
- Upload path: ios → web pipeline → published releases in `tunes`
- Backlogs tag issues `repo:tunes` | `repo:tunes-ios` | `repo:tunes-web`
- Slightly higher coordination cost; clearer scientific vs product boundaries

## Alternatives considered

- **Monorepo** — simpler atomic PRs; rejected to keep methodology/open data separable from app release cadence
- **Two repos** (combine web+data or ios+web) — rejected; pipeline/map cadence differs from recorder and from dataset releases

**Links:** [../governance/repos.md](../governance/repos.md); [../governance/decision-log.md](../governance/decision-log.md).
