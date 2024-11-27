#### Preamble ####
# Purpose: This script performs out-of-sample testing and calculates the RMSE for the linear model trained in the previous script.
# Author: Manjun Zhu
# Date: 26 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse`, `caret`, and 'here' packages must be installed


#### Workspace setup ####
library(tidyverse)
library(here)

#### Read data ####
# convert some columns to the appropriate data types
data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))
data <- data %>%
  mutate(
    Country = as.factor(Country),
    Year = as.numeric(Year),
    LifeExpectancy = as.numeric(LifeExpectancy),
    Status = as.factor(Status),
    Diphtheria = as.numeric(Diphtheria),
    TotalExpenditure = as.numeric(TotalExpenditure),
    Schooling = as.numeric(Schooling),
    pct_doctor = as.numeric(pct_doctor),
    pct_nursing = as.numeric(pct_nursing)
  )

### Model data ####
# linear model for Developed Countries' Life Expectancy based on socioeconomic factors
lm_developed <- lm(LifeExpectancy ~  Diphtheria + Schooling + TotalExpenditure * pct_doctor * pct_nursing, 
                   data = data %>% filter(Status == "Developed"))


# linear model for Developing Countries' Life Expectancy based on socioeconomic factors
lm_developing <- lm(LifeExpectancy ~ Diphtheria + Schooling + TotalExpenditure * pct_doctor * pct_nursing, 
                    data = data %>% filter(Status == "Developing"))

#### Save model ####
saveRDS(lm_developed, here::here("models/lm_developed.rds"))
saveRDS(lm_developing, here::here("models/lm_developing.rds"))

