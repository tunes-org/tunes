---
name: tunes-docs
description: >-
  Write and edit TUNES documentation using the two-layer human/machine standard.
  Use when creating or updating README, docs/H*.md human briefs, docs/machine/**
  research or architecture, ADRs, governance docs, glossaries, or public-facing
  methodology copy; or when the user asks how docs should be structured, which
  layer to edit, or how to sync H* summaries with machine detail.
---

# TUNES documentation (human + machine)

Two layers, one programme. **Do not collapse them.** Prefer editing the right layer; keep the other in sync when decisions change.

**Canonical path:** `skills/tunes-docs/` (edit only here). Tool dirs under `.cursor/`, `.claude/`, and `.agents/` are **symlinks** — see `skills/README.md`.

Paths below are **repo-root relative** (stable under symlinks).

## Layer map

| Layer | Where | Audience | Style |
| --- | --- | --- | --- |
| **Baseline** | `README.md` | First human contact | Long enough for baseline: why TUNES, what each repo does, how flow works |
| **Human** | `docs/H00`…`H19` | Reading, decisions, onboarding | Core briefs + linked topic briefs |
| **Machine** | `docs/machine/` | Implementers, agents, deep research, frequent edit | Long · detailed · linked ADRs · owns / does not own |

Redirect stub: `docs/00-index.md` → README + H00 + machine index.

## Which file to edit

```text
New reader needs the story?          → README.md (baseline)
Quick human summary / glance table?  → docs/H*.md
Implementation, research, ADR, tests? → docs/machine/**
Decision changed?                    → ADR (or machine doc) first, then update matching H*
```

**Edit rules**

1. Put implementation detail in **machine/** — keep **H\*** short.
2. When a decision, tier, privacy default, or claim limit changes → update the **machine** source (ADR / architecture / research), then refresh the **H\*** one-liner or table.
3. Do **not** invent product feature code from docs alone in the `tunes` repo.
4. Acoustic / calibration / pilot / claims work must read `docs/machine/acoustic-survey-methodology.md` (TfL R3291 practice notes = **reference only**, not affiliation or redistributable data).
5. Cross-link: every H\* ends with **Detail** or **Related Documents**, including machine sources; machine docs that humans might open should point back to README, H00, or the relevant topic brief.

## Human brief standard (H*)

**Core brief shape (`H01`–`H11`)**

- Title: `# H0N — Short name`
- Lead with the decision or fact, not preamble
- Prefer tables and bullets over paragraphs
- One purpose per file
- End with `## Detail` + relative links into `machine/`

**Topic brief shape (`H12`–`H19`)**

- Title: `# HNN — Short name`
- State who it is for and its assumptions
- Summarise canonical machine sources; do not replace them
- Use `> Future work` for evidence, legal, or product gaps
- End with `## Related Documents`, including the relevant machine sources

**Do**

- Summarise Accepted ADRs at a glance (see H03 pattern)
- State claim limits and non-affiliation clearly
- Keep the H00 **core** path roughly ~15 minutes total; topic briefs are references

**Do not**

- Paste full ADR text into H\*
- Duplicate long methodology into H\*
- Soften ADR-011 claim language for friendliness

**Index:** update `docs/H00-start-here.md` if you add/rename an H\* doc.

## README baseline standard

Root README is allowed to be **long**. It must give a new human:

1. What TUNES is (one clear paragraph)
2. **Why it is needed / relevant** (gap vs Class 1 / operator surveys)
3. What it does and does **not** claim
4. End-to-end flow (capture → consent → derived upload → release)
5. **What each repo owns** (`tunes` / `tunes-ios` / `tunes-web`) and how they connect
6. Pointers into H\* and machine docs
7. Licence + TfL non-affiliation

Do not turn the README back into a thin “start here” table only.

## Machine doc standard

**Owns / does not own** — state both near the top for research and architecture docs.

**Decision-oriented research** (`docs/machine/research/`)

- Open with decision questions
- Prefer transferable practices over invented success rates
- Separate **objective metrics** from **subjective perception**
- End sections with recommendations, confidence, and whether legal/experiment/user-test is required when that pattern is already used in neighbouring docs

**ADRs** (`docs/machine/decisions/`)

Use:

```markdown
# ADR-0NN: Title

- **Status:** Accepted | Accepted provisional | Proposed | …
- **Date:** YYYY-MM-DD
- **Deciders:** …

## Context
## Decision
## Consequences
## Alternatives considered

**Links:** …
```

Update `docs/machine/decisions/README.md` and human `docs/H03-decisions.md` when status or substance changes.

**Governance** (`docs/machine/governance/`) — charter, scope, repos, licences, decision-log are binding north stars; route scientific disputes here / via ADRs.

## Repo ownership (where content lives)

| Concern | Owner repo |
| --- | --- |
| Charter, ADRs, research, methodology, schemas, open releases, claim language | **`tunes`** |
| Recorder UX, capture, local consent, offline | **`tunes-ios`** |
| Map, landing, pipeline jobs | **`tunes-web`** |

Docs in `tunes` describe contracts; ios/web implement them. Do not move charter or open-dataset source of truth into ios/web docs.

## Non-negotiable wording

- **Affiliation:** Not operated, approved, or endorsed by Transport for London / TfL.
- **Grade:** Crowd data is **survey-grade at best** — never implied Class 1 / engineering-grade equivalence without evidence and tiers.
- **Claims:** No unsupported health / “risk” scores; follow ADR-011.
- **Privacy default:** Derived-only upload; raw audio stays on device (ADR-004 / ADR-005).
- **Comparison unit:** Station-to-station section + duration unless an ADR changes it.
- **Honesty:** No false precision on maps — show uncertainty, sample size, quality-tier mix; do not blend measured noise and perception into one unexplained score.

## Sync checklist (before finishing a docs PR)

- [ ] Edited the correct layer (README / H\* / machine)
- [ ] If decision changed: ADR or machine source updated **and** matching H\* refreshed
- [ ] H\* follows its core-brief or topic-brief shape; implementation detail lives in machine links
- [ ] Non-affiliation + claim limits intact where the topic touches public claims
- [ ] New H\* or ADR indexed (H00 and/or `decisions/README.md`)
- [ ] Links are relative and one hop to the source of truth

## Templates

Copy-paste skeletons: [templates.md](templates.md)
