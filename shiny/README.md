# Shiny Applications Directory
## Author: AI, Github copilot



This directory contains interactive web applications built with Shiny to help students explore and understand linear regression concepts.

## Purpose

Shiny apps provide interactive visualizations that allow students to:
- Manipulate parameters and see immediate effects
- Explore regression assumptions visually
- Understand diagnostic plots interactively
- Experiment with different datasets
- Build intuition about statistical concepts

## Applications

### 1. Simple Linear Regression Explorer
**`simple-regression-app/`**
- Visualize relationship between two variables
- Adjust sample size and see effect on estimates
- Explore confidence and prediction intervals
- Understand residuals and fitted values
- See how outliers affect the regression line

### 2. Assumption Checker
**`assumption-checker/`**
- Explore all four key regression assumptions:
  - Linearity
  - Independence
  - Homoscedasticity (constant variance)
  - Normality of residuals
- See what violations look like in diagnostic plots
- Generate data with specific assumption violations
- Learn to identify problems in real data

### 3. Multiple Regression Visualizer
**`multiple-regression-app/`**
- Visualize multiple regression with 2-3 predictors
- Understand partial relationships and controlling for confounders
- Explore interaction effects visually
- See how adding/removing variables affects R²
- Understand multicollinearity

### 4. Influence and Outlier Explorer
**`influence-outliers-app/`**
- Interactive demonstration of:
  - Leverage
  - Cook's distance
  - DFFITS and DFBETAS
- Add/remove influential points and see effects
- Understand difference between outliers and high-leverage points
- Visualize effect on regression estimates

### 5. Transformation Tool
**`transformation-app/`**
- Try different transformations (log, sqrt, polynomial)
- See effect on linearity and residual plots
- Interactive Box-Cox transformation
- Compare models with different transformations
- Understand when and why to transform

### 6. Model Comparison Dashboard
**`model-comparison-app/`**
- Compare multiple models side-by-side
- Visualize AIC, BIC, adjusted R²
- Cross-validation results
- Residual plots for each model
- Help with model selection decisions

## Running Shiny Apps

### From RStudio
1. Open the `app.R` file (or `ui.R` and `server.R`)
2. Click "Run App" button
3. App opens in RStudio viewer, browser, or separate window

### From Console
```r
# Run a specific app
shiny::runApp("shiny/simple-regression-app")

# Run with specific options
shiny::runApp("shiny/simple-regression-app", 
              launch.browser = TRUE,
              port = 3838)
```

### Deploying to shinyapps.io
```r
library(rsconnect)

# Configure account (first time only)
rsconnect::setAccountInfo(name='your-account', 
                         token='your-token',
                         secret='your-secret')

# Deploy app
rsconnect::deployApp('shiny/simple-regression-app')
```

## App Structure

Each Shiny app follows this structure:

```
app-name/
├── app.R           # Single-file app (preferred for simple apps)
│   OR
├── ui.R            # User interface definition
├── server.R        # Server logic
│
├── README.md       # App-specific documentation
├── www/            # Static files (images, CSS, JS)
│   ├── styles.css
│   └── logo.png
└── data/           # App-specific data files
    └── example.csv
```

## Basic App Template

### Single-File App (app.R)
```r
library(shiny)
library(tidyverse)

# User Interface
ui <- fluidPage(
  titlePanel("App Title"),
  
  sidebarLayout(
    sidebarPanel(
      # Input controls
      sliderInput("n", "Sample Size:", 
                  min = 10, max = 500, value = 100),
      numericInput("slope", "True Slope:", value = 2),
      numericInput("intercept", "True Intercept:", value = 1)
    ),
    
    mainPanel(
      # Output displays
      plotOutput("scatterPlot"),
      verbatimTextOutput("modelSummary")
    )
  )
)

# Server Logic
server <- function(input, output, session) {
  
  # Reactive data generation
  data <- reactive({
    tibble(
      x = rnorm(input$n),
      y = input$intercept + input$slope * x + rnorm(input$n)
    )
  })
  
  # Reactive model fitting
  model <- reactive({
    lm(y ~ x, data = data())
  })
  
  # Render plot
  output$scatterPlot <- renderPlot({
    ggplot(data(), aes(x = x, y = y)) +
      geom_point() +
      geom_smooth(method = "lm", se = TRUE) +
      theme_minimal() +
      labs(title = "Linear Regression")
  })
  
  # Render model summary
  output$modelSummary <- renderPrint({
    summary(model())
  })
}

# Run the app
shinyApp(ui = ui, server = server)
```

## Best Practices

