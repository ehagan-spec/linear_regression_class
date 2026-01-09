# Lecture Materials
## Linear Regression Analysis (POL 682)

## Instructor

**Christopher Weber, PhD**  
School of Government and Public Policy  
University of Arizona  
chrisweber@arizona.edu
This directory contains lecture materials for the Linear Regression course. All lectures are written in **R Markdown** (`.Rmd`) to support reproducible analysis, integration of code and narrative, and multiple output formats.

## Format

- **File type**: R Markdown (`.Rmd`)
- **Output**: HTML slides and documents
- **Code execution**: All examples are reproducible
- **Required packages**: Available in the `renv` lockfile

## Course Schedule & Lectures

### **Week 1 (1/13): Welcome and Introduction**
- **Lecture**: The OLS Estimator
- **Topics**: 
  - What is linear regression?
  - Population vs. Sample Regression Functions
  - Deriving the OLS estimator
  - Minimizing sum of squared residuals
- **Reading**: Fox, Chapter 2
- **Files**: 

### **Week 2 (1/20): Introduction to Linear Regression**
- **Lecture**: Derivation and Properties of the OLS Estimator
- **Topics**:
  - Normal equations
  - Interpreting coefficients
  - Predictions and residuals
  - Key assumptions
- **Reading**: Fox, Chapter 3
- **Files**: 

### **Week 3 (1/27): Estimation and Properties**
- **Lecture**: Properties of the OLS Estimator
- **Topics**:
  - Unbiasedness and efficiency
  - Variance of estimators
  - Confidence intervals
  - Hypothesis testing


### **Week 4 (2/3): Comments on Model Fit**
- **Lecture**: R-squared and Model Interpretation
- **Topics**:
  - Total, Residual, and Regression Sum of Squares
  - R-squared: What does it actually measure?
  - Adjusted R-squared
  - Common misconceptions

### **Week 5 (2/10): Statistical Inference**
- **Lecture**: Theoretical Foundations of Inference
- **Topics**:
  - Sampling distributions
  - Standard errors
  - Confidence intervals
  - Hypothesis testing framework
- **Files**: `05_Inference_Foundations.Rmd`

### **Week 6 (2/17): Inference, Continued**
- **Lecture**: Hypothesis Testing and Inference in Regression
- **Topics**:
  - t-tests and p-values
  - F-tests
  - ANOVA and model comparison
  - Interpretation and reporting
- **Files**: `06_Hypothesis_Testing.Rmd`

### **Week 7 (2/24): Multiple Variables**
- **Lecture**: Multiple Regression
- **Topics**:
  - Adding multiple predictors
  - Partial effects and control variables
  - Interpretation in multivariate models
  - Interactions and non-linearities
- **Files**: `07_Multiple_Regression.Rmd`

### **Week 8 (3/3): Midterm Exam**
- **Format**: In-class, closed-book
---

### **Week 9 (3/17): Assumptions of the Linear Model**
- **Lecture**: Model Assumptions and Violations
- **Topics**:
  - Linearity, independence, homoskedasticity, normality
  - Heteroskedasticity: detection and solutions
  - Robust standard errors
  - Weighted least squares

### **Week 10 (3/24): Collinearity**
- **Lecture**: Multicollinearity and Model Stability
- **Topics**:
  - Detecting multicollinearity
  - Variance Inflation Factor (VIF)
  - Consequences and solutions

### **Week 11 (3/31): Influence**
- **Lecture**: Outliers and Influential Observations
- **Topics**:
  - Leverage and influence
  - Standardized and studentized residuals
  - Cook's distance
  - DFFITS and DFBETAS

### **Week 12 (4/7): Panel Data**
- **Lecture**: Fixed and Random Effects Models
- **Topics**:
  - Panel data structure
  - Fixed effects estimation
  - Random effects estimation
  - Hausman test

### **Week 13 (4/14): Panel Data, Continued**
- **Lecture**: Time Series and Autocorrelation
- **Topics**:
  - Autocorrelation detection
  - Durbin-Watson test
  - GLS and FGLS
  - Panel-specific issues

### **Week 14 (4/21): Generalized Linear Models**
- **Lecture**: Introduction to GLMs and Maximum Likelihood
- **Topics**:
  - Exponential family distributions
  - Link functions
  - Logistic regression
  - Poisson regression
  - Model fitting and interpretation

### **Week 15 (4/28): Simulation and Inference**
- **Lecture**: Simulation-Based Inference and Extensions
- **Topics**:
  - Monte Carlo simulation
  - Bootstrap methods
  - Bayesian approaches to regression
  - Uncertainty quantification

## Key Resources

- **Fox, John & Weisberg, Sanford** (2011). *An R Companion to Applied Regression, Second Edition*. Sage.
- **R Project**: https://www.r-project.org
- **RStudio**: https://www.rstudio.com
- **GitHub**: https://github.com
- **DataCamp**: https://www.datacamp.com


