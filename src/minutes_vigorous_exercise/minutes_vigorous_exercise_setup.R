df <-  data.frame(pt = config_pt_mins_vigorous_physical_activity,
                  other = config_sex_age_vigorous_physical_activity)
df <- melt(df)
# df$value <- c(0, 0)

df$text <- df$value
max_y <- max_y_activity(max(df$value))

y_axix_range <- max_y
min_bar_height <- y_axix_range * 0.03
min_center_bar_height <- y_axix_range * 0.1
df$value <- ifelse(df$value == 0, min_bar_height, df$value)
df$text_y <- sapply(X = df$text, FUN = y_axis_text_height,
                    min_bar_height, min_center_bar_height, 'fruit_servings_per_day')
