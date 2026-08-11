# Enzymatic Cellulose Hydrolysis — Kinetic Model & Sensitivity Analysis
Reimplementation, validation, and parameter sensitivity analysis of the batch-reactor 
kinetic model from:

> Gusakov, A.V., Sinitsyn, A.P., Klyosov, A.A. (1985). *Kinetics of the enzymatic 
> hydrolysis of cellulose: 1. A mathematical model for a batch reactor process.* 
> Enzyme and Microbial Technology, 7(7), 346–352.

## Overview
This project reimplements the paper's 4-ODE kinetic model (amorphous/crystalline 
cellulose → cellobiose → glucose, with competitive product inhibition and reversible 
enzyme inactivation) in MATLAB, solves it with `ode45`, and performs a one-at-a-time 
sensitivity analysis across all 16 model parameters to identify which most strongly 
affect total product yield.

Model parameters (V(1)–V(5), the maximum reaction rates) were digitized directly from 
the paper's Figure 4 using pixel-calibrated extraction, since the paper only provides 
these as plotted curves (not a table) — max rates saturate with enzyme concentration 
rather than scaling linearly.

## Files
- `hydroeqs.m` — ODE right-hand-side function: the 5 reaction rates (v1–v5) and the 
  4 coupled differential equations (dSam, dScr, dG2, dG)
- `maincode.m` — baseline model solve + example single-parameter sweep, with plotting
- `sensitivityans.m` — full one-at-a-time sensitivity analysis across all 16 parameters 
  (±20% perturbation), ranks parameters by their effect on final product (glucose + 
  cellobiose) at t=72h

## Model equations
5 rates, each Michaelis-Menten-type with competitive product inhibition:
- v1, v2 — cellobiose formation from amorphous/crystalline cellulose (includes 
  enzyme inactivation term, e^(-k_in·t))
- v3, v4 — glucose formation from amorphous/crystalline cellulose
- v5 — glucose formation from cellobiose (via cellobiase)

Parameters: `Km(1)-Km(5)`, `Ki(1)-Ki(5)`, `k_in`, `V(1)-V(5)` — values from the 
paper's Table 2, except V(i), which were digitized from Figure 4.

## Status
- [x] Core ODE model implemented and validated against paper's Figure 5 
      (glucose/cellobiose vs. time)
- [x] One-at-a-time sensitivity analysis across all parameters
## Requirements
MATLAB (no toolboxes beyond base + ODE suite required)
MATLAB VERSION R2025b used
## Usage
```matlab
% Baseline model run + plot:
maincode

% Full sensitivity analysis (ranks all 16 parameters):
sensitivityans
```

## Reference
Gusakov, A.V., Sinitsyn, A.P., Klyosov, A.A. *Enzyme Microb. Technol.* 1985, 
7(7), 346–352. https://doi.org/10.1016/0141-0229(85)90111-5
