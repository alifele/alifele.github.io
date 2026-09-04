#!/usr/bin/env bash

set -euo pipefail

rm -rf apps/quartz/content
mkdir -p apps/quartz/content

cp -a content/obsidian/. apps/quartz/content/
