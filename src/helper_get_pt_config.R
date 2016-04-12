library(readr)
library(lubridate)
library(dplyr)
library(readxl)

source('src/helper_group_calculations.R')

###############################################################################
#
# Normalize data
#
###############################################################################

#######################################
# Townhall
#######################################
# data_pt <- read_csv(
#     file = 'data/AdrianaComprehension_DATA_2015-05-03_2349.csv')

# data_pt_w_name <- read_csv('data/Report_RSVPForTownhallListByTime_2015-06-01_1101.csv')
# data_config_pt_name_parts <- data_pt_w_name[data_pt_w_name$`Participant ID (participant_id)` == pt_id, c("First Name (first)", "Last Name (last)")]
# data_config_pt_name <- paste(data_config_pt_name_parts, collapse = ' ')

# data_pt$age <- year(ymd(Sys.Date())) - year(mdy(data_pt$dob))

#######################################
# Entice3 Test Data
#######################################

# for entice3
# data_pt <- read_excel('../test_data/Dummy infographics data.xlsx')
data_pt <- read_excel('../test_data/WICER comprehension test.xlsx')
data_pt <- na.omit(data_pt)

names(data_pt)[1] <- 'name'

data_config_pt_name <- pt_english

data_pt$age <- data_pt$Age

data_pt$sex <- ifelse(data_pt$Sex == "M", 1, 2)

data_pt$fruit_week_sm_perday <- data_pt$fruit_wk_sm_perday

data_pt$sf_1[data_pt$sf_1 %in% c(777, 888)] <- NA
data_pt$fatexp41[data_pt$fatexp41 %in% c(777, 888)] <- NA

#######################################
# New variables from normal data
#######################################
data_pt$age_group <- sapply(X = data_pt$age, FUN = calculate_age_group)

###############################################################################
#
# Get only participant's data
#
###############################################################################

#######################################
# Townhall
#######################################
# data_pt_selected <- data_pt[data_pt$ordersm == pt_id, ]

#######################################
# Entice3 Test Data
#######################################
data_pt_selected <- data_pt[data_pt$name == pt_id, ]

#######################################
# New variables from normal data
#######################################
data_config_pt_age <- data_pt_selected$age
data_config_pt_sex <- data_pt_selected$sex

#
# BMI
#
data_config_pt_bmi_value <- round(data_pt_selected$bmi_kgm2, digits = 1)

#
# Waist in
#
data_config_pt_waist_in <- data_pt_selected$waistcirc_inches_1


