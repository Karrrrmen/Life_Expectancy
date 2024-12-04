#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Life Expectancy
# Author: Manjun Zhu
# Date: 27 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `lifeexpectancy.Rproj`


#### Workspace setup ####
library(tidyverse)
library(here)

data <- read_parquet(here::here("data/00-simulated_data/simulated_data.parquet"))


# Test if the data was successfully loaded
if (exists("data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has the expected number of rows (e.g., 500 rows for the full dataset)
if (nrow(data) == 500) {
  message("Test Passed: The dataset has 500 rows.")
} else {
  stop("Test Failed: The dataset does not have 500 rows.")
}

# Check if the dataset has 9 columns
if (ncol(data) == 9) {
  message("Test Passed: The dataset has 9 columns.")
} else {
  stop("Test Failed: The dataset does not have 9 columns.")
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

# Check if the 'Year' column includes only values between 2004 and 2015
if (all(data$Year >= 2004 & data$Year <= 2015)) {
  message("Test Passed: The 'Year' column contains only valid years (2004-2015).")
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

# Check if the 'Diphtheria' column has values between 0 and 100
if (all(data$Diphtheria >= 0 & data$Diphtheria <= 100)) {
  message("Test Passed: The 'Diphtheria' column contains values within the valid range (0-100).")
} else {
  stop("Test Failed: The 'Diphtheria' column contains out-of-range values.")
}

# Check if 'HealthExpenditure' is between 1.12 and 14.39 (as per your data summary)
if (all(data$HealthExpenditure >= 1.12 & data$HealthExpenditure <= 14.39)) {
  message("Test Passed: The 'HealthExpenditure' column contains values within the valid range (1.12-14.39).")
} else {
  stop("Test Failed: The 'HealthExpenditure' column contains out-of-range values.")
}

# Check if 'Schooling' is between 3.1 and 20.4 (as per your data summary)
if (all(data$Schooling >= 3.1 & data$Schooling <= 20.4)) {
  message("Test Passed: The 'Schooling' column contains values within the valid range (3.1-20.4).")
} else {
  stop("Test Failed: The 'Schooling' column contains out-of-range values.")
}

# Check if 'doctor_per_10000' is between 0.13 and 75.67 (as per your data summary)
if (all(data$doctor_per_10000 >= 0.13 & data$doctor_per_10000 <= 75.67)) {
  message("Test Passed: The 'doctor_per_10000' column contains values within the valid range (0.13-75.67).")
} else {
  stop("Test Failed: The 'doctor_per_10000' column contains out-of-range values.")
}

# Check if 'nurse_per_10000' is between 0.58 and 174.30 (as per your data summary)
if (all(data$nurse_per_10000 >= 0.58 & data$nurse_per_10000 <= 174.30)) {
  message("Test Passed: The 'nurse_per_10000' column contains values within the valid range (0.58-174.30).")
} else {
  stop("Test Failed: The 'nurse_per_10000' column contains out-of-range values.")
}
