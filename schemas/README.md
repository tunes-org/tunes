# TUNES JSON schemas (Phase 1 prototype)

**Status:** `v0.1.0` working draft — implementable enough for `tunes-ios` / `tunes-web` spikes; not frozen for public release.

| Version | Purpose |
| --- | --- |
| `v0.1.0` | Section measurement, consent, derived upload package, London network profile stub |

## Layout

```text
schemas/v0.1.0/     JSON Schema (draft 2020-12)
examples/v0.1.0/    Validated examples
```

## Validate locally

```bash
pnpm install
pnpm validate-schemas
```

CI runs the same check on pull requests.

## Ownership

Canonical contracts live here (`tunes`). See [public-data-model.md](../docs/machine/architecture/public-data-model.md) and [ADR-002](../docs/machine/decisions/ADR-002-generic-railway-schema.md).

**Licence:** CC BY 4.0 (provisional — [ADR-012](../docs/machine/decisions/ADR-012-licences.md)).
