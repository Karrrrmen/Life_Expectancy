## What to Expect with Life Expectancy? Examining How Healthcare Expenditure, Education, and Medical Infrastructure Influence Life Expectancy Across Developed and Developing Regions

by Manjun Zhu

### Overview
This repository provides readers with all the necessary data, R scripts, and files to understand and reproduce the prediction of life expectancy.

We analyze the predictors of life expectancy using a Multiple Liear Regression Model (MLR), The model incorporates key variables such as national status (Developed vs. Developing), diphtheria immunization coverage, government healthcare expenditure as a percentage of GDP, and the number of doctors and nurses per 10,000 people to understand their influence on life expectancy. The results highlight schooling years and the percentage of government health expenditure as the most significant predictors. Additionally, our findings reveal that life expectancy in developing countries fluctuates more and shows greater variance compared to developed countries, reflecting disparities in healthcare access and education condition stability.

The data used in this analysis comes from WHO, education indicators, health conditions, and professional medical support. The analysis leverages R and many different packages to develop and visualize the model.

### File Structure
The repo is structured as:

- **`data/01-raw_data`** contains the raw data as obtained from https://data.who.int/indicators/i/48D9B0C/C64284D and https://www.johnsnowlabs.com/marketplace/global-life-expectancy-and-healthy-life-expectancy/.

- **`data/02-analysis_data`** contains the cleaned datasets that were constructed.

- **`data/00-simulated_data`** contains the simulated data that were constructed.

- **`models`** contains fitted models.

- **`other`** contains the shiny app as well as details about LLM chat interactions and sketches.

- **`paper`** contains the files used to generate the paper, including the Quarto document and reference - `bibliography` file, as well as the PDF of the paper.

- **`scripts`** contains the R scripts used to simulate, download, clean, test data, exploratory analysis, modelling and validation.

## Statement on LLM usage
LLMs such as ChatGPT4 were used to help formulate the questions for the survey as well as data validation, data cleaning, and help with build model. Full usage can be found on `other/llm_usage/usage.txt`.

