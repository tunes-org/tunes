#!/usr/bin/env bash
# Create GitHub epics from docs/machine/05-github-backlog.md (idempotent-ish: skips if label+title exists).
set -euo pipefail

REPO="${1:-tunes-org/tunes}"

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"
  if gh label list -R "$REPO" --limit 200 | awk '{print $1}' | grep -qx "$name"; then
    echo "label exists: $name"
  else
    gh label create "$name" -R "$REPO" --color "$color" --description "$description"
  fi
}

issue_exists() {
  local title="$1"
  gh issue list -R "$REPO" --state all --search "in:title \"$title\"" --json title --jq '.[].title' | grep -qx "$title"
}

create_epic() {
  local title="$1"
  local repo_label="$2"
  local body="$3"

  if issue_exists "$title"; then
    echo "skip (exists): $title"
    return
  fi

  gh issue create -R "$REPO" \
    --title "$title" \
    --label "epic,$repo_label" \
    --body "$body"
}

create_label "epic" "5319E7" "Programme epic from markdown backlog"
create_label "repo:tunes" "0E8A16" "Primary work in tunes-org/tunes"
create_label "repo:tunes-ios" "1D76DB" "Primary work in tunes-org/tunes-ios"
create_label "repo:tunes-web" "FBCA04" "Primary work in tunes-org/tunes-web"

create_epic "[epic] E0 — Programme foundations" "repo:tunes" "$(cat <<'EOF'
**Problem:** Need shared charter and decisions.

**Scope:** Governance docs, ADR-001–012, indexes.

**Non-goals:** App code.

**Acceptance:** Reading order works; ADR-003 accepted.

**Privacy/data:** N/A beyond licence provisional.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E1 — Schema & examples" "repo:tunes" "$(cat <<'EOF'
**Problem:** No implementable contracts.

**Scope:** JSON examples for section measurement, consent, tiers, flags.

**Acceptance:** Examples validate against representative Central line journeys.

**Depends:** R6, architecture public-data-model.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E2 — Acoustic spike" "repo:tunes-ios" "$(cat <<'EOF'
**Problem:** Unknown controllability of iPhone audio path.

**Scope:** PCM, metrics, motion, clipping, export package.

**Tests:** Repeatability; interruption; flag correctness.

**Privacy:** Data stays on device.

Plan: [phase-2-spike-plan.md](https://github.com/tunes-org/tunes-ios/blob/main/docs/phase-2-spike-plan.md)

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E3 — Alignment UX" "repo:tunes-ios" "$(cat <<'EOF'
**Problem:** Sections wrong without correction.

**Scope:** Timeline editor; confidence display.

**Tests:** Boundary error categories; time-to-correct.

**Depends:** E2, network profile stub.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E4 — Privacy contribution flow" "repo:tunes-ios" "$(cat <<'EOF'
**Problem:** Upload must be consensual and inspectable.

**Scope:** Preview, derived-only, consent, queue, delete.

**Tests:** Privacy matrix in 06-test-strategy.md.

**Privacy:** Core epic.

**Repos:** tunes-ios + tunes-web.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E5 — Pipeline & releases" "repo:tunes-web" "$(cat <<'EOF'
**Problem:** Need auditable path from upload to open data.

**Scope:** Inspect/verify/aggregate jobs; immutable releases.

**Acceptance:** Reprocess creates new version; checksums published.

**Repos:** tunes-web + tunes.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E6 — London pilot ops" "repo:tunes" "$(cat <<'EOF'
**Problem:** Need dense valid data before map.

**Scope:** Protocol, training, reference co-measurement plan.

See [07-london-pilot.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/07-london-pilot.md).

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E7 — Public map honesty" "repo:tunes-web" "$(cat <<'EOF'
**Problem:** Sparse data looks falsely precise.

**Scope:** Map UI gates, uncertainty, tier mix, empty states.

**Acceptance:** Honesty checklist pass.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

create_epic "[epic] E8 — Community & CoC" "repo:tunes" "$(cat <<'EOF'
**Problem:** Public beta needs conduct and dispute process.

**Scope:** Full CoC, correction/dispute docs.

**Non-goals:** Gamification that encourages unsafe recording.

Source: [05-github-backlog.md](https://github.com/tunes-org/tunes/blob/main/docs/machine/05-github-backlog.md)
EOF
)"

echo "Done. Epics created in $REPO (duplicates skipped)."
