# Feature gate checklist (paste into PR)

Use when the change touches personal data, auth, cookies, UGC, location, open data, or public claims.

- [ ] Read `skills/tunes-legal-privacy/SKILL.md`
- [ ] Derived-only default preserved (or new ADR + DPIA/ethics noted)
- [ ] Upload preview + explicit consent still required before leave-device
- [ ] No TfL endorsement implication; ADR-011 claim check done for new copy
- [ ] Data classified correctly (personal / pseudonymous / anonymous) — hashes ≠ anonymous
- [ ] New processors / cookies / IP logging: lawful basis or PECR consent path noted
- [ ] Canon `docs/machine/governance/legal/` updated if behaviour changed
- [ ] `consumers/tunes-web` and/or `consumers/tunes-ios` refreshed if copy changed
- [ ] UGC: report path + moderation posture considered (pre-moderate if unsure)
- [ ] Location/postcode minimised; no unnecessary high-res tracks in open data
- [ ] No under-13 targeting; no new health/special-category fields without Art 9 plan
- [ ] Draft legal text not labelled as counsel-approved