### User Interface
- **Clear labels**: Use descriptive labels for all inputs
- **Sensible defaults**: Set reasonable default values
- **Helpful text**: Add explanatory text where needed
- **Organized layout**: Group related controls together
- **Responsive design**: Use fluid layouts that adapt to screen size

### Server Logic
- **Use reactive expressions**: Avoid redundant calculations
- **Handle errors gracefully**: Use `validate()` and `req()`
- **Optimize performance**: Don't recalculate unnecessarily
- **Provide feedback**: Use progress indicators for slow operations
- **Clean code**: Follow tidyverse style guide

### Visualization
- **Interactive plots**: Consider plotly for interactivity
- **Clear labels**: Always label axes and add titles
- **Consistent styling**: Use consistent theme across plots
- **Appropriate colors**: Use colorblind-friendly palettes
- **Annotations**: Add reference lines, regions, or text as needed

## Example: Interactive Scatter Plot

```r
library(shiny)
library(tidyverse)
library(plotly)

ui <- fluidPage(
  titlePanel("Interactive Regression"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Sample Size:", 20, 200, 50),
      sliderInput("noise", "Noise Level:", 0, 5, 1, 0.1),
      checkboxInput("show_ci", "Show Confidence Interval", TRUE),
      actionButton("resample", "New Sample")
    ),
    mainPanel(
      plotlyOutput("plot"),
      verbatimTextOutput("stats")
    )
  )
)

server <- function(input, output, session) {
  
  data <- eventReactive(input$resample, {
    tibble(
      x = runif(input$n, 0, 10),
      y = 2 + 1.5 * x + rnorm(input$n, 0, input$noise)
    )
  }, ignoreNULL = FALSE)
  
  output$plot <- renderPlotly({
    p <- ggplot(data(), aes(x = x, y = y)) +
      geom_point() +
      geom_smooth(method = "lm", se = input$show_ci) +
      theme_minimal()
    ggplotly(p)
  })
  
  output$stats <- renderPrint({
    model <- lm(y ~ x, data = data())
    summary(model)
  })
}

shinyApp(ui, server)
```

## Reactivity Pattern

Understanding Shiny's reactivity is key:

```r
# Reactive source (input)
input$slider

# Reactive conductor (intermediate calculation)
data <- reactive({
  # Computation based on inputs
})

# Reactive endpoint (output)
output$plot <- renderPlot({
  # Use reactive values
  plot(data())
})

# Observer (side effects)
observeEvent(input$button, {
  # Triggered when button is clicked
})
```

## Useful Shiny Extensions

- **shinydashboard**: Create dashboard layouts
- **shinyWidgets**: Additional input controls
- **DT**: Interactive data tables
- **plotly**: Interactive plots
- **shinyjs**: JavaScript functionality
- **shinycssloaders**: Loading animations
- **shinyFeedback**: Input validation feedback

## Debugging Shiny Apps

```r
# Print to R console
print(input$slider)

# Use browser() for debugging
observeEvent(input$button, {
  browser()  # Stops execution here
  # Your code
})

# Show reactive log
options(shiny.reactlog = TRUE)
# Run app, then:
shiny::reactlogShow()
```

## Performance Tips

1. **Use reactive expressions**: Cache computations
2. **Avoid unnecessary reactivity**: Use `isolate()` when appropriate
3. **Optimize plots**: Use static plots when interactivity isn't needed
4. **Lazy loading**: Load data only when needed
5. **Async operations**: Use `future` and `promises` for long computations

## Deployment Checklist

Before deploying an app:
- [ ] Test with different input combinations
- [ ] Check error handling
- [ ] Verify on different browsers
- [ ] Test on different screen sizes
- [ ] Optimize performance
- [ ] Add usage instructions
- [ ] Include citation/credits
- [ ] Verify data privacy (no sensitive data)

## Resources

- [Shiny Official Tutorial](https://shiny.rstudio.com/tutorial/)
- [Mastering Shiny Book](https://mastering-shiny.org/)
- [Shiny Gallery](https://shiny.rstudio.com/gallery/)
- [Shiny Cheatsheet](https://shiny.rstudio.com/images/shiny-cheatsheet.pdf)

## Contributing

To add a new Shiny app:
1. Create a new directory in `shiny/`
2. Follow the structure and naming conventions
3. Include a README in the app directory
4. Test thoroughly before committing
5. Add app description to this README
6. Consider adding screenshots

## Example Apps to Study

- [RStudio Shiny Gallery](https://shiny.rstudio.com/gallery/)
- [Regression Diagnostics App](https://gallery.shinyapps.io/slr_diag/)
- [Interactive Plots](https://plotly-r.com/overview.html)
