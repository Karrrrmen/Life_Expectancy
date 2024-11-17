#### Preamble ####
# Purpose: Cleans the raw data recorded by WHO, removing unnecessary columns
# Author: Manjun Zhu
# Date: 16 November 2024
# Contact: karmen.zhu@utoronto.ca
# License: MIT
# Pre-requisites: finish raw-data

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
data <- read_csv("data/01-raw_data/raw_data.csv")

data <- data %>%
  # Select the desired columns
  select(Country, Year, Status, Life.expectancy, GDP, Diphtheria, Income.composition.of.resources, BMI) %>%
  # Filter rows where Year is between 2009 and 2015
  filter(Year >= 2009 & Year <= 2015) %>%
  # Remove rows with any missing values
  drop_na()


#### Rename column
colnames(data)[colnames(data) == "Life.expectancy"] <- "LifeExpectancy"
colnames(data)[colnames(data) == "Income.composition.of.resources"] <- "IncomeComposition"

#### Save data ####
write_csv(data, "data/02-analysis_data/analysis_data.csv")
