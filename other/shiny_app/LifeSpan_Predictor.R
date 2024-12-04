library(shiny)
library(dplyr)
library(shinyjs)

# Fit the linear model
lm_overall <- lm(LifeExpectancy ~ Status + Diphtheria + Schooling + TotalExpenditure * pct_doctor * pct_nursing, data = analysis_data)

# Assuming data is already loaded and model is built
data <- data %>%
  mutate(Status = as.numeric(Status))

# Define UI, set up default value
ui <- fluidPage(
  useShinyjs(),  # Initialize shinyjs for JavaScript functionality
  titlePanel("Life Expectancy Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("status", "Status (Numeric):", value = 1, min = 0, max = 2),
      numericInput("diphtheria", "Diphtheria Vaccination Rate (%):", value = 90, min = 0, max = 100),
      numericInput("schooling", "Years of Schooling:", value = 13.14, min = 0, max = 20),
      numericInput("total_expenditure", "Total Expenditure on Health (% of GDP):", value = 6.093, min = 0, max = 100),
      numericInput("pct_doctor", "% of Population with Access to Doctors:", value = 19.45, min = 0, max = 100),
      numericInput("pct_nursing", "% of Population with Access to Nurses:", value = 46.05, min = 0, max = 100),
      
      actionButton("predict", "Predict Life Expectancy")
    ),
    
    mainPanel(
      verbatimTextOutput("prediction_output"),
      div(id = "loading", style = "display: none;", "Loading... Please wait")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  observeEvent(input$predict, {  # Trigger prediction when the button is clicked
    shinyjs::show("loading")  # Show loading message
    
    # Collect the input data into a data frame
    input_data <- data.frame(
      Status = as.character(input$status),
      Diphtheria = as.numeric(input$diphtheria),
      Schooling = as.numeric(input$schooling),
      TotalExpenditure = as.numeric(input$total_expenditure),
      pct_doctor = as.numeric(input$pct_doctor),
      pct_nursing = as.numeric(input$pct_nursing)
    )
    
    # Predict the life expectancy using the linear model
    prediction <- predict(lm_overall, newdata = input_data)
    
    # Display the predicted life expectancy
    output$prediction_output <- renderText({
      paste("Predicted Life Expectancy: ", round(prediction, 2), " years")
    })
    
    shinyjs::hide("loading")  # Hide loading message after prediction
  })
}

# Run the application
shinyApp(ui = ui, server = server)