#
# Days feeling depresed 30
#
# data_config_pt_sex_depressed <- ifelse(data_pt_selected$sex == "M", "M", "F")
# data_config_pt_sex_anxious <- data_config_pt_sex_depressed
data_config_pt_depressed_30 <- data_pt_selected$cdc30_depressed
data_config_sex_age_depressed_30 <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(cdc30_depressed, na.rm = TRUE)) %>%
    filter(sex == data_config_pt_sex,
    #filter(sex == data_config_pt_sex_depressed,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# Days feeling anxious 30
#
data_config_pt_anxious_30 <- data_pt_selected$cdc30_anxious
data_config_sex_age_anxious_30 <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(cdc30_anxious, na.rm = TRUE)) %>%
    filter(sex == data_config_pt_sex,
    # filter(sex == data_config_pt_sex_anxious,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# Fruit servings per day
#
data_config_pt_fruit_servings_per_day <-
    round(data_pt_selected$fruit_week_sm_perday, digits = 1)
data_config_sex_age_fruit_servings_per_day <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(fruit_week_sm_perday, na.rm = TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round(digits = 1)
# 2 for men and for women 18-30; 1.5 for women >30
data_config_min_fruit_servings_per_day <- calculate_fruit_servings_recommended(
    data_config_pt_sex, data_config_pt_age)

#
# Vegetable servings per day
#
data_config_pt_vegetable_servings_per_day <-
    round(data_pt_selected$veganddarkvege_wk_perday, digits = 1)
data_config_sex_age_vegetable_servings_per_day <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(veganddarkvege_wk_perday, na.rm = TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round(digits = 1)
data_config_min_vegetable_servings_per_day <-
    calculate_vegetable_servings_recommended(data_config_pt_sex, data_config_pt_age)

#
# Vigorous physical activity
#
data_config_pt_mins_vigorous_physical_activity <- data_pt_selected$vig_amount_minwk

data_config_sex_age_vigorous_physical_activity <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(vig_amount_minwk, na.rm = TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# Moderate physical activity
#

data_config_pt_mins_moderate_physical_activity <- as.numeric(data_pt_selected$mod_amount_minwk)

# Mean value for sex by age group: 18-30; 31-50; 51-64; 65+
data_pt$mod_amount_minwk_numeric <- as.numeric(data_pt$mod_amount_minwk)
data_config_sex_age_moderate_physical_activity <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(mod_amount_minwk_numeric, na.rm=TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# get servings per week of begerages containing sugar
#
data_config_pt_soda_wk <- round(data_pt_selected$soda_week_sm)
data_config_pt_purejuice_wk <- round(data_pt_selected$juice_week_sm)
data_config_pt_sugaryfruitdrink_wk <- round(data_pt_selected$sugaryfruitdrink_week_sm)

#
# Composite 30-day Measures
#
data_config_pt_healthy_energy_30 <- data_pt_selected$cdc30_energy
data_config_pt_physical_health_bad_30 <- data_pt_selected$cdc30_physical
data_config_pt_mental_health_bad_30 <- data_pt_selected$cdc30_mental

#
# Recommended physical activities
# Based on moderate physical activity
#
# data_config_pt_soda_wk <- data_pt_selected$soda_week_sm
# data_config_pt_purejuice_wk <- data_pt_selected$juice_week_sm

#
# Depression symptoms A
#
data_config_pt_depression_a <- data_pt_selected$phq30_sum
data_config_sex_age_depression_a <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(phq30_sum, na.rm = TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric()

#
# prolonged stress
#
data_config_pt_stress <- data_pt_selected$chr_sum
data_config_sex_age_stress <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(chr_sum, na.rm=TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# Anxiety Symptoms
#
data_config_pt_anxiety <- data_pt_selected$promis_anxiety_t

#
# Depression Symptoms B
#
data_config_pt_depression_b <- data_pt_selected$proms_depression_t

#
# Overall health
#
data_config_pt_overall <- data_pt_selected$sf_1
data_config_sex_age_overall <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(sf_1, na.rm=TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# Loss of Energy
#
data_config_pt_run_down <- data_pt_selected$fatexp41
data_config_sex_age_run_down <- data_pt %>%
    group_by(sex, age_group) %>%
    summarize(avg = mean(fatexp41, na.rm=TRUE)) %>%
    filter(sex == data_config_pt_sex,
           age_group == data_pt_selected$age_group) %>%
    data.frame() %>%
    select(avg) %>%
    as.numeric() %>%
    round()

#
# Risks of high BP
#
data_config_pt_bp_s <- round(data_pt_selected$sbp)
data_config_pt_bp_d <- round(data_pt_selected$dbp)

#
# Health Summary Control Panel
#
data_config_pt_oral_health <- data_pt_selected$o11

#
# Ideal cloverleaf
#
data_config_pt_cloverleaf_fruit <-
    calculate_cloverleaf_fruit_value(data_config_pt_fruit_servings_per_day,
                                     data_config_pt_vegetable_servings_per_day,
                                     data_config_pt_sex,
                                     data_config_pt_age)

data_config_pt_cloverleaf_mental <-
    calculate_cloverleaf_mental_value(data_pt_selected$cdc30_mental)

data_config_pt_cloverleaf_overall <-
    calculate_cloverleaf_overall_value(data_pt_selected$sf_1)

data_config_pt_cloverleaf_physical <-
    calculate_cloverleaf_physical_value(moderate_value = data_pt_selected$mod_amount_minwk,
                                        vigorous_value = data_pt_selected$vig_amount_minwk)
