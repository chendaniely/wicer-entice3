source('src/helper_pt_calculations.R')
source('src/helper_get_pt_config.R')
###############################################################################
# Get documnet variables
###############################################################################


color_blue_bargraph_cloverleaf <- '#00ADEF'
color_blue_depression <- '#000df2'
color_green_referencerange_bargraph_colverleaf <- '#80FF00'
color_red_bpfiguretext_anxiousdays <- '#C1272C'

###############################################################################
# Get Basic PT information
###############################################################################
config_pt_age <- data_config_pt_age
config_pt_sex <- data_config_pt_sex # 1:'Male'; 2:'Female', standarize to 1/2
config_pt_language <- data_config_pt_language # 'english' or 'spanish'
config_pt_doc_group <- 2 # 1 or 2 # 1 text first; 2 graphic first
config_pt_doc_layout <- 'a' # 'a', or 'b'

###############################################################################
# Body Mass Index (BMI)
###############################################################################
config_pt_bmi_value <- data_config_pt_bmi_value
# underweight, normal, overweight, obese
config_pt_bmi_cat <- calculate_pt_bmi_cat(config_pt_bmi_value)

###############################################################################
# Waist Measurement
###############################################################################
config_pt_waist_in <- data_config_pt_waist_in
config_pt_waist_in_cat <-
	calculate_pt_waist_in_cat(config_pt_waist_in, config_pt_sex)

###############################################################################
# Get days feeling depressed
###############################################################################
config_pt_depressed_30 <- data_config_pt_depressed_30
config_sex_age_depressed_30 <- data_config_sex_age_depressed_30

###############################################################################
# Get days feeling anxious
###############################################################################
config_pt_anxious_30 <- data_config_pt_anxious_30
config_sex_age_anxious_30 <- data_config_sex_age_anxious_30


###############################################################################
# Get Fruid Servings per Day
###############################################################################
config_pt_fruit_servings_per_day <- data_config_pt_fruit_servings_per_day
config_sex_age_fruit_servings_per_day <- data_config_sex_age_fruit_servings_per_day
config_min_fruit_servings_per_day  <- data_config_min_fruit_servings_per_day


###############################################################################
# Get Vegetable Servings per Day
###############################################################################
config_pt_vegetable_servings_per_day <- data_config_pt_vegetable_servings_per_day
config_sex_age_vegetable_servings_per_day <- data_config_sex_age_vegetable_servings_per_day
config_min_vegetable_servings_per_day <- data_config_min_vegetable_servings_per_day


###############################################################################
# Get Minutes of Vigorous Physical Activity per Week
###############################################################################
config_pt_mins_vigorous_physical_activity <- data_config_pt_mins_vigorous_physical_activity
config_sex_age_vigorous_physical_activity <- data_config_sex_age_vigorous_physical_activity


###############################################################################
# Get Minutes of Moderate Physical Activity per Week
###############################################################################
config_pt_mins_moderate_physical_activity <- data_config_pt_mins_moderate_physical_activity
config_sex_age_moderate_physical_activity <- data_config_sex_age_moderate_physical_activity


###############################################################################
# get servings per week of begerages containing sugar
###############################################################################
config_pt_soda_wk <- data_config_pt_soda_wk
config_pt_purejuice_wk <- data_config_pt_purejuice_wk
config_pt_sugaryfruitdrink_wk <- data_config_pt_sugaryfruitdrink_wk


###############################################################################
# get Composite 30-day Measures
###############################################################################
config_pt_healthy_energy_30 <- data_config_pt_healthy_energy_30
config_pt_physical_health_bad_30 <- data_config_pt_physical_health_bad_30
config_pt_mental_health_bad_30 <- data_config_pt_mental_health_bad_30


###############################################################################
# get depression symptoms A
###############################################################################
config_pt_depression_a <- data_config_pt_depression_a
config_sex_age_depression_a <- data_config_sex_age_depression_a

###############################################################################
# get prolonged stress
###############################################################################
config_pt_stress <- data_config_pt_stress
config_sex_age_stress <- data_config_sex_age_stress

###############################################################################
# get Anxiety Symptoms
###############################################################################
config_pt_anxiety <- data_config_pt_anxiety

###############################################################################
# get Anxiety Symptoms
###############################################################################
config_pt_depression_b <- data_config_pt_depression_b

###############################################################################
# get Overall Health
###############################################################################
config_pt_overall <- data_config_pt_overall
config_sex_age_overall <- data_config_sex_age_overall

###############################################################################
# Feeling Run Down
###############################################################################
config_pt_run_down <- data_config_pt_run_down
config_sex_age_run_down <- data_config_sex_age_run_down

###############################################################################
# Health Summary Control Panel
###############################################################################
config_pt_oral_health <- data_config_pt_oral_health

###############################################################################
# Ideal Cloverleaf
###############################################################################
config_pt_cloverleaf_fruit <- data_config_pt_cloverleaf_fruit
config_pt_cloverleaf_mental <- data_config_pt_cloverleaf_mental
config_pt_cloverleaf_overall <- data_config_pt_cloverleaf_overall
config_pt_cloverleaf_physical <- data_config_pt_cloverleaf_physical

###############################################################################
# Blood Pressure A & B
###############################################################################
config_pt_bp_s <- data_config_pt_bp_s
config_pt_bp_d <- data_config_pt_bp_d

