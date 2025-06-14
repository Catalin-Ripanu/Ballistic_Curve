# Projectile Motion Program

## Overview
This program calculates the optimal launch angle for hitting a target at a specified distance using projectile motion physics.

## Requirements
- **Target Distance**: Must be greater than 1 km and less than the maximum theoretical range
- **Accuracy**: The projectile must hit within 3 meters of the target
- **Solution Selection**: When two launch angles are possible, the program selects the one with the shorter flight time (smaller angle)
- **Simulation**: Dynamic simulation of the projectile's motion until it reaches the target

## Problem Description
Given a target at a specific horizontal distance, the program:

1. Calculates the launch angle(s) that will hit the target
2. Selects the angle that provides the shortest flight time
3. Dynamically simulates the projectile's trajectory
4. Ensures the impact point is within 3 meters of the target

## Physics Considerations
- Assumes projectile motion under constant gravitational acceleration
- Neglects air resistance for simplified calculations
- Uses standard Earth gravity (9.81 m/s²)

## Expected Output
- Optimal launch angle in degrees
- Flight time to target
- Trajectory simulation showing the projectile's path
- Final impact coordinates and accuracy verification
