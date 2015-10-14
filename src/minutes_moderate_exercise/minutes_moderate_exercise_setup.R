df <-  data.frame(pt = config_pt_mins_moderate_physical_activity,
                  other = config_sex_age_moderate_physical_activity)
df <- melt(df)
# df$value <- c(0, 0)

df$text <- df$value
max_y <- max_y_activity(max(df$value), allowed_min=150)

y_axix_range <- max_y
min_bar_height <- y_axix_range * 0.03
min_center_bar_height <- y_axix_range * 0.3
df$value <- ifelse(df$value == 0, min_bar_height, df$value)
df$text_y <- sapply(X = df$text, FUN = y_axis_text_height,
                    min_bar_height, min_center_bar_height, 'moderate_exercise')
