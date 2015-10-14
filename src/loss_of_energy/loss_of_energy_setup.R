# From top to bottom: Not At All = 1; A Little Bit = 2; Somewhat = 3; Quite A Bit
# = 4; Very Much = 5
dummy <- data.frame(x=c(0,10), y=c(0, 10))

center_text_g <- create_grob_from_png_dir(
    sprintf(
        "EnTICE3_2/Feeling Run Down/%s_Word markers with title.png",
        convert_language_single(config_pt_language)
    ))
pt_run_down_text <- get_feeling_run_down_text(config_pt_run_down)
sex_age_run_down_text <- get_feeling_run_down_text(config_sex_age_run_down)
