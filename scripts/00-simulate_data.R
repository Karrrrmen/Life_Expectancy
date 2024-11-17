#### Preamble ####
# Purpose: Simulates a dataset of Life Expectancy
# Author: Manjun Zhu
# Date: 16 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(955)

# Generate the number of rows for the dataset
n <- 50

# Simulated data
# Define countries and their status
countries <- data.frame(
  Country = c("USA", "Canada", "Germany", "China", "India",
              "Brazil", "Nigeria", "South Africa"),
  Status = c("Developed", "Developed", "Developed", "Developing",
             "Developing", "Developing", "Developing", "Developing")
)

# Generate simulated data
data <- data.frame(
  Country = sample(countries$Country, size = n, replace = TRUE),
  Year = sample(2009:2015, size = n, replace = TRUE),
  stringsAsFactors = FALSE
)

# Assign the corresponding status based on the country
data <- merge(data, countries, by = "Country")

# Simulate other variables
data$LifeExpectancy <- round(
  ifelse(data$Status == "Developed", runif(n, 70, 85), runif(n, 50, 70)), 1
)
data$GDP <- round(
  ifelse(data$Status == "Developed", runif(n, 20000, 80000),
         runif(n, 1000, 15000)), 2
)
data$Diphtheria <- round(
  ifelse(data$Status == "Developed", runif(n, 90, 100), runif(n, 50, 90)), 1
)
data$IncomeComposition <- round(
  ifelse(data$Status == "Developed", runif(n, 0.7, 1), runif(n, 0.2, 0.7)), 2
)
data$BMI <- round(
  ifelse(data$Status == "Developed", runif(n, 25, 35), runif(n, 15, 25)), 1
)

# View a sample of the simulated dataset
head(data)

# Summary of the dataset
summary(data)


#### Save data ####
write_csv(data, "data/00-simulated_data/simulated_data.csv")
