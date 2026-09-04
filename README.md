# Personal Computational Website

This repository contains the source for my personal website, hosted with **GitHub Pages**.

The goal of the site is to combine my research portfolio, scientific notes, software projects, electronics projects, documentation, and interactive computational experiments into one coherent public website.

Rather than being only a traditional academic homepage or CV, I want the site to function as a **personal computational laboratory and technical knowledge base** where visitors can read, explore, interact with simulations, inspect implementations, and learn from the projects I develop.

---

## Main Goals

The website should allow me to:

- Present my academic and professional portfolio.
- Maintain pages for my research interests and current research projects.
- Present my papers, preprints, implementations, source code, and related demonstrations.
- Publish selected notes written in **Obsidian**.
- Use **Quartz** to provide a digital-garden experience with backlinks, wikilinks, graph navigation, search, and interconnected notes.
- Publish reproducible scientific and mathematical notes written with **Quarto**.
- Document software projects and scientific libraries.
- Present electronics projects as engineering notebooks with schematics, photographs, measurements, source code, and design explanations.
- Create interactive educational simulations for molecular dynamics, statistical mechanics, stochastic processes, PDEs, dynamical systems, and related topics.
- Run lightweight simulations directly in the browser.
- Compile performance-sensitive C++ simulation code to **WebAssembly** so visitors can run real scientific code without a backend server.
- Eventually provide browser-based computational notebooks using **JupyterLite / Pyodide**.
- Host everything from one GitHub repository and deploy the complete site with **GitHub Actions + GitHub Pages**.

---

# Overall Design

The main website is built with **Astro**.

Astro acts as the common shell that provides:

- the homepage,
- navigation,
- research pages,
- paper pages,
- project pages,
- simulation pages,
- interactive laboratory pages,
- portfolio information,
- and the common visual design.

Other tools generate specialized sections of the website.

```text
                       GitHub Pages
                            |
                            v
                 alifele.github.io
                            |
          +-----------------+------------------+
          |                 |                  |
        Astro             Quartz             Quarto
     main website      Obsidian notes    computational notes
          |
          +----------------------+----------------------+
          |                      |                      |
       Projects              Simulations             Docs
          |                      |                      |
   electronics/software    JS/TS + WASM          Starlight
```

The final public website should look conceptually like:

```text
/
├── research/
├── papers/
├── projects/
│   ├── electronics/
│   └── software/
├── simulations/
│   ├── stochastic-processes/
│   ├── molecular-dynamics/
│   ├── statistical-mechanics/
│   ├── dynamical-systems/
│   └── PDEs/
├── labs/
├── docs/
├── notes/
├── computational-notes/
├── cv/
└── about/
```

---

# Technology Stack

## Astro

**Astro** is the main framework for the website.

It controls:

- homepage,
- navigation,
- portfolio,
- research pages,
- project galleries,
- papers,
- simulation pages,
- interactive laboratories,
- shared layouts,
- styles,
- and integration of the other subsystems.

Astro is intentionally the central layer because the website needs considerably more flexibility than a conventional academic website.

---

## Obsidian

I use **Obsidian** as one of the main environments for writing mathematical, scientific, programming, and electronics notes.

Typical topics include:

```text
notes/
├── mathematics/
├── probability/
├── stochastic-processes/
├── statistical-mechanics/
├── molecular-simulation/
├── electronics/
└── programming/
```

Only explicitly public notes should be published.

Private notes, administrative material, unpublished research, personal information, credentials, and copyrighted material should never automatically enter the website build.

---

## Quartz

**Quartz** is used to publish the public Obsidian vault.

Its purpose is to preserve the networked nature of the notes rather than turning them into isolated articles.

Desired features include:

- Obsidian-style wikilinks,
- backlinks,
- graph navigation,
- tags,
- LaTeX mathematics,
- search,
- transclusion,
- interconnected notes,
- and a digital-garden style knowledge base.

The public endpoint is intended to be:

```text
/notes/
```

---

## Quarto

**Quarto** is used for scientific and computational writing.

It is particularly useful when a document includes:

- mathematics,
- Python code,
- numerical experiments,
- generated plots,
- statistical analysis,
- reproducible computations,
- or notebook-style explanations.

Examples include:

- molecular simulation notes,
- Frenkel & Smit reading notes,
- Monte Carlo demonstrations,
- stochastic-process experiments,
- numerical-method notes,
- statistical-mechanics calculations,
- and research-oriented computational notebooks.

The intended public endpoint is:

