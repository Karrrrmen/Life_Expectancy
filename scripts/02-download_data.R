#### Preamble ####
# Purpose: Downloads and saves the data from 'https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who'
# Author: Manjun Zhu
# Date: 16 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: No
# Any other information needed? Thanks to Kaggle opendataset


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Download data ####
raw_data <- read.csv(file = "data/01-raw_data/LifeExpectancyData.csv")

#### Save data ####
# change raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "data/01-raw_data/raw_data.csv") 
