# ADR-002: Generic railway schema (not Tube-hardcoded core)

- **Status:** Accepted
- **Date:** 2026-07-17

## Context

Open question #2: Tube-specific vs generic railway concepts in the core model.

## Decision

Core schema uses **generic railway entities** (system, line, branch, direction, station, section, etc.). London Underground terminology and IDs live in a **London network profile**, not in core type names.

## Consequences

Slightly more abstraction up front; avoids painful migrations when expanding. UI may still say “line” in London English.

**Links:** [../architecture/journey-segmentation-model.md](../architecture/journey-segmentation-model.md); [../research/06-railway-journey-model.md](../research/06-railway-journey-model.md).
