# ADR-007: Wearables (Watch / AirPods) out of v1 scope

- **Status:** Accepted
- **Date:** 2026-07-17

## Context

Open question #7. Wearables may lack controllable raw audio / consistent calibration.

## Decision

Do **not** support Apple Watch or AirPods as measurement sources for launch. Track as **experiment backlog** after iPhone collector validation.

## Consequences

Avoids false precision from OS-exposed “noise” values without independent validation.

**Links:** [../research/03-consumer-device-limits.md](../research/03-consumer-device-limits.md).
