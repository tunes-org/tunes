# Contributing to TUNES documentation and contracts (AI agents)

This guide defines how AI coding agents change the `tunes` repository without inventing science, product behaviour, legal positions, or public claims.

**For:** autonomous and assisted coding agents, reviewers, and maintainers.

**Owns:** contribution discipline, source routing, terminology, uncertainty handling, schema/ADR expectations, and pull-request quality.

**Does not own:** scientific decisions, legal approval, product implementation in sibling repositories, or authority to change accepted ADRs.

## Repository principles

1. TUNES adds repeated passenger evidence; it does not replace professional or operator surveys.
2. Crowd in-service measurements are **survey-grade at best**.
3. The canonical comparison unit is a directed station-to-station **section** with duration `T`.
4. Objective acoustics and subjective passenger experience remain separate.
5. Privacy defaults to local record → review → consent → **derived-only** upload.
6. Raw PCM stays on the device by default.
7. Uncertainty, sample count, quality-tier mix, and limitations are part of every public result.
8. Schemas, methods, pipelines, network profiles, and dataset releases are versioned for reproducibility.
9. TUNES is **not operated, approved, or endorsed by Transport for London / TfL**.
10. Prefer a small valid dataset and explicit unknowns over false precision.

## Start with canonical sources

Read only what the task requires, but follow this routing order:

| Change | Read first |
| --- | --- |
| Mission, scope, repo ownership | [`../../README.md`](../../README.md), [`governance/project-charter.md`](./governance/project-charter.md), [`governance/repos.md`](./governance/repos.md) |
| Documentation | [`../../skills/tunes-docs/SKILL.md`](../../skills/tunes-docs/SKILL.md), [`../H00-start-here.md`](../H00-start-here.md) |
| Acoustics, calibration, pilot, claims | [`acoustic-survey-methodology.md`](./acoustic-survey-methodology.md), R2, R3, R4, ADR-006, ADR-011 |
| Privacy, consent, location, UGC, open releases | [`../../skills/tunes-legal-privacy/SKILL.md`](../../skills/tunes-legal-privacy/SKILL.md), R5, legal canon, ADR-004/005/011/013 |
| Journey and metadata | R6, R7, R8, journey architecture, ADR-002/009 |
| Perception | R9, ADR-010/011 |
| Schemas and releases | [`../../schemas/README.md`](../../schemas/README.md), JSON Schemas, R10, public-data architecture |

Treat existing documents as canonical within their stated maturity. An accepted ADR outranks a research recommendation; a working assumption is not an accepted decision; a `> Future work` section is not implemented behaviour.

## Preferred terminology

| Use | Avoid or qualify |
| --- | --- |
| **section** = directed station-to-station segment + duration | vague “segment” for the public comparison unit |
| `LAeq,T`, `LCeq,T`, `LCpeak`, named bands | “noise score” or a bare dB value |
| **reported discomfort** / **perceived loudness** | treating perception as measured acoustics |
| **quieter within the dataset’s limits** | quiet, safe, healthy, risk-free |
| **survey-grade at best** | engineering-grade, Class 1-equivalent |
| **derived features** | anonymous audio |
| **pseudonymous** where re-identification remains possible | anonymous hashes |
| **network profile** | Tube-specific core schema |
| `tunes`, `tunes-ios`, `tunes-web` for repos | moving ownership between repos for convenience |

Use **TUNES** for the programme and **Transit User Noise Experience Survey** on first expansion where context requires it.

## Documentation layers and duplication

```text
README                  human baseline
docs/H*.md              short human briefs
docs/machine/**         implementation, research, architecture, governance
docs/machine/decisions  binding decision records
schemas/**              machine-readable contracts
```

- Put a fact in its canonical layer once.
- Human briefs summarise and link; they do not paste research or ADRs.
- Machine docs state **owns / does not own** where scope may be ambiguous.
- Every new document links related canonical pages.
- Search before adding a definition, enum, metric, or policy.
- If overlap is necessary, use a short summary plus a relative link.
- Do not edit peer research merely to hide disagreement. Resolve a substantive conflict through an ADR.
- Do not turn documentation recommendations into product code in `tunes`; recorder implementation belongs in `tunes-ios`, map/pipeline implementation in `tunes-web`.

## Assumptions and uncertainty

When evidence is incomplete:

