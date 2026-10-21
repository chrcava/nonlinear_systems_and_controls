# Nonlinear Systems & Controls: Cycling Performance Simulation

A project exploring nonlinear dynamics, adaptive pacing, and
the effects of aerodynamic drag on cycling performance.

This project combines physics-based modeling, numerical simulation, and
real-world cycling data to investigate how rider position, road grade, and
power output influence speed and overall race performance.

## Project Overview

The goal of this project was to develop a nonlinear dynamic model of a cyclist and
use simulation to investigate how different riding strategies affect
performance over a long-distance course.

The model incorporates the forces acting on a cyclist, including aerodynamic
drag, rolling resistance, and gravity. It also accounts for changes in
rider posture and pedaling effort to simulate how a cyclist responds to
varying terrain.

An adaptive pacing strategy was explored to examine how effort and riding
position could be adjusted based on road conditions.

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

The simulation incorporates several physical and control-related factors:

| Component | Description |
|---|---|
| Aerodynamic drag | Models resistance as a function of velocity and rider posture. |
| Rolling resistance | Accounts for resistance between the tires and road. |
| Gravitational force | Models the effect of uphill and downhill road grades. |
| Rider biomechanics | Uses a muscle force-velocity relationship to model available pedaling force. |
| Rider posture | Represents the hoods, drops, aero bars, and a low-drag plank position. |
| Pacing strategy | Adjusts pedaling effort according to road conditions. |
| Course profile | Simulates cycling over a long-distance course with varying road grades. |

The simulation tracks speed, power, distance, road grade, and rider posture
over time. These outputs provide a way to examine the interaction between
the physical system and the chosen pacing strategy.

## Aerodynamic Analysis

A separate MATLAB script compares the estimated power required to maintain
different cycling speeds across several rider positions.

The analysis considers:
- Hoods
- Drop bars
- Aero bars
- Plank position

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

## Repository Contents

| File | Description |
|---|---|
| `simulation_trial1.m` | Simulates cycling dynamics, rider posture, and pacing over a course. |
| `air_resistance_comparisons.m` | Compares estimated cycling power requirements across rider positions and wind conditions. |
| `data_comparisons.m` | Visualizes cycling performance data collected across different rider positions. |
| `Cavalluzzo nonlinear final.pdf` | Final project report. |
| `Cavalluzzo nonlinear final paper.pdf` | Final paper documenting the project. |

## Tools & Technologies

- MATLAB
- Nonlinear dynamic modeling
- Numerical simulation
- Physics-based system modeling
- Data visualization and analysis

## Project Takeaways

This project provided an opportunity to apply nonlinear systems and
controls concepts to a physical system with interacting aerodynamic,
mechanical, and human-performance factors.

By combining a dynamic simulation with aerodynamic calculations and
experimental data, the project explored how modeling assumptions, rider
position, terrain, and pacing strategy can influence predicted cycling
performance.
