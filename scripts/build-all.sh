#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ -s "$HOME/.nvm/nvm.sh" ]; then
  . "$HOME/.nvm/nvm.sh"
  nvm use 22 >/dev/null 2>&1 || true
fi

mkdir -p "$ROOT/_build"

echo "==> Building Astro"
"$ROOT/scripts/build-astro.sh"

mkdir -p "$ROOT/_build"
cp -a "$ROOT/apps/site/dist/." "$ROOT/_build/"

echo "==> Syncing Obsidian notes"
"$ROOT/scripts/sync-notes.sh"

echo "==> Building Quartz"
"$ROOT/scripts/build-quartz.sh"
mkdir -p "$ROOT/_build/notes"
cp -a "$ROOT/apps/quartz/public/." "$ROOT/_build/notes/"

echo "==> Building Quarto notes"
"$ROOT/scripts/build-quarto.sh"
mkdir -p "$ROOT/_build/computational-notes"
if [ -d "$ROOT/content/quarto/_site" ]; then
  cp -a "$ROOT/content/quarto/_site/." "$ROOT/_build/computational-notes/"
fi

touch "$ROOT/_build/.nojekyll"

echo "==> Build complete"
