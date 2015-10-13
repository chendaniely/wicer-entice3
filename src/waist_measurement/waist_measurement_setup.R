#config_pt_sex <- 1
#config_pt_waist_in <- 46

dummy <- data.frame(x = c(0, 20), y = c(0, 20))

base_image_g <- get_base_waist_image(gender = config_pt_sex,
                                     language = config_pt_language)
indicator_g <- create_grob_from_png_dir(
    'EnTICE3_2/Waist Measurement/Waist measurement indicator box.png')
