#### Preamble ####
# Purpose: Perform exploratory data analysis on cleaned data
# Author: Manjun Zhu
# Date: 23 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse`, 'janitor', 'here', and 'reshape2' packages
# must be installed


# load libraries
library(tidyverse)
library(janitor)
library(here)
library(reshape2)
library(arrow)

# read cleaned data
data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet")) |>
  clean_names()

# quick overview of data structure
glimpse(data)

# print first few rows of data
head(data)

# print last few rows of data
tail(data)

# randomly sample 6 rows
data |>
  slice_sample(n = 6)

# summary of the dataset
summary(data)

# number of NA values in each column
missing_data <- data |>
  summarise(across(everything(), ~ sum(is.na(.))))
missing_data
