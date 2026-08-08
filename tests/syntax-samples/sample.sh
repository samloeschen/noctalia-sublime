#!/usr/bin/env bash
set -euo pipefail

readonly palette="${1:-default}"
message="$(printf '%s' "$palette")"

cat <<EOF
Active palette: ${message}
EOF

if [[ "$palette" =~ ^[a-z-]+$ ]]; then
    printf 'valid: %s\n' "$palette"
fi
