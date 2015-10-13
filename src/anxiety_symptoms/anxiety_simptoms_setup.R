dummy <- data.frame(x=c(0,81), y=c(0, 81))

base_image_g <- create_grob_from_png_dir(
    sprintf(
        "EnTICE3_2/Anxiety Depression Gradient Bar/%s_Gradient Bar with word anchors.png",
        convert_language_single(config_pt_language)
    ))
