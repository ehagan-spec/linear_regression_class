library(shiny)
library(tidyverse)
library(broom)

# Define UI
ui <- fluidPage(
  
  titlePanel("Simple Linear Regression Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Population Parameters"),
      sliderInput("intercept",
                  "True Intercept (β₀):",
                  min = -10, max = 10, value = 2, step = 0.5),
      
      sliderInput("slope",
                  "True Slope (β₁):",
                  min = -5, max = 5, value = 1.5, step = 0.25),
      
      sliderInput("noise",
                  "Noise Level (σ):",
                  min = 0.5, max = 5, value = 1, step = 0.25),
      
      hr(),
      
      h4("Sample Settings"),
      sliderInput("n",
                  "Sample Size:",
                  min = 20, max = 500, value = 100, step = 10),
      
      actionButton("resample", "Generate New Sample", 
                   class = "btn-primary", icon = icon("refresh")),
      
      hr(),
      
      checkboxInput("show_ci", "Show Confidence Interval", value = TRUE),
      checkboxInput("show_equation", "Show Regression Equation", value = TRUE),
      
      hr(),
      
      helpText("This app demonstrates simple linear regression.",
               "Adjust parameters to see how they affect the fitted model.",
               "Try generating multiple samples to observe sampling variability!")
    ),
    
    mainPanel(
      plotOutput("scatterPlot", height = "400px"),
      
      hr(),
      
      h4("Model Summary"),
      verbatimTextOutput("modelSummary"),
      
      hr(),
      
      h4("Coefficients"),
      tableOutput("coeffTable")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Reactive data generation
  data <- eventReactive(input$resample, {
    tibble(
      x = rnorm(input$n, mean = 0, sd = 2),
      y = input$intercept + input$slope * x + rnorm(input$n, mean = 0, sd = input$noise)
    )
  }, ignoreNULL = FALSE)  # Generate initial data on startup
  
  # Reactive model
  model <- reactive({
    lm(y ~ x, data = data())
  })
  
  # Scatter plot with regression line
  output$scatterPlot <- renderPlot({
    model_fit <- model()
    data_df <- data()
    
    # Get coefficients for equation
    b0 <- round(coef(model_fit)[1], 2)
    b1 <- round(coef(model_fit)[2], 2)
    r_sq <- round(summary(model_fit)$r.squared, 3)
    
    # Create base plot
    p <- ggplot(data_df, aes(x = x, y = y)) +
      geom_point(alpha = 0.6, size = 3, color = "steelblue") +
      labs(
        title = "Simple Linear Regression",
        x = "Predictor (X)",
        y = "Response (Y)"
      ) +
      theme_minimal(base_size = 14)
    
    # Add regression line with optional CI
    if (input$show_ci) {
      p <- p + geom_smooth(method = "lm", se = TRUE, color = "red", fill = "pink", alpha = 0.3)
    } else {
      p <- p + geom_smooth(method = "lm", se = FALSE, color = "red")
    }
    
    # Add equation annotation
    if (input$show_equation) {
      equation_text <- paste0("ŷ = ", b0, " + ", b1, "x\nR² = ", r_sq)
      p <- p + annotate("text", x = Inf, y = Inf, 
                       label = equation_text,
                       hjust = 1.1, vjust = 1.5, 
                       size = 5, color = "darkred")
    }
    
    p
  })
  
  # Model summary using broom for consistency
  output$modelSummary <- renderPrint({
    # Use broom::glance for model-level statistics
    model_fit <- model()
    
    cat("Model Summary (using broom for tidy output)\n")
    cat("============================================\n\n")
    
    # Model-level statistics
    stats <- glance(model_fit)
    cat("R-squared:         ", round(stats$r.squared, 4), "\n")
    cat("Adjusted R-squared:", round(stats$adj.r.squared, 4), "\n")
    cat("Residual std error:", round(stats$sigma, 4), "\n")
    cat("F-statistic:       ", round(stats$statistic, 2), "\n")
    cat("p-value:           ", format.pval(stats$p.value, digits = 4), "\n")
    cat("Degrees of freedom:", stats$df, "and", stats$df.residual, "\n")
    
    cat("\n")
    cat("Use the Coefficients table below for detailed coefficient estimates.\n")
  })
  
  # Coefficients table
  output$coeffTable <- renderTable({
    tidy(model(), conf.int = TRUE) %>%
      mutate(across(where(is.numeric), ~round(., 4))) %>%
      rename(
        Term = term,
        Estimate = estimate,
        `Std. Error` = std.error,
        `t value` = statistic,
        `p-value` = p.value,
        `95% CI Lower` = conf.low,
        `95% CI Upper` = conf.high
      )
  }, striped = TRUE, hover = TRUE, bordered = TRUE)
}

# Run the application
shinyApp(ui = ui, server = server)
