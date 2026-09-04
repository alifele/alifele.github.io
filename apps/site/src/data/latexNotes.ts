export interface LatexNoteItem {
  title: string;
  course: string;
  semester: string;
  description: string;
  path: string;
}

export const latexNotes: LatexNoteItem[] = [
  {
    title: "Statistical Mechanics I",
    course: "Advanced Statistical Mechanics",
    semester: "Fall 2025",
    description: "Canonical ensemble foundations, partition functions, and thermodynamic limits.",
    path: "/latex-notes/statistical-mechanics/statistical-mechanics-i.pdf",
  },
  {
    title: "Stochastic Processes Lecture Set",
    course: "Stochastic Processes",
    semester: "Spring 2026",
    description: "Markov chains, diffusion, Brownian motion, and first-passage ideas.",
    path: "/latex-notes/stochastic-processes/stochastic-processes-lectures.pdf",
  },
  {
    title: "Numerical Methods for Simulation",
    course: "Scientific Computing",
    semester: "Spring 2026",
    description: "ODE integration, Monte Carlo estimators, and error analysis for simulation pipelines.",
    path: "/latex-notes/numerical-methods/numerical-methods-notes.pdf",
  },
];
