health_summary_colors <- get_health_summary_colors(
    prolonged_stress_value = config_pt_stress,
    bmi_value = config_pt_bmi_value,
    oral_health_value = config_pt_oral_health,
    blood_pressure_s_value = config_pt_bp_s,
    blood_pressure_d_value = config_pt_bp_d)

health_summary_words <- lapply(X = health_summary_colors,
                               FUN = get_health_summary_words_from_color,
                               language=data_config_pt_language)
