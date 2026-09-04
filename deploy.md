# Deployment and Maintenance Guide

This document explains how to preview the site locally, how to deploy it to GitHub Pages, which scripts to run when changing content, and how the website is structured.

## 1. What the site is made of

This repository uses a multi-layer structure:

- Astro: main portfolio + landing pages + navigation + general site shell
- Quartz: Obsidian/Markdown notes published as a digital garden
- Quarto: computational and scientific notes written in Markdown/Quarto
- LaTeX PDF Notes: lecture notes served as static PDF files
- GitHub Pages: production hosting
- GitHub Actions: deployment automation

The important folders are:

```text
.
├── .github/workflows/
│   └── deploy.yml
├── apps/
│   ├── site/                  # Astro website
│   │   ├── src/pages/         # homepage and page routes
│   │   ├── src/layouts/       # shared layouts
│   │   └── src/content/       # docs content for Starlight
│   └── quartz/                # Quartz app for notes
├── content/
│   ├── obsidian/              # source notes for Quartz
│   └── quarto/                # source notes for Quarto
├── apps/site/public/latex-notes/ # static LaTeX lecture-note PDFs
├── scripts/
│   ├── dev.sh
│   ├── build-astro.sh
│   ├── sync-notes.sh
│   ├── build-quartz.sh
│   ├── build-quarto.sh
│   └── build-all.sh
├── README.md
├── deploy.md
└── .nvmrc
```

## 2. Local preview workflow

### Requirements

- Node.js 22+
- npm
- Quarto (optional but recommended for computational notes)

Use the project version:

```bash
nvm install 22.12.0
nvm use 22.12.0
```

### Start the Astro site locally

From the repo root:

```bash
./scripts/dev.sh
```

This runs the site with Astro in dev mode and exposes it on a local port.

### Preview the built version locally

After a build, preview the generated static site:

```bash
cd apps/site
npm run preview -- --host 0.0.0.0
```

This is useful to check the real production build, not just the dev server.

## 3. How to update each section of the site

### Astro pages and homepage

Edit files in:

```text
apps/site/src/pages/
apps/site/src/layouts/
```

Examples:

- `apps/site/src/pages/index.astro` -> homepage
- `apps/site/src/pages/research/index.astro` -> research page
- `apps/site/src/pages/projects/index.astro` -> project index
- `apps/site/src/pages/labs/brownian.astro` -> simulation page

After editing, run:

```bash
cd apps/site
npm run build
```

Or from the repo root:

```bash
./scripts/build-astro.sh
```

### Notes / digital garden (Quartz + Obsidian)

Edit markdown files in:

```text
content/obsidian/
```

Examples:

- `content/obsidian/Markov Chains.md`
- `content/obsidian/Random Walk.md`
- `content/obsidian/physics/Statistical Mechanics.md`

Then sync them into Quartz:

```bash
./scripts/sync-notes.sh
```

Then build the Quartz site:

```bash
./scripts/build-quartz.sh
```

This produces static content that is copied into:

```text
apps/site/public/notes/
```

### Quarto scientific notes

Edit Quarto files in:

```text
content/quarto/
```

Examples:

- `content/quarto/stochastic-processes.qmd`
- `content/quarto/markov-chains.qmd`
- `content/quarto/physics/statistical-mechanics.qmd`

Render them with:

```bash
./scripts/build-quarto.sh
```

This copies the rendered output to:

```text
apps/site/public/computational-notes/
```

### LaTeX lecture notes (PDF)

Store your PDF files here:

```text
apps/site/public/latex-notes/
```

Recommended layout:

```text
apps/site/public/latex-notes/
├── statistical-mechanics/
│   └── statistical-mechanics-i.pdf
├── stochastic-processes/
│   └── stochastic-processes-lectures.pdf
└── numerical-methods/
    └── numerical-methods-notes.pdf
```

Then register each PDF in:

```text
apps/site/src/data/latexNotes.ts
```

Each item contains title, course, semester, description, and the public PDF path.

### Software docs / documentation section

The docs content lives in:

```text
apps/site/src/content/docs/
```

This is the place for long-form software documentation, architecture notes, and project writeups.

## 4. When to run which script

### Small change in Astro

Use:

```bash
cd apps/site
npm run build
```

or

```bash
./scripts/build-astro.sh
```

### New or changed Obsidian notes

Use:

```bash
./scripts/sync-notes.sh
./scripts/build-quartz.sh
```

### New or changed Quarto notes

Use:

```bash
./scripts/build-quarto.sh
```

### Final validation before deployment

Run the full build:

```bash
./scripts/build-all.sh
```

This is the main “everything works” script and should be used before pushing to production.

For LaTeX notes only (PDF add/update), no special script is required beyond Astro build:

```bash
./scripts/build-astro.sh
```

