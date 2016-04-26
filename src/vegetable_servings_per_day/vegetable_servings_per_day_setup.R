df <-  data.frame(pt = config_pt_vegetable_servings_per_day,
                  other = config_sex_age_vegetable_servings_per_day,
                  min = config_min_vegetable_servings_per_day)
df <- melt(df)

df$text <- df$value
y_axix_range <- y_axis_range(max(df$value), 'vegetable_servings_per_day')
min_bar_height <- y_axix_range * 0.02
min_center_bar_height <- y_axix_range * 0.10
df$value <- ifelse(df$value == 0, min_bar_height, df$value)
df$text_y <- sapply(X = df$text, FUN = y_axis_text_height,
                    min_bar_height, min_center_bar_height, 'fruit_servings_per_day')
