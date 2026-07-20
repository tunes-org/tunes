# ADR-013: Controller identity and legal entity form

- **Status:** Accepted provisional  
- **Date:** 2026-07-20  
- **Deciders:** Programme lead

## Context

Open question: data controller identity and GDPR roles across repos/hosting. TUNES will use Supabase/Vercel, OAuth, contributions, and possibly public comments. Founders need a proportionate UK entity path without premature CIC overhead. Research: [R12](../research/12-uk-legal-governance-dp.md).

## Decision

1. **Controller (pre-incorporation):** Hao-Tsun Kuo (`manglekuo@gmail.com`) is the public controller contact until the CLG is incorporated. If purposes and means are jointly determined, document a joint-controller arrangement.  
2. **Entity sequencing:**  
   - Start **informal** (named controllers) for private prototype / early dogfood.  
   - Incorporate as a **private company limited by guarantee (CLG)** when any incorporation trigger fires, and **no later than public London launch**.  
   - Do **not** start as a CIC; revisit CIC only after CLG if funders require a statutory asset lock.  
3. **Incorporation triggers** (any one): dedicated project bank money; contractors/insurance in project name; public dataset/map with meaningful liability; public OAuth+comments at scale; partners/funders requiring a legal person; shared control without written ownership rules.  
4. **Legal pack** under `docs/machine/governance/legal/` is the canon for privacy/terms/moderation/cookies/takedown/ownership drafts; web/ios consume via `legal/consumers/`.  
5. **DPIA** before limited public beta / public recruitment.  
6. Processor contracts (Art 28) required for Supabase, Vercel, and OAuth providers as used.

## Consequences

- Privacy notice and governance statement carry the named pre-incorporation controller and must be updated when the CLG becomes controller.  
- Agents follow `tunes-legal-privacy` skill; claim language remains ADR-011.  
- Final controller legal name and counsel-signed policies still required before public launch.  
- ICO fee self-assessment still required (exemption does not remove UK GDPR duties).

## Alternatives considered

- **CIC from day one** — rejected as disproportionate (CIC report + Regulator) before funding need.  
- **Charity / CIO** — heavier registration; not needed for foundation volunteer research.  
- **Company limited by shares** — poor fit for non-distribution civic programme.  
- **Delay naming any controller until incorporation** — rejected; UK GDPR still applies to informal controllers.

**Links:** [R12](../research/12-uk-legal-governance-dp.md); [legal pack](../governance/legal/README.md); [R5](../research/05-privacy-ethics.md); [H11](../../H11-legal-governance.md); GOV.UK [limited company types](https://www.gov.uk/limited-company-formation/limited-company-types); [CIC guidance](https://www.gov.uk/government/publications/community-interest-companies-how-to-form-a-cic/community-interest-companies-guidance-chapters); [ICO fee](https://ico.org.uk/for-organisations/data-protection-fee/).
