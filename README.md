# Queueing System Simulation (MATLAB)

## Overview
This repository contains an academic simulation assignment focused on
analyzing the impact of service-time distribution on queueing system
performance using MATLAB.

## Problem Description
The system models a single-server queue. An original model is simulated
using a baseline service-time distribution. The model is then modified
by changing the service-time distribution while keeping all other
parameters constant.

## Simulation Models
- Original_Model.m  
  Implements the baseline queueing model.

- Modified_Model.m  
  Implements the same queueing system with a modified service-time
  distribution.

## Performance Measures
- Average waiting time
- Average number in queue
- System utilization

## Key Observation
Changing the service-time distribution significantly affects waiting
time and queue performance, even when arrival characteristics remain
unchanged. Detailed discussion is provided in the accompanying PDF.

## How to Run
1. Open MATLAB
2. Set the working directory to this repository
3. Run:
   Original_Model
   Modified_Model

## Notes
This work was completed as part of an academic simulation assignment.
