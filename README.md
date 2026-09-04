# Personal Computational Website

This repository is the scaffold for a personal computational website built around Astro, Quartz, and Quarto.

The site is designed to serve as a portfolio, research notebook, digital garden, project archive, and interactive lab collection.

## Project goals

- publish research and project work
- host interactive scientific simulations in the browser
- connect notes and ideas through Quartz-style wikilinks
- publish reproducible scientific notes with Quarto
- document software projects and electronics work
- deploy everything from one GitHub repository with GitHub Pages

## Architecture

- Astro: main public website and landing pages
- Quartz: public notes / digital garden / Obsidian publishing
- Quarto: reproducible computational notes and research writing
- GitHub Actions: deployment pipeline
- GitHub Pages: final public hosting

## Repository structure

```text
.
├── .github/workflows/        # GitHub Actions deployment
├── apps/
│   ├── site/                 # Astro website
│   │   ├── src/pages/        # Pages and routes
│   │   ├── src/layouts/      # Shared layout components
│   │   └── src/content/      # Docs content (Starlight)
│   └── quartz/               # Quartz app for Obsidian notes
├── content/
│   ├── obsidian/             # Public Obsidian notes for Quartz
│   └── quarto/               # Quarto notes and executable notebooks
├── scripts/
│   ├── dev.sh                # start Astro dev server
│   ├── build-astro.sh        # build the Astro site
│   ├── build-quartz.sh       # build the Quartz site
│   ├── build-quarto.sh       # render Quarto notes
│   ├── sync-notes.sh         # copy Obsidian notes into Quartz
│   ├── build-all.sh          # full project build
│   └── ...
├── _build/                   # generated final output (optional local artifact)
├── .nvmrc                    # Node 22 version
├── .gitignore
├── package.json              # root scripts for common tasks
├── README.md                 # project overview and workflow
└── ...
```

## Requirements

- Node.js 22+
- npm
- Optional: Quarto for computational note rendering
- Optional: Emscripten if you want to build WASM simulations later

## Quick start

Use a Node 22 environment:

```bash
nvm install 22.12.0
nvm use 22.12.0
```

Install dependencies for the Astro app:

```bash
cd apps/site
npm install
```

Start the local dev server:

```bash
./scripts/dev.sh
```

or directly:

```bash
cd apps/site
npm run dev -- --host 0.0.0.0
```

## Useful commands

From the repository root:

```bash
npm run dev
npm run build:astro
npm run sync:notes
npm run build:quartz
npm run build:quarto
npm run build:all
```

Or use the scripts directly:

```bash
./scripts/dev.sh
./scripts/build-astro.sh
./scripts/sync-notes.sh
./scripts/build-quartz.sh
./scripts/build-quarto.sh
./scripts/build-all.sh
```

## Recommended workflow for updates

### Small Astro change

Only when you changed pages, styles, or layout logic:

```bash
cd apps/site
npm run build
```

### Small note change

When you change Obsidian notes or Quartz content:

```bash
./scripts/sync-notes.sh
```

Then rebuild Quartz only if needed:

```bash
./scripts/build-quartz.sh
```

### Small Quarto change

When you update computational notes:

```bash
./scripts/build-quarto.sh
```

### Final validation before pushing

When you changed several sections or are preparing a deploy:

```bash
./scripts/build-all.sh
```

This is the safest full build before pushing to `main`.

## Example content included

This scaffold includes sample content to demonstrate the site concept:

- public knowledge-garden notes in `content/obsidian/`
- sample Quarto scientific notes in `content/quarto/`
- Astro pages for:
  - home
  - research
  - projects
  - simulations
  - labs
  - notes
  - computational notes
  - CV
  - about
- an interactive Brownian motion lab
- an interactive Markov chain lab

## Deployment

The GitHub Actions workflow at `.github/workflows/deploy.yml` builds the Astro app and deploys it to GitHub Pages.

Important settings for CI:

```yaml
with:
  path: ./apps/site
  package-manager: npm
  node-version: 22
```

This keeps the action aligned with Astro's supported Node version and ensures the lockfile is recognized correctly.

## Notes on generated folders

The following folders are build artifacts and usually do not need to be committed:

- `_build/`
- `apps/site/dist/`
- `apps/quartz/public/`
- `content/quarto/_site/`
- `node_modules/`

The source of truth remains in the app source and content directories.

## Example Obsidian / Quartz note pattern

The notes are meant to feel like a linked knowledge garden, for example:

```md
# Markov Chains

A Markov chain is a stochastic process where the future depends only on the present.

See also [[Random Walk]], [[Statistical Mechanics]], [[Molecular Simulation]].
```

This style makes the website behave like a connected research notebook rather than isolated pages.

## Example scientific note pattern

Quarto content can mix LaTeX and executable Python:

```qmd
---
title: "Stochastic Processes"
jupyter: python3
---

$$
\mathrm{d}X_t = \sqrt{2D}\,\mathrm{d}W_t
$$
```

This is useful for computational notes, derivations, reproducible experiments, and manuscript-style writeups.

## Future extension ideas

- add real project pages and individual case studies
- connect notes to pages with links and anchors
- add more browser simulations for random walk, Ising model, diffusion, and Monte Carlo
- add a WASM-backed scientific simulation pipeline
- expand the software docs section for your actual repositories

## Final note

This repository is intentionally scaffolded but ready to grow. The structure is designed to support a real personal computational website without locking you into a single static format.
