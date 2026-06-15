#!/usr/bin/env bash
set -uo pipefail

# scrub_secrets.sh — pre-publish scan for secrets, personal data, and machine-
# specific absolute paths in tracked source. Exits non-zero if anything is found.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Files to scan: tracked text under the repo, excluding build output and binaries.
FILES=$(git ls-files 2>/dev/null || find . -type f \
  -not -path './.git/*' -not -path './.build/*' -not -path './build/*' \
  -not -path './dist/*' -not -path './vendor/*')

PATTERNS=(
  'harith\.d@outlook\.com'                       # personal email
  'ghp_[A-Za-z0-9]{20,}'                          # GitHub token
  'AKIA[0-9A-Z]{16}'                              # AWS access key
  '-----BEGIN [A-Z ]*PRIVATE KEY-----'            # private keys
  '(api[_-]?key|secret|password)[[:space:]]*[:=][[:space:]]*['"'"'"][^'"'"'"]+'
  '/Users/[A-Za-z0-9._-]+/'                       # machine-specific absolute paths
)

FOUND=0
for f in $FILES; do
  # skip the scrubber itself and the icon binary
  case "$f" in
    scripts/scrub_secrets.sh|*.icns|*.png|*.dmg) continue ;;
  esac
  [ -f "$f" ] || continue
  for p in "${PATTERNS[@]}"; do
    if grep -nEI "$p" "$f" >/dev/null 2>&1; then
      echo "⚠  $f matches: $p"
      grep -nEI "$p" "$f" | sed 's/^/     /'
      FOUND=1
    fi
  done
done

if [ "$FOUND" -ne 0 ]; then
  echo ""
  echo "❌ Potential sensitive content found. Resolve before publishing."
  exit 1
fi
echo "✅ Clean — no secrets, personal data, or machine paths in tracked source."
