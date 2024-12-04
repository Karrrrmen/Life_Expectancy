#### Preamble ####
# Purpose: This script performs exploratory data analysis (EDA) on the cleaned life expectancy data
# Author: Manjun Zhu
# Date: 26 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse', 'here', and 'lubridate' packages must be installed


# load libraries
library(tidyverse)
library(here)
library(lubridate)

# read cleaned data
data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))

# Summary of numerical variables
summary_stats <- data %>%
  summarise(
    LifeExpectancy = mean(LifeExpectancy, na.rm = TRUE),
    Diphtheria = mean(Diphtheria, na.rm = TRUE),
    TotalExpenditure = mean(TotalExpenditure, na.rm = TRUE),
    BMI = mean(BMI, na.rm = TRUE),
    Status = mean(as.numeric(Status), na.rm = TRUE),
    Schooling = mean(Schooling, na.rm = TRUE),
    pct_doctor = mean(pct_doctor, na.rm = TRUE),
    pct_nursing = mean(pct_nursing, na.rm = TRUE),
  )

print(summary_stats)


# Status breakdown
status_distribution <- data %>%
  count(Status) %>%
  mutate(percent = n / sum(n) * 100)

print(status_distribution)

# number of NA values in each column
missing_data <- data |>
  summarise(across(everything(), ~ sum(is.na(.))))
missing_data