or full validation:

```bash
./scripts/build-all.sh
```

## 5. Deployment to GitHub Pages

The deployment workflow is defined in:

```text
.github/workflows/deploy.yml
```

It performs the full site build and uploads the final Astro output as a GitHub Pages artifact.

### Required workflow behavior

The workflow installs:

- Node.js 22
- Astro dependencies
- Quartz dependencies
- Quarto

Then it runs:

```bash
./scripts/build-all.sh
```

and deploys the output from:

```text
apps/site/dist
```

### Steps to deploy

1. Push changes to the `main` branch.
2. GitHub Actions runs automatically.
3. The site is built and deployed to GitHub Pages.

You can also trigger deployment manually from the GitHub Actions tab with `workflow_dispatch`.

## 6. How to change site sections and content

### Homepage

File:

```text
apps/site/src/pages/index.astro
```

Update:

- hero text
- tagline
- cards linking to sections
- visual style or landing text

### Research section

File:

```text
apps/site/src/pages/research/index.astro
```

Add or edit:

- ongoing research themes
- active projects
- links to papers or simulations

### Papers section

File:

```text
apps/site/src/pages/papers/index.astro
```

Use this section for:

- publications
- preprints
- talks
- manuscript links

### Projects section

Files:

```text
apps/site/src/pages/projects/index.astro
apps/site/src/pages/projects/software.astro
apps/site/src/pages/projects/electronics.astro
```

Use them to list:

- research software
- libraries
- hardware notebooks
- electronics experiments

### Simulations and labs

Files:

```text
apps/site/src/pages/simulations/index.astro
apps/site/src/pages/labs/index.astro
apps/site/src/pages/labs/brownian.astro
apps/site/src/pages/labs/markov-chain.astro
```

This is where interactive demos live.

To add a new lab:

1. create a new `.astro` file under `src/pages/labs/`
2. import `BaseLayout`
3. add the simulation code and UI
4. link it from `src/pages/labs/index.astro`

### Notes / Quartz section

Files:

```text
content/obsidian/
```

Add note files and use wikilinks like:

```md
[[Markov Chains]]
[[Random Walk]]
[[Statistical Mechanics]]
```

This gives the digital-garden behavior: notes are connected and discoverable.

### Quarto computational notes

Files:

```text
content/quarto/
```

Use this area for:

- scientific derivations
- numerical examples
- parameter sweeps
- data-analysis notes
- reproducible code examples

### LaTeX notes page

Route:

```text
/latex-notes/
```

Files controlling it:

```text
apps/site/src/pages/latex-notes/index.astro
apps/site/src/data/latexNotes.ts
```

How it works:

1. Put PDFs under `apps/site/public/latex-notes/...`
2. Add/update entries in `latexNotes.ts`
3. Build Astro (`./scripts/build-astro.sh`)
4. Open `/latex-notes/` and click a note; it opens in a new tab

## 7. General website structure philosophy

The site is designed as a personal computational laboratory rather than a simple academic homepage.

It combines:

- portfolio content
- research description
- technical notes
- software and electronics projects
- interactive simulations
- connected note-taking
- reproducible scientific writing

The structure is intentionally modular so it can grow over time.

## 8. Recommended workflow for regular use

For day-to-day work:

1. Edit the relevant files.
2. Run the smallest relevant build.
3. Preview locally.
4. Run full build before pushing.
5. Push to GitHub.
6. GitHub Actions deploys automatically.

Recommended commands:

```bash
# start local site
./scripts/dev.sh

# build Astro only
./scripts/build-astro.sh

# sync/refresh Quartz notes
./scripts/sync-notes.sh
./scripts/build-quartz.sh

# render Quarto notes
./scripts/build-quarto.sh

# full final validation
./scripts/build-all.sh
```

## 9. Troubleshooting

### The notes page is 404

- confirm the files were generated in `apps/site/public/notes/`
- run `./scripts/build-quartz.sh`
- rerun `./scripts/build-all.sh`

### The computational notes page is 404

- confirm the files were generated in `apps/site/public/computational-notes/`
- run `./scripts/build-quarto.sh`
- rerun `./scripts/build-all.sh`

### Astro build fails

- ensure Node 22 is active
- run:

```bash
nvm use 22.12.0
```

### GitHub Pages deployment fails

- ensure the workflow uses Node 22
- ensure `./scripts/build-all.sh` works locally
- check the Actions logs for missing dependencies or missing Quarto setup

## 10. Final recommendation

Use this repository as a source-based documentation and content system:

- write content in the right source folder
- build only that subsystem while developing
- run the full build before deployment
- keep the main portal in Astro, with notes and computational content as generated extensions

This keeps the site easier to maintain, easier to expand, and still faithful to the computational-laboratory concept described in the project README.
