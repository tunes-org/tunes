<!-- CONSUMER COPY for tunes-web. Source of truth: docs/machine/governance/legal/governance-and-ownership.md — edit canon first, then re-sync. Version: 0.1.0-draft -->

# Governance and ownership statement

**Status:** Draft — counsel review required  
**Version:** 0.1.0-draft  
**Last-updated:** 2026-07-20

---

## 1. What TUNES is

TUNES (Transit User Noise Experience Survey) is an independent, London-first public programme collecting passenger perceptions and derived measurements of noise on ordinary rail journeys, and publishing an open methodology with versioned datasets.

## 2. Independence

TUNES is **not** operated, approved, or endorsed by Transport for London or any other transport operator. Professional practice notes (including materials obtained via FOI) may inform methodology as **references** only — not as affiliation or redistributable operator data.

## 3. Ownership of repositories and releases

| Asset | Owner repo / party |
| --- | --- |
| Charter, ADRs, research, methodology, schema docs, open dataset releases | `tunes` programme (controller / future CLG) |
| iOS recorder product | `tunes-ios` |
| Landing, map, pipeline | `tunes-web` |

Code and data licences are provisional until legal review (see ADR-012). Planning assumption: MIT (app code) + CC BY 4.0 (docs/public data).

## 4. Who controls personal data

**Controller:** Hao-Tsun Kuo (until CLG incorporation)  
**Contact:** manglekuo@gmail.com

Entity form follows [ADR-013](../../../../decisions/ADR-013-controller-and-entity.md): informal named controller(s) until incorporation triggers; then a **company limited by guarantee**. CIC is optional later for funder asset-lock needs.

## 5. How decisions are made

Binding scientific and programme decisions are recorded as **ADRs** in `tunes` and summarised in the decision log. Day-to-day product work in `tunes-ios` / `tunes-web` must not contradict accepted ADRs (especially privacy defaults and claim language).

## 6. Community conduct

See the [code of conduct outline](../../../code-of-conduct-outline.md) and [moderation policy](./moderation.md). A full CoC will be adopted before public community launch.

## 7. Contact

General: `manglekuo@gmail.com`  
Reports / takedown: `manglekuo@gmail.com`

---

*Draft only — not lawyer-approved.*
