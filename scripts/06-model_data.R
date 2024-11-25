#### Preamble ####
# Purpose: Run a linear regression model to predict Life Expectancy between Developed and Developing Countries
# Author: Manjun Zhu
# Date: 24 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and 'here' packages must be installed


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
    BMI = as.numeric(BMI),
    TotalExpenditure = as.numeric(TotalExpenditure),
    Schooling = as.numeric(Schooling),
    pct_doctor = as.numeric(pct_doctor),
    pct_nursing = as.numeric(pct_nursing)
  )

### Model data ####
# linear model for Developed Countries' Life Expectancy based on socioeconomic factors
lm_developed <- lm(LifeExpectancy ~  Diphtheria + Schooling + TotalExpenditure + pct_doctor, 
                   data = data %>% filter(Status == "Developed"))


# linear model for Developing Countries' Life Expectancy based on socioeconomic factors
lm_developing <- lm(LifeExpectancy ~ BMI + Diphtheria + Schooling + pct_doctor + pct_nursing, 
                    data = data %>% filter(Status == "Developing"))

#### Save model ####
saveRDS(lm_developed, here::here("models/lm_developed.rds"))
saveRDS(lm_developing, here::here("models/lm_developing.rds"))

