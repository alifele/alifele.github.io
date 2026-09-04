#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

rm -rf "$ROOT/apps/quartz/content"
mkdir -p "$ROOT/apps/quartz/content"
cp -a "$ROOT/content/obsidian/." "$ROOT/apps/quartz/content/"

echo "Synced Obsidian notes into apps/quartz/content"
