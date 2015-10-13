dummy <- data.frame(x = c(0, 21), y = c(0, 21))

base_image_file <- sprintf(
    "EnTICE3_2/Body Mass Index/%s%s_BMI no title.png",
    convert_language_single(config_pt_language),
    convert_gender_single(config_pt_sex))

base_image_g <- create_grob_from_png_dir(base_image_file)

indicator_g <- create_grob_from_png_dir(
    "EnTICE3_2/Body Mass Index/BMI indicator box.png")

# config_pt_bmi_value <- 34.5
indicator_bounds <- calculate_bmi_indicator_bounds(config_pt_bmi_value)
cat_text_coords <- calculate_bmi_cat_coord(config_pt_bmi_value, config_pt_sex)
