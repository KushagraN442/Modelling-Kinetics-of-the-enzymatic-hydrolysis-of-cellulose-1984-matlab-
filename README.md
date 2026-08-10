# Modelling-Kinetics-of-the-enzymatic-hydrolysis-of-cellulose-1984-matlab-
A MATLAB-based kinetic model for simulating enzymatic cellulose hydrolysis based on the Gusakov et al. (1985) model.
# Enzymatic Cellulose Hydrolysis — Kinetic Model (Gusakov et al. 1985)

Reimplementation and validation of the batch-reactor kinetic model from:
Gusakov, A.V., Sinitsyn, A.P., Klyosov, A.A. (1985). *Kinetics of the enzymatic 
hydrolysis of cellulose: 1. A mathematical model for a batch reactor process.*
Enzyme and Microbial Technology, 7(7), 346-352.

## What this does
- Solves the model's 4-ODE system (amorphous/crystalline cellulose, cellobiose, glucose)
  in MATLAB using `ode45`.
- Model parameters (V(i), Km, Ki) were digitized directly from the paper's figures
  (pixel-calibrated extraction — see `data/`).
- Validated against the paper's own experimental data (Figure 5).

## Files
- `src/hydroeqs.m` — the ODE right-hand-side function
- `src/maincode.m` — sets parameters/initial conditions, solves, plots


## Status
Core model validated. Process-optimization extension in progress.
