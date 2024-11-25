#### Preamble ####
# Purpose: Clean the raw data recorded by WHO, removing unnecessary columns, and save it as csv and parquet.
# Author: Manjun Zhu
# Date: 23 November 2024
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
  select(Country, Year, Status, Life.expectancy, GDP, Diphtheria, 
         Total.expenditure, BMI, Schooling, pct_doctor, pct_nursing) %>%
  # Filter rows where Year is between 2009 and 2015
  filter(Year >= 2004 & Year <= 2015) %>%
  # Remove rows with any missing values
  drop_na()

#### Rename column
colnames(analysis_data)[colnames(analysis_data) == "Life.expectancy"] <- "LifeExpectancy"
colnames(analysis_data)[colnames(analysis_data) == 
                 "Total.expenditure"] <- "TotalExpenditure"

#### Save data ####
write_csv(analysis_data, "data/02-analysis_data/analysis_data.csv")
write_parquet(analysis_data, "data/02-analysis_data/analysis_data.parquet")
