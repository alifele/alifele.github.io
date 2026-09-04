#!/usr/bin/env bash

set -euo pipefail

ROOT="$(pwd)"

rm -rf _build
mkdir -p _build


echo "===== Building WebAssembly ====="

if command -v em++ >/dev/null 2>&1
then

    em++ wasm/hello/add.cpp \
        -O2 \
        -sMODULARIZE=1 \
        -sEXPORT_ES6=1 \
        -sEXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' \
        -o apps/site/public/wasm/add.js

else
    echo "Emscripten not installed; skipping WASM build."
fi


echo "===== Building Astro ====="

cd "$ROOT/apps/site"

npm run build

cd "$ROOT"

cp -a apps/site/dist/. _build/


echo "===== Building Quartz ====="

./scripts/sync-notes.sh

cd "$ROOT/apps/quartz"

# npx quartz build
npm run quartz -- build

cd "$ROOT"

mkdir -p _build/notes

cp -a apps/quartz/public/. _build/notes/


echo "===== Building Quarto ====="

cd "$ROOT/content/quarto"

quarto render

cd "$ROOT"

mkdir -p _build/computational-notes

cp -a content/quarto/_site/. \
      _build/computational-notes/


echo "===== Disable Jekyll ====="

touch _build/.nojekyll


echo "===== Build complete ====="

echo "_build/"