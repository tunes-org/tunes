# TUNES doc templates

Copy and fill. Keep H\* short; put depth in machine.

---

## Human brief (`docs/HNN-slug.md`)

```markdown
# HNN — Short title

One-line framing if needed.

## Section

- Bullet
- Bullet

| Col | Col |
| --- | --- |
| A | B |

## Detail

[machine path](./machine/…) · [related ADR](./machine/decisions/ADR-0NN-….md)
```

Add a row to `docs/H00-start-here.md`.

---

## ADR (`docs/machine/decisions/ADR-0NN-slug.md`)

```markdown
# ADR-0NN: Title

- **Status:** Accepted
- **Date:** YYYY-MM-DD
- **Deciders:** Programme lead

## Context

What forced the decision.

## Decision

The binding choice (tables OK).

## Consequences

What changes for ios / web / releases / claim language.

## Alternatives considered

- **Option** — why rejected

**Links:** [related governance or research](…)
```

Then update `docs/machine/decisions/README.md` and `docs/H03-decisions.md`.

---

## Research note (`docs/machine/research/NN-slug.md`)

```markdown
# RNN — Title

Decision-oriented research for TUNES. **Owns:** … **Does not own:** …

## 1. Decision questions

1. …

## 2. Findings / transferable practices

…

## 3. Recommendation

…

**Confidence:** High | Medium | Low

**Depends on experiment/legal/user-test?** Yes/No — …

**Links:** …
```

---

## Architecture note (`docs/machine/architecture/….md`)

```markdown
# Title

**Owns:** …  
**Does not own:** …

## Model / flow

…

## Boundaries

…

**Links:** related ADRs · H\* summary if humans need a glance
```
