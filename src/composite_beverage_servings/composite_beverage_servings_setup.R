df <-  data.frame(soda = config_pt_soda_wk,
                  purejuice = config_pt_purejuice_wk,
                  sugaryfruitdrink = config_pt_sugaryfruitdrink_wk)
df <- melt(df)
# df$value <- c(0, 1, 20)

df$text <- df$value
y_axis_range_value <- y_axis_range(max(df$value), 'composite_beverage_servings')
min_bar_height <- y_axis_range_value * 0.01
min_center_bar_height <- y_axis_range_value * 0.1
df$value <- ifelse(df$value == 0, min_bar_height, df$value)
df$text_y <- sapply(X = df$text, FUN = y_axis_text_height,
                    min_bar_height, min_center_bar_height, 'composite_beverage_servings')
