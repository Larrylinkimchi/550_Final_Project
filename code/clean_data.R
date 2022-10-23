library(here)
here::i_am("code/clean_data.R")
absolute_file_path<-here::here("raw_data","healthcare-dataset-stroke-data.csv")
data <- read.csv(absolute_file_path, header = TRUE)

library(dplyr)
data<-na.omit(data)
data <- data |>
  mutate(
    bmi_level = case_when(
      data$bmi <= 18.5 ~ "underweight",
      data$bmi <= 25 & data$bmi > 18.5 ~ "healthyweight",
      data$bmi <= 30 & data$bmi > 25 ~ "overweight",
      data$bmi > 30 ~ "obesity"
    ))

saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
  
)