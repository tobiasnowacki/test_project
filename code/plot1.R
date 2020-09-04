library(tidyverse)
library(rio)
library(devtools)
library(viridis)
source_url("https://raw.githubusercontent.com/tobiasnowacki/RTemplates/master/plottheme.R")

# Load data
dat_agg <- import("modified_data/mt_agg.csv")[, -1]

ggplot(dat_agg, aes(mean_hp, mean_mpg)) +
    geom_point(aes(colour = cyl)) +
    scale_colour_viridis(end = 0.8) +
    theme_tn() +
    labs(x = "Mean Horsepower", y = "Mean MPG")
ggsave("output/plot1.pdf", 
       height = 5, width = 6, device = cairo_pdf)