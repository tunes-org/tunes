# H17 — Why TUNES exists

Railway noise is measured professionally, but the passenger’s repeated everyday experience is not described by public engineering surveys alone. TUNES exists to make that missing evidence observable, inspectable, and reusable without pretending it is something else.

**For:** passengers, contributors, researchers, operators, public authorities, funders, and future maintainers.

**Assumptions:** TUNES is independent and is **not operated, approved, or endorsed by TfL**. Passenger phone data is survey-grade at best and complements, rather than replaces, professional measurement.

## The public-data gap

Class 1 surveys and operator programmes are essential for engineering, acceptance testing, occupational assessment, and regulation. They use controlled conditions, traceable instruments, defined positions, and documented calibration.

Those strengths also define a different question. A scheduled survey does not usually provide dense public evidence across ordinary service, times, crowding levels, carriage positions, devices, and repeated passenger journeys. Existing public material may be infrequent, narrowly scoped, difficult to compare, or not open-licensed for reuse.

Passengers ask:

- Which section of this journey is often louder in the available observations?
- How variable is it, and how much evidence supports the comparison?
- Does the sound character or reported experience differ by route or context?
- Can the result be inspected rather than accepted as a map colour?

TUNES is designed around those questions.

## Passenger experience is evidence

Acoustic metrics describe physical conditions. They do not fully describe piercing tonal events, speech interference, rumble, unpredictability, discomfort, or felt suitability for a child or sensory-sensitive traveller.

Passenger reports add first-person context. They remain separate from objective measurements because perception is not a calibration method and decibels are not a complete experience score. Showing both layers, with independent samples and uncertainty, is more informative than collapsing either one.

## Community science changes the sampling model

Ordinary passengers can contribute repeated observations during real journeys. The value comes from coverage across conditions and from overlap: many auditable observations can reveal recurring patterns and disagreement that a single run cannot.

Community science also introduces bias, device variation, alignment error, privacy risk, and uneven participation. TUNES addresses these limits through:

- local-first, derived-only contribution by default
- station-to-station sections with explicit duration
- quality tiers, provenance, flags, and multi-dimensional confidence
- user-reviewed journey alignment
- versioned methods, schemas, pipelines, and releases
- explicit insufficient-evidence states

Participation does not turn phones into Class 1 instruments. It creates a different evidence layer: repeated passenger sensing, labelled honestly.

## Openness and reproducibility

The public map is useful only if its evidence can be questioned. TUNES therefore treats the open methodology and versioned dataset as outputs equal to—or more durable than—the map.

Openness means publishing definitions, limitations, schemas, quality rules, release manifests, and derived data under a reviewed licence. It does not mean publishing raw carriage recordings, personal data, non-open operator reports, or unsupported conclusions.

Reproducibility means a researcher can identify the network profile, schema, capture app, processing pipeline, exclusions, calibration state, and dataset release behind a result. Reprocessing creates a new release; it does not silently rewrite the old one.

## Different from engineering monitoring

| Engineering monitoring | TUNES |
| --- | --- |
| Controlled or specified measurement purpose | Ordinary in-service passenger journeys |
| Class-rated, traceable equipment where required | Consumer devices with explicit characterisation and tiers |
| Fixed positions and operating conditions | Variable conditions recorded as context and uncertainty |
| Regulatory, acceptance, diagnostic, or occupational use | Comparative passenger evidence and open research |
| Limited planned survey runs | Repeated community observations |
| May use operator-internal data | Publishes minimised, versioned derived evidence |

The two approaches can inform one another. TUNES may identify recurring sections or experiences worth professional investigation. Professional surveys may anchor validation experiments. Neither should be represented as the other.

## The standard TUNES sets for itself

TUNES succeeds only if it remains useful under scrutiny:

- no invented accuracy, coverage, or health claims
- no false precision on the map
- no unexplained blend of acoustics and perception
- no raw-audio publication by default
- no silent changes to released evidence
- no implication of operator endorsement
- no expansion that outruns local validation, privacy, or governance

The aim is modest but consequential: make passenger railway-noise evidence more repeatable, open, private by default, and honest about what it can support.

> Future work
>
> Scientific validity of the public map, final coverage, public-release licences, calibration tolerances, and cross-city comparability remain evidence- or review-gated. The mission does not pre-judge those outcomes.

## Related Documents

[Start here](./H00-start-here.md) · [What is TUNES](./H01-what-is-tunes.md) · [Measurement philosophy](./H10-measurement-philosophy.md) · [Public map](./H11-public-map.md) · [Project charter](./machine/governance/project-charter.md) · [Citizen science](./machine/research/01-citizen-science.md) · [Open data and reproducibility](./machine/research/10-open-data-reproducibility.md) · [Claim language](./machine/decisions/ADR-011-claim-language.md)