1. State the known fact and cite the repository source.
2. Label the unknown explicitly.
3. Use:

   > Future work
   >
   > Describe the experiment, legal review, user test, or decision required.

4. Keep confidence dimensions separate: acoustic, frequency, calibration, placement, journey assignment, metadata, and perception.
5. Do not invent a number, threshold, success rate, frequency range, legal basis, retention period, controller identity, or detector capability.
6. Do not turn external literature into a TUNES result. Identify it as a reference and preserve its limits.

If sources disagree, report the conflict and route it to an ADR or maintainer decision. Do not select the most convenient answer silently.

## Schema evolution

The current `schemas/v0.1.0` family is a working draft, not a frozen public contract.

For every schema change:

1. Explain the scientific or interoperability need.
2. Identify affected clients and owners across all three repos.
3. Preserve objective/subjective, observation/interpretation, calibration/quality, and privacy boundaries.
4. Prefer additive optional fields and versioned enums.
5. Update examples with the contract.
6. Run `pnpm validate-schemas`.
7. Record compatibility and migration effects.
8. Add or update an ADR when meaning, identity, privacy, release compatibility, or a settled decision changes.
9. Update human summaries only after the canonical machine source is correct.

Breaking reprocessing creates a new derived dataset release. Never silently overwrite a published release or bake a correction into the only retained value.

> Future work
>
> Exact schema SemVer policy, release schemas, migration support windows, and changelog format require a binding ADR.

## ADR discipline

Use the ADR template in [`../../skills/tunes-docs/templates.md`](../../skills/tunes-docs/templates.md):

- Context
- Decision
- Consequences
- Alternatives considered
- Links

Reference ADRs by number and relative link. A change to ADR status or substance also updates the ADR index, governance decision log where applicable, and the human decisions brief. Do not reopen an accepted ADR casually; provide new evidence and explain why the original trade-off changed.

## Privacy, legal, and claim gates

Apply `tunes-legal-privacy` before changing personal data, OAuth, cookies, analytics, consent, uploads, location, UGC, moderation, open releases, or public claim language.

Never:

- upload or publish raw audio by default;
- call pseudonymous records anonymous;
- expose precise location trails or contributor identity in open data;
- create health, hearing-damage, regulatory-compliance, or “risk” scores;
- imply TfL or operator endorsement;
- present draft legal text as lawyer-approved;
- redistribute TfL R3291 or other non-open source material.

R3291 is a methodology reference only. Preserve derived-only preview and explicit consent as architecture constraints.

## Pull-request quality

A reviewable PR:

- has one coherent purpose and names the canonical source changed;
- explains assumptions, non-goals, and affected repos;
- contains no placeholders except explicit, bounded `> Future work`;
- uses repository terminology and relative links;
- checks for duplicate content and broken links;
- updates schemas, examples, ADR/index summaries, and validation together when applicable;
- reports commands run and limitations of verification;
- preserves privacy and claim-language gates;
- contains no invented feature, statistic, legal conclusion, or scientific result.

For privacy-touching work, include the [`tunes-legal-privacy` feature-gate checklist](../../skills/tunes-legal-privacy/feature-gate-checklist.md). For schema work, include schema validation. For documentation work, verify links and confirm the human/machine layer boundary.

## Agent completion checklist

- [ ] Read the applicable skill and canonical sources.
- [ ] Confirmed repository ownership.
- [ ] Distinguished accepted decisions, assumptions, recommendations, and future work.
- [ ] Used preferred terminology and claim limits.
- [ ] Kept objective and subjective evidence separate.
- [ ] Preserved derived-only privacy and location minimisation.
- [ ] Avoided duplication and linked the source of truth.
- [ ] Added or referenced an ADR for changed meaning.
- [ ] Validated schemas/examples or links as applicable.
- [ ] Documented unresolved uncertainty without fabrication.

## Related Documents

[Human start](../H00-start-here.md) · [Machine index](./00-index-full.md) · [Project charter](./governance/project-charter.md) · [Decision index](./decisions/README.md) · [Assumptions](./01-assumptions-and-open-questions.md) · [Public data model](./architecture/public-data-model.md) · [Schema README](../../schemas/README.md) · [Documentation skill](../../skills/tunes-docs/SKILL.md) · [Legal/privacy skill](../../skills/tunes-legal-privacy/SKILL.md)
