#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Life Expectancy
# Author: Manjun Zhu
# Date: 16 November 2024
# Contact: karmen.zhu@utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has the expected number of rows (e.g., 50 rows for the sample)
if (nrow(data) == 50) {
  message("Test Passed: The dataset has 50 rows.")
} else {
  stop("Test Failed: The dataset does not have 50 rows.")
}

# Check if the dataset has 8 columns
if (ncol(data) == 8) {
  message("Test Passed: The dataset has 8 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if all countries are valid and non-empty
if (all(data$Country != "")) {
  message("Test Passed: All countries have valid non-empty names.")
} else {
  stop("Test Failed: Some country names are missing or empty.")
}

# Check if the 'Status' column contains only "Developed" or "Developing"
valid_statuses <- c("Developed", "Developing")
if (all(data$Status %in% valid_statuses)) {
  message("Test Passed: The 'Status' column contains only valid statuses.")
} else {
  stop("Test Failed: The 'Status' column contains invalid entries.")
}

# Check if the 'Year' column includes only values between 2009 and 2015
if (all(data$Year >= 2009 & data$Year <= 2015)) {
  message("Test Passed: The 'Year' column contains only valid years (2009-2015).")
} else {
  stop("Test Failed: The 'Year' column contains invalid years.")
}

# Check if there are no missing values in the dataset
if (all(!is.na(data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if the 'LifeExpectancy' column has positive values
if (all(data$LifeExpectancy > 0)) {
  message("Test Passed: All life expectancy values are positive.")
} else {
  stop("Test Failed: Some life expectancy values are non-positive.")
}

# Check if 'GDP' contains only non-negative values
if (all(data$GDP >= 0)) {
  message("Test Passed: The 'GDP' column contains only non-negative values.")
} else {
  stop("Test Failed: The 'GDP' column contains negative values.")
}

# Check if 'IncomeComposition' values are between 0 and 1
if (all(data$IncomeComposition >= 0 & data$IncomeComposition <= 1)) {
  message("Test Passed: The 'IncomeComposition' column contains values between 0 and 1.")
} else {
  stop("Test Failed: The 'IncomeComposition' column contains out-of-range values.")
}

# Check if 'Diphtheria' and 'BMI' are within realistic ranges (e.g., 0-100 for percentages)
if (all(data$Diphtheria >= 0 & data$Diphtheria <= 100) &&
    all(data$BMI >= 0 & data$BMI <= 100)) {
  message("Test Passed: 'Diphtheria' and 'BMI' columns contain values in valid ranges.")
} else {
  stop("Test Failed: 'Diphtheria' or 'BMI' columns contain out-of-range values.")
}