```text
/computational-notes/
```

---

## Software Documentation

Software documentation should have its own structured section.

The current preferred documentation layer is **Astro Starlight**.

The documentation should support projects such as:

- DonorAcceptorMC,
- molecular-dynamics implementations,
- Monte Carlo samplers,
- graph algorithms,
- numerical libraries,
- research software,
- and reusable scientific tools.

A documentation page may contain:

- overview,
- mathematical model,
- installation instructions,
- architecture,
- API documentation,
- examples,
- algorithms,
- performance notes,
- validation,
- references,
- and links to source code.

The intended public endpoint is:

```text
/docs/
```

---

# Interactive Computational Laboratory

A major purpose of the site is to create a collection of interactive scientific demonstrations.

The long-term goal is something conceptually similar to an interactive scientific textbook or tools such as VisualPDE, but with strong emphasis on:

- stochastic processes,
- Monte Carlo algorithms,
- statistical mechanics,
- molecular simulation,
- self-assembly,
- dynamical systems,
- and scientific computing.

Example laboratories may include:

```text
Random Walk
Brownian Motion
Ornstein-Uhlenbeck Process
Birth-Death Processes
Markov Chains
Metropolis-Hastings
MCMC Mixing
Ising Model
Hard Disks
Lennard-Jones Monte Carlo
Velocity Verlet
Molecular Dynamics
Radial Distribution Functions
Diffusion
First-Passage Processes
Reaction-Diffusion Systems
Self-Assembly
```

Each interactive laboratory should ideally contain:

1. The scientific question.
2. The mathematical model.
3. An interactive simulation.
4. Adjustable parameters.
5. Live observables and plots.
6. Suggested experiments for the visitor.
7. Explanation of the algorithm.
8. Implementation details.
9. Links to source code.
10. References and further reading.

A typical page should feel like:

```text
Simulation Title
------------------------------------------------

Scientific motivation

Mathematical model

        Interactive Controls
        --------------------
        parameter 1  [slider]
        parameter 2  [slider]
        parameter 3  [slider]

        [Run] [Pause] [Reset]

        +----------------------+
        |                      |
        |     simulation       |
        |                      |
        +----------------------+

        Observable / live plot

Mathematical explanation

Algorithm

Implementation

Experiments to try

References

Source code
```

---

# Browser Simulations

Simple simulations should initially be written in:

- TypeScript / JavaScript,
- HTML Canvas,
- SVG,
- WebGL,
- and Web Workers where useful.

This is appropriate for simulations such as:

- random walks,
- Brownian motion,
- Markov chains,
- simple Monte Carlo,
- basic stochastic differential equations,
- cellular automata,
- and educational visualizations.

The browser performs the computation locally, so no application server is required.

---

# WebAssembly and C++

For heavier simulations, I want to reuse or develop C++ implementations and compile them to **WebAssembly** using Emscripten.

The intended pipeline is:

```text
C++ simulation
      |
      v
 Emscripten
      |
      v
 WebAssembly
      |
      v
 Web Worker
      |
      v
 Astro interactive page
      |
      v
 visitor's browser
```

This will eventually allow real implementations of:

- molecular dynamics,
- Monte Carlo samplers,
- self-assembly algorithms,
- graph samplers,
- and computationally expensive stochastic simulations

to execute directly in the user's browser.

This is preferable to replacing scientific implementations with simplified animations.

---

# Electronics Projects

Electronics projects should be presented as proper engineering project pages rather than a simple image gallery.

A project page may include:

- motivation,
- design requirements,
- architecture,
- schematics,
- circuit diagrams,
- photographs,
- breadboard or PCB layouts,
- component lists,
- oscilloscope traces,
- frequency-response measurements,
- SPICE simulations,
- firmware,
- source code,
- debugging history,
- design decisions,
- failures and revisions,
- and lessons learned.

Possible projects include:

- 555 timer circuits,
- analog audio electronics,
- filters and oscillators,
- 6502 computers,
- digital logic,
- microcontrollers,
- signal-processing experiments,
- RF experiments,
- measurement projects,
- and test-equipment explorations.

---

# Research and Papers

The website should provide more than a publication list.

Each important research project or paper should be connected to its:

- research question,
- mathematical formulation,
- paper/preprint,
- code,
- software documentation,
- simulation,
- supporting notes,
- and related projects.

For example:

```text
Research project
      |
      +---- Paper
      |
      +---- Source code
      |
      +---- Documentation
      |
      +---- Interactive demonstration
      |
      +---- Mathematical notes
```

