#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ -s "$HOME/.nvm/nvm.sh" ]; then
  . "$HOME/.nvm/nvm.sh"
  nvm use 22 >/dev/null 2>&1 || true
fi

cd "$ROOT/apps/quartz"

if [ ! -d node_modules ]; then
  npm install --silent
fi

npm run quartz -- build

rm -rf "$ROOT/apps/site/public/notes"
mkdir -p "$ROOT/apps/site/public/notes"
cp -a "$ROOT/apps/quartz/public/." "$ROOT/apps/site/public/notes/"

echo "Quartz output synced into apps/site/public/notes"
