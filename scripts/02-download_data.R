#### Preamble ####
# Purpose: Downloads and saves the data from 'https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who'
# Author: Manjun Zhu
# Date: 16 November 2024
# Contact: karmen.zhu@utoronto.ca
# License: University of Toronto
# Pre-requisites: No


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Download data ####
raw_data <- read.csv(file = "data/01-raw_data/LifeExpectancyData.csv")

# Load the supplementary dataset
doctor <- read.csv("data/01-raw_data/medicalDoctors.csv")
nursing <- read.csv("data/01-raw_data/nursingAndMidwife.csv")

# Ensure the column names align (modify as needed)
# Example: rename 'Location' in doctor to 'Country'
colnames(doctor)[colnames(doctor) == "Location"] <- "Country"
colnames(doctor)[colnames(doctor) == "Period"] <- "Year"
colnames(doctor)[colnames(doctor) == "First.Tooltip"] <- "pct_doctor"
colnames(nursing)[colnames(nursing) == "Location"] <- "Country"
colnames(nursing)[colnames(nursing) == "Period"] <- "Year"
colnames(nursing)[colnames(nursing) == "First.Tooltip"] <- "pct_nursing"

# Merge raw_data with doctor dataset
test_data <- raw_data %>%
  left_join(doctor %>% select(Country, Year, pct_doctor), by = c("Country", "Year"))

# Merge test_data with nursing dataset
raw_data <- test_data %>%
  left_join(nursing %>% select(Country, Year, pct_nursing), by = c("Country", "Year"))


#### Save data ####
# change raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "data/01-raw_data/raw_data.csv") 
