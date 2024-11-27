#### Preamble ####
# Purpose: This script performs out-of-sample testing and calculates the RMSE for the linear model trained in the previous script.
# Author: Manjun Zhu
# Date: 26 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse`, `caret`, and 'here' packages must be installed


#### Workspace setup ####
library(tidyverse)
library(caret)
library(here)

# Load the cleaned dataset (adjust the file path as needed)
data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))

# Clean the data again to ensure consistency with the model
data_cleaned <- data %>%
  filter(!is.na(LifeExpectancy), !is.na(Diphtheria), !is.na(Schooling), 
         !is.na(TotalExpenditure), !is.na(pct_doctor)) %>%
  mutate(
    LifeExpectancy = as.numeric(LifeExpectancy),
    Diphtheria = as.numeric(Diphtheria),
    Schooling = as.integer(Schooling),
    TotalExpenditure = as.integer(TotalExpenditure),
    pct_doctor = as.integer(pct_doctor)
  )

# Split the data into training (80%) and testing (20%) sets
set.seed(955) # For reproducibility
Index <- createDataPartition(data_cleaned$LifeExpectancy,
                                  p = 0.8,
                                  list = FALSE,
                                  times = 1
)

train_data <- data_cleaned[Index, ]
test_data <- data_cleaned[-Index, ]

# Load the saved model
finisher_model <- readRDS(here::here("models/lm_developed.rds"))

# Perform out-of-sample prediction on the test set
predicted <- predict(finisher_model, newdata = test_data)

# Calculate the RMSE (Root Mean Squared Error)
rmse <- sqrt(mean((predicted - test_data$LifeExpectancy)^2))

# Print RMSE value
cat("Root Mean Squared Error (RMSE) on the test data: ", round(rmse, 2), "\n")

