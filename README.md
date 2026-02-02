# Linear Regression Class Repository

## Overview

This repository contains materials for a course on linear regression analysis, emphasizing **reproducibility** and modern R programming practices. The structure and content follow the pedagogical approach of Fox's *Applied Regression Analysis and Generalized Linear Models* while utilizing the tidyverse framework for data manipulation and visualization.

## Course Philosophy: Reproducibility

Reproducibility is a cornerstone of modern data science and statistical analysis. This course emphasizes:

- **Transparent workflows**: All analyses should be documented and replicable
- **Version control**: Using Git/GitHub for tracking changes
- **Dependency management**: Clear documentation of R packages and versions
- **Data provenance**: Clear documentation of data sources and preprocessing steps
- **Literate programming**: Combining code, output, and narrative using R Markdown

## Repository Structure

```
.
├── data/           # Datasets for lectures and exercises
├── lectures/       # Lecture notes and slides (R Markdown)
├── vignettes/      # Extended tutorials and examples
├── shiny/          # Interactive Shiny applications
├── README.md       # This file
└── AI-DISCLAIMER.md # Policy on AI tool usage
```

## Getting Started

### Prerequisites

- R (version 4.0.0 or higher)
- RStudio (recommended)
- Git

### Installation

1. Clone this repository:
```bash
git clone https://github.com/crweber9874/linear_regression_class.git
cd linear_regression_class
```

2. Install required R packages:
```r
# Core tidyverse packages
install.packages("tidyverse")

# Regression and modeling
install.packages(c("car", "broom", "modelr"))

# Visualization
install.packages(c("ggplot2", "GGally", "patchwork"))

# Interactive apps
install.packages("shiny")

# Reproducibility
install.packages("renv")
```

3. (Optional) Initialize renv for package management:
```r
renv::init()
```

## Course Content

### Data

The `data/` folder contains datasets used throughout the course:
- Example datasets for demonstrating regression concepts
- Real-world datasets for applied exercises
- Simulated data for illustrating statistical properties

All datasets include documentation describing variables, sources, and any preprocessing steps.

### Lectures

The `lectures/` folder contains Quarto (`.qmd`) files for each lecture topic. See the [lecture index](lectures/lecture_slides.qmd) for a complete list with links.

**Current lectures:**

| Lecture | File | RPubs |
|---------|------|-------|
| Introduction to Linear Regression | [Introduction_to_Linear_Regression.qmd](lectures/Introduction_to_Linear_Regression.qmd) | [RPubs](https://rpubs.com/crweber9874/linereg1) |
| Derivation of OLS Estimator | [ols_estimator.qmd](lectures/ols_estimator.qmd) | [RPubs](https://rpubs.com/crweber9874/1390443) |
| OLS Derivation (Detailed Notes) | [OLS_Derivation.qmd](lectures/OLS_Derivation.qmd) | |
| Gauss-Markov Assumptions | [gauss_markov_slides.qmd](lectures/gauss_markov_slides.qmd) | |

**Course Schedule:**

- **Week 1**: Introduction to Linear Regression
- **Weeks 2-3**: Estimation and Properties (OLS derivation, Gauss-Markov assumptions, BLUE)

Topics follow the progression in Fox's Applied Regression Analysis:
1. Simple linear regression
2. Multiple regression
3. Regression diagnostics
4. Transformations and variable selection
5. Categorical predictors
6. Interactions
7. Generalized linear models

### Vignettes

The `vignettes/` folder provides extended tutorials:
- Step-by-step walkthroughs of key concepts
- Worked examples with real data
- Best practices for tidyverse workflows
- Reproducible analysis templates

### Shiny Applications

The `shiny/` folder contains interactive web applications for:
- Visualizing regression concepts
- Exploring diagnostic plots
- Understanding assumptions and violations
- Interactive data exploration

## Reproducibility Practices

This repository follows best practices for reproducible research:

1. **Version Control**: All materials are version controlled with Git
2. **Documented Dependencies**: All required packages are clearly listed
3. **Self-Contained**: All data and code needed to reproduce analyses are included
4. **Clear Organization**: Logical folder structure with descriptive names
5. **Literate Programming**: R Markdown integrates code, output, and narrative
6. **Session Information**: All analyses include `sessionInfo()` output

## Tidyverse Framework

This course uses the tidyverse ecosystem for data manipulation and visualization:

- `dplyr`: Data manipulation
- `ggplot2`: Data visualization  
- `tidyr`: Data tidying
- `readr`: Data import
- `purrr`: Functional programming
- `broom`: Tidy model outputs

The tidyverse approach emphasizes:
- Readable, pipeable code (`%>%`)
- Consistent API across packages
- Tidy data principles

## Contributing

Students are encouraged to:
- Report issues or typos
- Suggest improvements
- Share interesting examples
- Contribute additional vignettes

Please open an issue or submit a pull request.

## License

This course material is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0).

## References

- Fox, J. (2016). *Applied Regression Analysis and Generalized Linear Models* (3rd ed.). Sage Publications.
- Wickham, H., & Grolemund, G. (2017). *R for Data Science*. O'Reilly Media.
- Wickham, H. (2014). Tidy Data. *Journal of Statistical Software*, 59(10).

## Contact

For questions or feedback, please open an issue on GitHub.

---

**Note**: See [AI-DISCLAIMER.md](AI-DISCLAIMER.md) for policies regarding the use of AI tools in this course.
