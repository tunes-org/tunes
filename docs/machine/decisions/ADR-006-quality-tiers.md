# ADR-006: Quality tiers (A–E working model)

- **Status:** Accepted (working labels; bounds tunable after pilot)
- **Date:** 2026-07-17

## Context

Open question #6. Need honest distinction between reference, profiled, informal, and imported measurements.

## Decision

Adopt working tiers **A–E** as defined in [../architecture/calibration-and-quality-tiers.md](../architecture/calibration-and-quality-tiers.md). Public map must not treat tiers as equivalent. In-service crowd data remains **survey-grade at best**.

## Consequences

Pipeline and map require tier + sample size gates; documentation must explain tiers to non-specialists.

**Links:** [../research/04-calibration-uncertainty.md](../research/04-calibration-uncertainty.md).
