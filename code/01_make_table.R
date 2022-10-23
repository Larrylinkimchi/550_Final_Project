
library(here)
here::i_am("code/01_make_table.R")

data<- readRDS(file=here::here("output/data_clean.rds"))

library(gtsummary)

table_one<- data |>
  select("work_type", "avg_glucose_level", "bmi_level") |>
  tbl_summary(by = "bmi_level") |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**BMI Level in different types of work**") |>
  add_overall()


saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)