# Branch protection (main)

Apply when moving into **Phase 2+** implementation (first collaborator or before public beta).

## Recommended settings

| Setting | Value |
| --- | --- |
| Require pull request before merging | Yes |
| Require status checks | Yes — see repo-specific checks below |
| Require branches up to date | Yes |
| Require signed commits | Optional (team preference) |
| Restrict pushes to main | Maintainers only |

## Required status checks

| Repo | Check name |
| --- | --- |
| `tunes` | `validate` (workflow: Schema CI) |
| `tunes-web` | `ci` (workflow: CI) |
| `tunes-ios` | `ios` (workflow: CI) — once Xcode project exists |

## Apply with GitHub CLI

From a machine with admin access to `tunes-org`:

```bash
# tunes — schema validation
gh api repos/tunes-org/tunes/branches/main/protection -X PUT \
  --input - <<'EOF'
{
  "required_status_checks": {
    "strict": true,
    "checks": [{ "context": "validate" }]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null
}
EOF

# tunes-web — lint / typecheck / build
gh api repos/tunes-org/tunes-web/branches/main/protection -X PUT \
  --input - <<'EOF'
{
  "required_status_checks": {
    "strict": true,
    "checks": [{ "context": "ci" }]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null
}
EOF
```

Re-run the `tunes-ios` command after an `.xcodeproj` is added and the `ios` job runs real builds.

**Note:** Org rulesets may override branch protection — align org policy with this table.
