df <-  data.frame(soda = config_pt_soda_wk,
                  purejuice = config_pt_purejuice_wk)
df <- melt(df)

df$text <- df$value
y_axis_range_calc <- y_axis_range(max(df$value), 'beverage_recommendations')

min_bar_height <- y_axis_range_calc * 0.01
min_center_bar_height <- y_axis_range_calc * 0.1
df$value <- ifelse(df$value == 0, min_bar_height, df$value)
df$text_y <- sapply(X = df$text, FUN = y_axis_text_height,
                    min_bar_height, min_center_bar_height, 'beverage_recommendations')
