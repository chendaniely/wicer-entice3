library(knitr)
library(extrafont)
loadfonts()

rm(list = ls())

source('src/helper-00-batch.R')
# Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

# create empty variables
pt_english_a1_ids <- c()
pt_english_a2_ids <- c()
pt_english_b1_ids <- c()
pt_english_b2_ids <- c()
pt_english_all_ids <- c(pt_english_a1_ids, pt_english_a2_ids, pt_english_b1_ids, pt_english_b2_ids)

pt_spanish_a1_ids <- c()
pt_spanish_a2_ids <- c()
pt_spanish_b1_ids <- c()
pt_spanish_b2_ids <- c()
pt_spanish_all_ids <- c(pt_spanish_a1_ids, pt_spanish_a2_ids, pt_spanish_b1_ids, pt_spanish_b2_ids)
