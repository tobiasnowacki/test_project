# Load packages
library(tidyverse)
library(rio)
library(stringr)

# Load data
dat <- import("original_data/mt_cars.csv")

# Aggregate up
dat_agg <- dat %>%
    group_by(V1, cyl) %>%
    summarise(mean_mpg = mean(mpg),
              mean_hp = mean(hp))

# Save new dataframe
write.csv(dat_agg, "modified_data/mt_agg.csv")