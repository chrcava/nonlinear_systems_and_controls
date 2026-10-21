# Nonlinear Modeling of Cycling

A half Ironman consists of a 1.2 mile swim, a 56 mile bike, and a 13.1 mile run. Cycling is the middle and longest leg of the 
race, making it arguably the most important to master. During the bike, the athlete aims to cycle as fast as possible while preserving 
their legs for the half marathon that follows. 

The goal of this project is to model, simulate, and analyze cycling using nonlinear modeling of the mechanics of the bike and the 
biometrics of the cyclist, looking at different aerodynamic postures, hoping to maximize speed while preserving energy for the run.

## Key Engineering Concepts

- **Nonlinear Dynamics:** Modeling cyclist motion through force balances
  and equations of motion.
- **Aerodynamic Drag:** Evaluating how frontal area and velocity affect
  aerodynamic resistance and required power.
- **Adaptive Control:** Simulating changes in pedaling effort in response
  to road grade.
- **Numerical Simulation:** Modeling speed, acceleration, distance, and
  power over time using MATLAB.
- **Model Validation & Data Analysis:** Comparing simulated behavior and
  theoretical predictions with recorded cycling performance data.

## Simulation Model

The simulation was designed based on the 2025 Western Massachusetts half Ironman bike course:



## Aerodynamic Analysis

A separate MATLAB script compares the estimated power required to maintain
different cycling speeds across several rider positions.

The analysis considers:
- Hoods
- Drop bars
- Aero bars
- Plank position

These cycling postures can be seen here:

![Cycling Positions](scr/cycling%20positions.png)

It also compares estimated power requirements under calm conditions and
a significant headwind.

This analysis illustrates the relationship between aerodynamic drag,
frontal area, wind conditions, and the power required to maintain speed.

## Experimental Data Analysis

Recorded cycling data is used to compare performance across different
riding positions.

The comparison includes:
- Average and maximum speed
- Average and maximum heart rate
- Calories burned
- Time to complete a fixed-distance segment



These comparisons provide a practical complement to the physics-based
model and help connect theoretical predictions with observed performance.

## Tools & Technologies

- MATLAB
- Nonlinear dynamic modeling
- Numerical simulation
- Physics-based system modeling
- Data visualization and analysis

## READ MORE

To explore this project more, enjoy the following repository contents:

| File | Description |
|---|---|
| `Cavalluzzo nonlinear final paper.pdf` | Final paper documenting the project |
| `Cavalluzzo nonlinear final.pdf` | Final project report presentation |
| `simulation_trial1.m` | Simulates cycling dynamics, rider posture, and pacing over a course |
| `air_resistance_comparisons.m` | Compares estimated cycling power requirements across rider positions and wind conditions |
| `data_comparisons.m` | Visualizes cycling performance data collected across different rider positions |
