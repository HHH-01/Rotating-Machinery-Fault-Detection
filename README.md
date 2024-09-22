# Rotating Machinery Fault Detection with Machine Learning

### Overview

Rotating machines are critical in industrial settings, and failures can lead to costly damage and safety risks. This repository contains MATLAB scripts to predict faults (e.g., misalignment, imbalance, and bearing failures) using machine learning models. The goal is to develop a low-cost, efficient system that maintains high accuracy while reducing computational costs.

### Scripts

- **Step1_Data_Gathering**: Extract the first 250,000 data records for each mode from the downloaded full data.
- **Step1b_Data_Gathering_RandomData**: Extract random data from the downloaded full data.
- **Step2_Data_Preprocess_Determine_BandPower_SamplingWindow**: Review data in the time domain and apply Z-Score to determine BandPower. 
- **Step3_Data_Process**: Refine data from the Power Bands study.
- **Step4_ML_ImportantPredictor**: Identify important predictors using the Decision Tree method.
- **Step5_ML_ClassificationLearner**: Launch the MATLAB Classification Learner.

### Data Source
https://www02.smt.ufrj.br/~offshore/mfs/page_01.html





