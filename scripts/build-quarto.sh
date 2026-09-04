#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v quarto >/dev/null 2>&1; then
  echo "Quarto is not installed. Skipping computational notes build."
  exit 0
fi

cd "$ROOT/content/quarto"
quarto render

rm -rf "$ROOT/apps/site/public/computational-notes"
mkdir -p "$ROOT/apps/site/public/computational-notes"
cp -a "$ROOT/content/quarto/_site/." "$ROOT/apps/site/public/computational-notes/"

echo "Quarto output synced into apps/site/public/computational-notes"
