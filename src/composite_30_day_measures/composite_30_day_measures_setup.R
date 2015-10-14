df <-  data.frame(healthy = config_pt_healthy_energy_30,
                  physical = config_pt_physical_health_bad_30,
                  mental = config_pt_mental_health_bad_30)
df <- melt(df)
# df$value <- c(0, 1, 20)

df$text <- df$value
y_axix_range <- y_axis_range(max(df$value), 'composite_30')
min_bar_height <- y_axix_range * 0.01
min_center_bar_height <- y_axix_range * 0.1
df$value <- ifelse(df$value == 0, min_bar_height, df$value)
df$text_y <- sapply(X = df$text, FUN = y_axis_text_height,
                    min_bar_height, min_center_bar_height, 'composite_beverage_servings')
