#### Preamble ####
# Purpose: Clean the raw data recorded by WHO, removing unnecessary columns, and save it as csv and parquet.
# Author: Manjun Zhu
# Date: 26 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: finish raw-data

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
data <- read_csv("data/01-raw_data/raw_data.csv")

analysis_data <- data %>%
  # Select the desired columns
  select(Country, Year, Status, Life.expectancy, Diphtheria, 
         Total.expenditure, BMI, Schooling, pct_doctor, pct_nursing) %>%
  # Filter rows where Year is between 2009 and 2015, and drop the unrealistic value
  filter(Year >= 2004 & Year <= 2015) %>%
  filter(pct_doctor >= 0 & pct_doctor <= 1500) %>%
  filter(pct_nursing >= 0 & pct_nursing <= 1500) %>%
  # Remove rows with any missing values
  drop_na()

#### Rename column
colnames(analysis_data)[colnames(analysis_data) == "Life.expectancy"] <- "LifeExpectancy"
colnames(analysis_data)[colnames(analysis_data) == 
                 "Total.expenditure"] <- "TotalExpenditure"

#### Save data ####
write_csv(analysis_data, "data/02-analysis_data/analysis_data.csv")
write_parquet(analysis_data, "data/02-analysis_data/analysis_data.parquet")
