---
title: Markov Chains
tags:
  - probability
  - stochastic-processes
  - markov
---

# Markov Chains

A Markov chain is a stochastic process where the next state depends only on the current state, not on the full history.

$$
P(X_{n+1}=j \mid X_n=i, X_{n-1}, \ldots) = P_{ij}
$$

This is the defining memoryless property.

## Example

For a simple two-state system, the transition matrix can be written as

$$
P = \begin{pmatrix}
1-\alpha & \alpha \\
\beta & 1-\beta
\end{pmatrix}
$$

with transition probabilities between states.

## Related notes

- [[Random Walk]]
- [[Statistical Mechanics]]
- [[Molecular Simulation]]

## Experiments to try

- vary the transition probabilities and observe steady-state behavior
- compare convergence rates for different initial distributions
- inspect irreducibility and detailed balance