Paper pages should eventually provide:

- citation information,
- abstract,
- key idea,
- visual explanation,
- PDF link,
- DOI,
- implementation,
- code repository,
- related simulation,
- related documentation,
- BibTeX,
- and supporting notes.

---

# Software Projects

Software projects should be treated as technical artifacts, not just portfolio cards.

A software project page should explain:

- why the project exists,
- the scientific/computational problem,
- architecture,
- algorithms,
- design decisions,
- implementation,
- performance,
- testing,
- validation,
- limitations,
- examples,
- documentation,
- and source code.

Where appropriate, software projects should connect directly to interactive browser demonstrations.

---

# Relationship Between the Different Sections

A central design principle is that the website should not feel like several disconnected sites.

Notes, research, software, simulations, documentation, and projects should cross-reference each other.

For example:

```text
Detailed Balance note
        |
        v
Metropolis tutorial
        |
        v
Interactive Metropolis laboratory
        |
        v
C++ implementation
        |
        v
Software documentation
        |
        v
Research project / paper
```

Similarly:

```text
Lennard-Jones notes
        |
        v
Quarto computational experiment
        |
        v
Interactive MD simulation
        |
        v
C++ / WASM implementation
        |
        v
Documentation
```

This interconnection is one of the main reasons for building the site.

---

# Repository Structure

The intended repository structure is approximately:

```text
alifele.github.io/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── apps/
│   ├── site/                       # Astro website
│   │   ├── src/
│   │   │   ├── components/
│   │   │   ├── layouts/
│   │   │   ├── content/
│   │   │   └── pages/
│   │   │
│   │   └── public/
│   │
│   └── quartz/                     # Quartz digital garden
│
├── content/
│   ├── obsidian/                   # public Obsidian vault
│   └── quarto/                     # Quarto scientific notes
│
├── simulations/
│   ├── stochastic-processes/
│   ├── monte-carlo/
│   ├── molecular-dynamics/
│   └── statistical-mechanics/
│
├── wasm/
│   ├── common/
│   ├── md/
│   └── monte-carlo/
│
├── scripts/
│   ├── sync-notes.sh
│   └── build-all.sh
│
└── _build/                         # generated deployment output
```

---

# Build and Deployment

Everything should eventually be assembled into a single static directory.

Conceptually:

```text
                    git push
                       |
                       v
                GitHub Actions
                       |
       +---------------+---------------+
       |               |               |
       v               v               v
     Astro           Quartz          Quarto
       |               |               |
       +-------+-------+-------+-------+
               |               |
               v               v
             WASM            Docs
               \               /
                \             /
                 v           v
                    _build/
                       |
                       v
                  GitHub Pages
                       |
                       v
              alifele.github.io
```

GitHub Pages is responsible only for serving the generated static files.

The visitor's browser performs interactive computation.

---

# Development Philosophy

The site should be developed incrementally.

## Phase 1

Create a stable Astro site containing placeholders for:

- home,
- about,
- research,
- papers,
- projects,
- simulations,
- laboratories,
- and documentation.

## Phase 2

Integrate public Obsidian notes.

## Phase 3

Integrate Quartz.

## Phase 4

Integrate Quarto.

## Phase 5

Create reusable interactive simulation components.

## Phase 6

Develop stochastic-process and statistical-mechanics laboratories.

## Phase 7

Add C++ → WebAssembly simulations.

## Phase 8

Expand software documentation.

## Phase 9

Add JupyterLite / Pyodide if useful.

## Phase 10

Improve search, cross-linking, visual design, accessibility, performance, and educational content.

---

# What I Want the Website to Become

The long-term objective is to build more than a personal homepage.

I want this website to become a combination of:

- academic portfolio,
- research archive,
- public notebook,
- digital garden,
- software documentation site,
- electronics engineering notebook,
- computational textbook,
- interactive mathematical laboratory,
- and showcase of scientific implementations.

Visitors should be able to move naturally between:

```text
idea
  ↓
mathematics
  ↓
algorithm
  ↓
implementation
  ↓
interactive experiment
  ↓
software
  ↓
research
```

The site should reflect the way I work across mathematics, physics, computation, software engineering, and electronics, while also making the material useful and educational for other people.

---

# Guiding Principle

The central idea of the project is:

> **Do not merely show finished projects. Show the mathematics, reasoning, implementation, experiments, and interactive behavior behind them.**

The website should make technical work explorable rather than simply list it.
