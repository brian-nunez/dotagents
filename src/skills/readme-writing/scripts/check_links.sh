#!/usr/bin/env bash
# Checks a README's relative links, image paths and in-page anchors.
# Usage: check_links.sh <README.md> [repo-root]
set -euo pipefail

readme=$1
root=${2:-$(dirname "$readme")}
status=0

while read -r path; do
  [ -z "$path" ] && continue
  if [ ! -e "$root/$path" ]; then
    echo "missing file: $path"
    status=1
  fi
done < <(grep -oE '(src|href|srcset)="[^"h#][^"]*"|\]\([^)h#][^)]*\)' "$readme" \
  | sed -E 's/^(src|href|srcset)="//; s/"$//; s/^\]\(//; s/\)$//; s/#.*//; s/ .*//' | sort -u)

slugs=$(grep -E '^#{1,6} ' "$readme" | sed -E 's/^#+ //' | tr 'A-Z' 'a-z' | sed -E 's/[^a-z0-9 _-]//g; s/ /-/g')

while read -r anchor; do
  [ -z "$anchor" ] && continue
  if ! grep -qx "$anchor" <<<"$slugs"; then
    echo "missing anchor: #$anchor"
    status=1
  fi
done < <(grep -oE 'href="#[^"]+"|\]\(#[^)]+\)' "$readme" | sed -E 's/^href="#//; s/"$//; s/^\]\(#//; s/\)$//' | sort -u)

exit $status
