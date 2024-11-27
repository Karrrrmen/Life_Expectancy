#### Preamble ####
# Purpose: Simulates a dataset of Life Expectancy
# Author: Manjun Zhu
# Date: 27 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(here)
library(lubridate)

# set seed
set.seed(955)

# Generate the number of rows for the dataset
n <- 500

# Simulated data
# Define countries and their status
data <- function(n) {
  country_names <- c("Australia", "Canada", "Germany", "Japan", "United States", 
                     "Brazil", "India", "South Africa", "China", "Russia", 
                     "France", "Italy", "United Kingdom", "South Korea", "Mexico", 
                     "Argentina", "Spain", "Saudi Arabia", "Egypt", "Turkey", 
                     "Nigeria", "Indonesia", "Malaysia", "Thailand", "Vietnam", 
                     "Chile", "Poland", "Israel", "Pakistan", "Singapore", "Netherlands")
  
  # Randomly sample countries from the list
  Country <- sample(country_names, n, replace = TRUE)
  
  # Randomly generate the data for each variable based on the summary statistics provided
  Year <- sample(2004:2015, n, replace = TRUE)
  
  # Status (Developed/Developing) based on region or income classification
  Status <- sample(c("Developed", "Developing"), n, replace = TRUE, prob = c(0.5, 0.5))
  
  # LifeExpectancy simulated around a mean of 72.24 with some variation
  LifeExpectancy <- rnorm(n, mean = 72.24, sd = 10)
  
  # Diphtheria immunization rates between 4 and 99
  Diphtheria <- runif(n, min = 4, max = 99)
  
  # TotalExpenditure between 1.12 and 14.39
  TotalExpenditure <- runif(n, min = 1.12, max = 14.39)
  
  # Schooling years between 3.1 and 20.4
  Schooling <- runif(n, min = 3.1, max = 20.4)
  
  # pct_doctor between 0.13 and 75.67
  pct_doctor <- runif(n, min = 0.13, max = 75.67)
  
  # pct_nursing between 0.58 and 174.30
  pct_nursing <- runif(n, min = 0.58, max = 174.30)
  
  # Combine into a data frame
  data <- data.frame(Country, Year, Status, LifeExpectancy, Diphtheria, 
                     TotalExpenditure, Schooling, pct_doctor, pct_nursing)
  
}

# Generate data for 500 rows
data <- data(500)


#### Save data ####
write_parquet(data, "data/00-simulated_data/simulated_data.parquet")
