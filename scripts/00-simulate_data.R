#### Preamble ####
# Purpose: Simulates a dataset of Life Expectancy
# Author: Manjun Zhu
# Date: 27 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `lifeexpectancy.Rproj`


#### Workspace setup ####
library(tidyverse)
library(here)
library(lubridate)
library(arrow)

set.seed(955)

# Generate the number of rows for the dataset
n <- 500

# Simulated data
# Generate some countries
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
  Diphtheria <- round(runif(n, min = 4, max = 99), 2)
  
  # HealthExpenditure between 1.12 and 14.39
  HealthExpenditure <- round(runif(n, min = 1.12, max = 14.39), 2)
  
  # Schooling years between 3.1 and 20.4
  Schooling <- round(runif(n, min = 3.1, max = 20.4), 2)
  
  # doctor_per_10000 between 0.13 and 75.67
  doctor_per_10000 <- round(runif(n, min = 0.13, max = 75.67), 2)
  
  # nurse_per_10000 between 0.58 and 174.30
  nurse_per_10000 <- round(runif(n, min = 0.58, max = 174.30), 2)
  
  # Combine into a data frame
  data <- data.frame(Country, Year, Status, LifeExpectancy, Diphtheria, 
                     HealthExpenditure, Schooling, doctor_per_10000, nurse_per_10000)
  
}

# Generate data for 500 rows
data <- data(500)


#### Save data ####
write_csv(data, "data/00-simulated_data/simulated_data.csv")
write_parquet(data, "data/00-simulated_data/simulated_data.parquet")
