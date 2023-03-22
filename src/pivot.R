# Load packages
library(tidyverse)
library(reshape2)
library(readr)

# CREATE PIVOT TABLE

## import the data from `gen/data-preparation/aggregated_df.csv`
df <- read_csv("temp/aggregated_df.csv")

## create pivot table 
df_pivot <- df %>% reshape2::dcast(date ~ neighbourhood, fun.aggregate = sum, value.var = "num_reviews")

## export results
write_csv(df_pivot, "temp/pivot_table.csv")