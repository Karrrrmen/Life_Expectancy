#### Preamble ####
# Purpose: Performs a series of validation tests on cleaned Life Expectancy Data
# Author: Manjun Zhu
# Date: 26 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` , `arrow`, and `testthat` packages must be installed.
# Any other information needed? Make sure you are in the `lifeexpectancydata` rproj


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

analysis_data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))


#### Test data ####
# Create list for results
test_results <- list()

# Test structure of data
test_results$structure <- test_that("Data structure", {
  expect_true(is.data.frame(analysis_data), 
              info = "analysis_data is not a data frame.")
  expect_equal(ncol(analysis_data), 10, info = "analysis_data does 
               not have the correct number of columns.")
  expect_equal(nrow(analysis_data), 1021, info = "analysis_data does 
               not have the correct number of rows.")
})

# Test if column names match expected names
test_results$column_names_test <- test_that("Column names", {
  expected_colnames <- c("Country", "Year", "Status", "LifeExpectancy", "GDP", 
                         "Diphtheria", "TotalExpenditure", "BMI", "Schooling", 
                         "pct_doctor", "pct_nursing")
  expect_equal(names(analysis_data), expected_colnames, 
               info = "Column names do not match expected names.")
})

# Test if certain columns contain NA values
test_results$na_values_test <- test_that("NA values", {
  expect_false(any(is.na(analysis_data$LifeExpectancy)), 
               info = "LifeExpectancy contains NA values.")
  expect_false(any(is.na(analysis_data$Diphtheria)), 
               info = "Diphtheria contains NA values.")
  expect_false(any(is.na(analysis_data$pct_doctor)), 
               info = "pct_doctor contains NA values.")
  expect_false(any(is.na(analysis_data$pct_nursing)), 
               info = "pct_nursing contains NA values.")
  expect_false(any(is.na(analysis_data$Schooling)), 
               info = "Schooling contains NA values.")
  expect_false(any(is.na(analysis_data$TotalExpenditure)), 
               info = "TotalExpenditure contains NA values.")
  expect_false(any(is.na(analysis_data$BMI)), info = "BMI contains NA values.")
})

# Test if Year values are within expected range (2009-2015)
test_results$year_range_test <- test_that("Year range", {
  expect_true(all(analysis_data$Year >= 2004 & analysis_data$Year <= 2015), 
              info = "Year values are out of expected range (2009 to 2015).")
})

# Test if Status contains only 'Developing' or 'Developed'
test_results$status_test <- test_that("Status values", {
  expect_true(all(analysis_data$Status %in% c("Developed", "Developing")), 
              info = "Status column contains values 
              other than 'Developed' or 'Developing'.")
})

# Test if LifeExpectancy values are within expected range (e.g., 30 to 90 years)
test_results$life_expectancy_test <- test_that("LifeExpectancy range", {
  expect_true(all(analysis_data$LifeExpectancy >= 30 & 
                    analysis_data$LifeExpectancy <= 90, na.rm = TRUE),
              info = "LifeExpectancy values are out 
              of expected range (30 to 90 years).")
})

# Test if TotalExpenditure values are within expected range (e.g., 1 to 30)
test_results$bmi_test <- test_that("TotalExpenditure range", {
  expect_true(all(analysis_data$TotalExpenditure >= 1 & 
                    analysis_data$TotalExpenditure <= 30, na.rm = TRUE),
              info = "TotalExpenditure values are out of expected range (1 to 30).")
})

# Test if Diphtheria vaccination rates are within expected range 
# (e.g., 0% to 100%)
test_results$diphtheria_test <- test_that("Diphtheria vaccination rate", {
  expect_true(all(analysis_data$Diphtheria >= 0 & 
                    analysis_data$Diphtheria <= 100, na.rm = TRUE),
              info = "Diphtheria vaccination rates are out of expected range 
              (0% to 100%).")
})

# Test if BMI values are within expected range (e.g., 10 to 50)
test_results$bmi_test <- test_that("BMI range", {
  expect_true(all(analysis_data$BMI >= 10 & 
                    analysis_data$BMI <= 50, na.rm = TRUE),
              info = "BMI values are out of expected range (10 to 50).")
})


# Test if Schooling values are within expected range (3 to 30)
test_results$schooling_range_test <- test_that("Schooling range", {
  expect_true(all(analysis_data$Schooling >= 3 & analysis_data$Schooling <= 30), 
              info = "Schooling values are out of expected range (3 to 30).")
})


# Print results
print(test_results)
