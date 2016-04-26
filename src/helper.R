library(testthat)

get_men_women <- function(sex_value, language='english', type='both'){
    if (language == 'english') {
        if (sex_value == 1 | tolower(sex_value) == "male") {
            return('Men')
        } else {
            return('Women')
        }
    } else if (language == 'spanish') {
        if (sex_value == 1 | tolower(sex_value) == "male") {
            # return(ifelse(type == 'both', 'Otros hombres', 'Hombres'))
            if (type == 'both') {
                return('Otros hombres')
            } else if (type == 'for') {
                return("los hombres")
            } else if (type == 'gender') {
                return('Hombres')
            }
        } else {
            # return(ifelse(type == 'both', 'Otras mujeres', 'Mujeres'))
            if (type == 'both') {
                return("Otras mujeres")
            } else if (type == 'for') {
                return("las mujeres")
            } else if (type == 'gender') {
                return("Mujeres")
            }
        }
    }

}

max_y_activity <- function(max_value, allowed_min=90){
    if(max_value <= allowed_min){
        return(allowed_min)
    } else{
        return(max_value + 15)
    }
}

y_axis_range <- function(max_value, plot_type) {
    if (plot_type == 'fruit_servings_per_day') {
        if (max_value < 2) {
            return(2)
        } else {
            return(round(max_value + 1))
        }
    } else if (plot_type == 'vegetable_servings_per_day') {
        if (max_value < 3) {
            return(3)
        } else {
            return(round(max_value + 1))
        }
    } else if (plot_type == 'composite_beverage_servings') {
        if (max_value < 4) {
            return(5)
        } else {
            return(round(max_value + 1))
        }
    } else if (plot_type == 'composite_30') {
        return(30)
    } else if (plot_type == 'beverage_recommendations') {
        if (max_value < 4) {
            return(5)
        } else {
            return(round(max_value + 1))
        }
    } else {
        stop("Unknown plot type")
    }
}

y_axis_text_height <- function(value, min_bar_height, min_center_bar_height, plot_type) {
    if (plot_type == 'fruit_servings_per_day') {
        if (value <= min_center_bar_height) {
            y <- value + min_center_bar_height / 1.55# + min_center_bar_height / 2
            return(y)
        }
        if (value <= min_bar_height) {
            zero <- (value + min_center_bar_height)
            #(y + zero) / 2
            return(zero)
        } else {
            return(value / 2)
        }
    } else if (plot_type == 'composite_beverage_servings') {
        if (value <= min_center_bar_height) {
            y <- value + min_center_bar_height / 2
            y
        }
        if (value <= min_bar_height) {
            zero <- (value + min_center_bar_height)
            (y + zero) / 6
        } else {
            value / 2
        }
    } else if (plot_type == 'moderate_exercise') {
        if (value <= min_center_bar_height & value > min_bar_height) {
            y <- value + min_center_bar_height / 4
            y
        } else if (value <= min_center_bar_height & value <= min_bar_height) {
            y <- value + min_center_bar_height / 2
            zero <- (value + min_center_bar_height)
            (y + zero) / 6
        } else {
            value / 2
        }
    } else if (plot_type == 'beverage_recommendations') {
        if (value <= min_center_bar_height) {
            y <- value + min_center_bar_height / 2
            y
        }
        if (value <= min_bar_height) {
            zero <- (value + min_center_bar_height)
            (y + zero) / 3
        } else {
            value / 2
        }
    } else if (plot_type == 'exercise_recommendations') {
        if (value <= min_center_bar_height & value > min_bar_height) {
            y <- value + min_center_bar_height / 2
            y
        } else if (value <= min_center_bar_height & value <= min_bar_height) {
            y <- value + min_center_bar_height / 1.5
            zero <- (value + min_center_bar_height)
            (y + zero) / 6
        } else {
            value / 2
        }
    } else if (plot_type == 'exercise_recommendations_small') {
        if (value <= min_center_bar_height & value > min_bar_height) {
            y <- value + min_center_bar_height / 2
            y
        } else if (value <= min_center_bar_height & value <= min_bar_height) {
            y <- value + min_center_bar_height / 1.5
            zero <- (value + min_center_bar_height)
            (y + zero) / 2
        } else {
            value / 2
        }
    }else {
        stop("unknown plot_type")
    }
}

create_grob_from_png_dir <- function(png_dir){
    image <- readPNG(png_dir)
    g <- rasterGrob(image, interpolate=TRUE)
    return(g)
}

calculate_bmi_indicator_bounds <- function(bmi_value){
    if (bmi_value > 36) {
        bmi_value <- 36.5
    } else if (bmi_value < 14) {
        bmi_value <- 13.5
    }
    offset_from_15 <- (bmi_value - 15) * 0.9
    x_min <- 0.65 + offset_from_15
    x_max <- x_min + 2
    y_min <- -1.5
    y_max <- 1.5
    return(list("x_min" = x_min, "x_max" = x_max,
                "y_min" = y_min, "y_max" = y_max))
}

calculate_bmi_cat_coord <- function(bmi_value, pt_sex){
    pt_bmi_cat <- calculate_pt_bmi_cat(bmi_value)
    coords <- list()
    # x_coord <- NULL
    if (tolower(pt_sex) == 'male' | pt_sex == 1) {
        y_coord <- 15.5
        coords$y <- y_coord
        if (tolower(pt_bmi_cat) == 'underweight') {
            coords$x <- 2.9
        } else if (tolower(pt_bmi_cat) == 'normal') {
            coords$x <- 7.6
        } else if (tolower(pt_bmi_cat) == 'overweight') {
            coords$x <- 12.8
        } else if (tolower(pt_bmi_cat) == 'obese') {
            coords$x <- 17.65
        }
    } else {
        y_coord <- 14.5
        coords$y <- y_coord
        if (tolower(pt_bmi_cat) == 'underweight') {
            coords$x <- 2.75
        } else if (tolower(pt_bmi_cat) == 'normal') {
            coords$x <- 7.6
        } else if (tolower(pt_bmi_cat) == 'overweight') {
            coords$x <- 12.8
        } else if (tolower(pt_bmi_cat) == 'obese') {
            coords$x <- 17.80
        }
    }
    return(coords)
}

calculate_waist_indicator_bounds <- function(waist_value, pt_sex){
    if (pt_sex == 1) {
        if (waist_value < 30.75) {
            waist_value <- 29.75
        } else if (waist_value > 49.25) {
            waist_value <- 50.25
        }
    } else {
        if (waist_value < 25.75) {
            waist_value <- 24.75
        } else if (waist_value > 44.25) {
            waist_value <- 45.25
        }
    }

    offset_value <- ifelse(pt_sex == 1, 32, 27)
    offset <- (waist_value - offset_value)
    x_min <- 1.5 + (offset * (0.88))
    x_max <- x_min + 2.5
    y_min <- 2
    y_max <- y_min + 2.5
    return(list("x_min" = x_min, "x_max" = x_max,
                "y_min" = y_min, "y_max" = y_max))
}

calculate_pt_waist_cat <- function(waist_value, pt_sex) {
    if (tolower(pt_sex) == "male" | pt_sex == 1) {
        if (waist_value < 40) {
            return('lower')
        } else {
            return('higher')
        }
    } else if (tolower(pt_sex)  == 'female' | pt_sex == 2) {
        if (waist_value < 35) {
            return('lower')
        } else{
            return('higher')
        }
    } else {
        stop("unknown pt_sex passed into calculate_pt_waist_cat")
    }
}

calculate_waist_cat_coord <- function(waist_value, pt_sex){
    pt_waist_cat <- calculate_pt_waist_cat(waist_value, pt_sex)
    x_coord <- NULL
    if (tolower(pt_sex) == 'male' | pt_sex == 1) {
        y_coord <- 14
        coords <- list()
        coords$y <- y_coord
        if (pt_waist_cat == 'lower') {
            coords$x <- 6.0
        } else if (pt_waist_cat == 'higher') {
            coords$x <- 13.85
        }
    } else if (tolower(pt_sex) == 'female' | pt_sex == 2) {
        y_coord <- 13.5
        coords <- list()
        coords$y <- y_coord
        if (pt_waist_cat == 'lower') {
            coords$x <- 5.55
        } else if (pt_waist_cat == 'higher') {
            coords$x <- 13.85
        }
    }
    return(coords)
}

convert_gender_single <- function(gender){
    if(tolower(gender) == 'male' | gender == '1'){
        g <- 'M'
    } else if(tolower(gender) == 'female' | gender == '2'){
        g <- 'F'
    } else{
        stop("unknown gender passed")
    }
}

convert_language_single <- function(language){
    if(tolower(language) == 'english'){
        l <- 'E'
    } else if(tolower(language) == 'spanish'){
        l <- 'S'
    } else{
        stop("unknown language passed to get_base_waist_image")
    }
}

get_base_waist_image <- function(gender, language){
    g <- convert_gender_single(gender)
    l <- convert_language_single(language)

    file_to_use <- sprintf(
        "EnTICE3_2/Waist Measurement/%s%s_Waist Measure with title.png", l, g)
    # print(file_to_use)
    expect_true(file.exists(file_to_use))
    grob <- create_grob_from_png_dir(file_to_use)
    return(grob)
}

create_unit_square <- function(bottom_left_coord,
                               square_side_length = 1){
    expect_equal(length(bottom_left_coord), 2)
    blc_x <- bottom_left_coord[1]
    blc_y <- bottom_left_coord[2]
    top_left_coord <- bottom_left_coord + c(0, square_side_length)
    top_right_coord <- bottom_left_coord +c(square_side_length,
                                            square_side_length)
    bottom_right_coord <- bottom_left_coord + c(square_side_length, 0)
    return(list(bottom_left_coord, top_left_coord,
                top_right_coord, bottom_right_coord))
}

create_corner_points <- function(spacing, num_x = 6, num_y = 5,
                                 square_size_length = 1){
    point_distance <- spacing + square_size_length

    x_points <- sapply(0:(num_x - 1), function(x){rep(x * point_distance, num_y)})
    y_points <- sapply((num_y - 1):0, function(x){rep(x * point_distance, num_x)})

    x_matrix <- matrix(x_points, nrow = 5)
    y_matrix <- t(matrix(y_points, ncol = 5))
    # print(x_matrix)
    # print(y_matrix)
    (mapply(c, t(x_matrix), t(y_matrix)))
}

get_square_center <- function(bottom_list_coord){
    square_coords <- create_unit_square(bottom_list_coord)
    x_center <-((square_coords[[1]] + square_coords[[4]]) / 2)[1]
    y_center <-((square_coords[[1]] + square_coords[[2]]) / 2)[2]
    return(list(x_center, y_center))
}

get_depression_symptom_image <- function(depression_value, depression_type){
    img_stress_base <-
        sprintf("EnTICE3_2/Depression Symptoms A/%s_Blue Gauge ",
                convert_language_single(config_pt_language))
    to_image <-  sprintf('src/depression_symptoms_a/depression_symptoms_a_%s.png',
                         depression_type)
    if (depression_value >= 0 & depression_value <= 4) {
        # print("Very Low")
        return_stat <- "very low"
        file.copy(from = paste0(img_stress_base, 'Very Low.png'),
                  to = to_image, overwrite = TRUE)
    } else if(depression_value >= 5 & depression_value <= 9){
        # print("Low")
        return_stat <- "low"
        file.copy(from = paste0(img_stress_base, 'Low.png'),
                  to = to_image, overwrite = TRUE)
    } else if(depression_value >= 10 & depression_value <= 14){
        # print("Moderate")
        return_stat <- "moderate"
        file.copy(from = paste0(img_stress_base, 'Moderate.png'),
                  to = to_image, overwrite = TRUE)
    } else if(depression_value >= 15 & depression_value <= 19){
        # print("High")
        return_stat <- "high"
        file.copy(from = paste0(img_stress_base, 'High.png'),
                  to = to_image, overwrite = TRUE)
    } else if(depression_value >= 20 & depression_value <= 27){
        # print("Very High")
        return_stat <- "very high"
        file.copy(from = paste0(img_stress_base, 'Very High.png'),
                  to = to_image, overwrite = TRUE)
    }
    return(return_stat)
}

get_prolong_stress_image_stat <- function(stress_value, stress_type){
    img_stress_base <-
        sprintf("EnTICE3_2/Prolonged Stress/%s_Multi Gauge ",
                convert_language_single(config_pt_language))
    copy_to <- sprintf('src/prolonged_stress/prolonged_stress_%s.png', stress_type)
    if(is.na(stress_value)){
        return_stress <- "very low"
        file.copy(from = paste0(img_stress_base, "Very Low.png"),
                  to = copy_to, overwrite = TRUE)
    } else if(stress_value < 0){
        stop("Invalid value passed to stress_value")
    } else if(stress_value >= 0 & stress_value <= 1){
        return_stress <- "very low"
        file.copy(from = paste0(img_stress_base, "Very Low.png"),
                  to = copy_to, overwrite = TRUE)
    } else if(stress_value == 2){
        return_stress <- "low"
        file.copy(from = paste0(img_stress_base, "Low.png"),
                  to = copy_to, overwrite = TRUE)
    } else if(stress_value == 3){
        return_stress <- "moderate"
        file.copy(from = paste0(img_stress_base, "Moderate.png"),
                  to = copy_to, overwrite = TRUE)
    } else if(stress_value == 4){
        return_stress <- "high"
        file.copy(from = paste0(img_stress_base, "High.png"),
                  to = copy_to, overwrite = TRUE)
    } else if(stress_value == 5){
        return_stress <- "very high"
        file.copy(from = paste0(img_stress_base, "Very High.png"),
                  to = copy_to, overwrite = TRUE)
    } else{
        stop("Value too high for stress_value")
    }
    return(return_stress)
}

get_overall_health_star <- function(star_value){
    star_file <- sprintf("EnTICE3_2/Overall Health/%s star.png", star_value)
    # print(star_file)
    star_grob <- create_grob_from_png_dir(star_file)
    return(star_grob)
}

get_overall_health_text <- function(overall_health_value, language='english'){
    if (language == 'english'){
        if (is.na(overall_health_value)){
            return("Poor")
        } else if (overall_health_value == 1){
            return("Excellent")
        } else if (overall_health_value == 2){
            return("Very Good")
        } else if (overall_health_value == 3){
            return("Good")
        } else if (overall_health_value == 4){
            return("Fair")
        } else if (overall_health_value %in% c(5, 6)){
            return("Poor")
        } else {
            return("Poor")
        }
    } else if (language == 'spanish'){
        if (is.na(overall_health_value)){
            return("Mala")
        } else if (overall_health_value == 1){
            return("Excelente")
        } else if (overall_health_value == 2){
            return("Muy Buena")
        } else if (overall_health_value == 3){
            return("Buena")
        } else if (overall_health_value == 4){
            return("Regular")
        } else if (overall_health_value %in% c(5, 6)){
            return("Mala")
        } else {
            return("Mala")
        }
    }
}


get_feeling_run_down_text <- function(feeling_run_down_value, language='english'){
    if (is.na(feeling_run_down_value)){
        return(NA)
    } else if (feeling_run_down_value == 1){
        return("Not At All")
    } else if (feeling_run_down_value == 2){
        return("A Little Bit")
    } else if (feeling_run_down_value == 3){
        return("Somewhat")
    } else if (feeling_run_down_value == 4){
        return("Quite A Bit")
    } else if (feeling_run_down_value == 5){
        return("Very Much")
    }
}

theme_nothing <- function(base_size = 12, base_family = "Helvetica")
{
    theme_bw(base_size = base_size, base_family = base_family) %+replace%
        theme(
            rect             = element_blank(),
            line             = element_blank(),
            text             = element_blank(),
            axis.ticks.margin = unit(0, "lines")
        )
}
# check that it is a complete theme
attr(theme_nothing(), "complete")

theme_nothing_text <- function(base_size = 12, base_family = "Helvetica")
{
    theme_bw(base_size = base_size, base_family = base_family) %+replace%
        theme(
            rect             = element_blank(),
            line             = element_blank(),
            axis.ticks.margin = unit(0, "lines")
        )
}
# check that it is a complete theme
attr(theme_nothing_text(), "complete")

spanish_blue <- function(pt_sex){
    return(ifelse(pt_sex == 1, enc2utf8('melancólico'), enc2utf8('melancólica')))
}

spanish_depressed <- function(pt_sex){
    return(ifelse(pt_sex == 1, 'deprimido', 'deprimida'))
}
# preocupado, ansioso, o tenso
spanish_gender <- function(base_word, pt_sex){
    if (pt_sex == 2){
        return(paste0(base_word, 'a'))
    } else {
        return(paste0(base_word, 'o'))
    }
}

translate_dial_spanish <- function(english_text){
    english_text <- tolower(english_text)
    if (english_text == 'very low') {
        return('muy bajo')
    } else if (english_text == 'low') {
        return('bajo')
    } else if (english_text == 'moderate') {
        return("moderado")
    } else if (english_text == 'high') {
        return("alto")
    } else if (english_text == 'very high'){
        return("muy alto")
    }
}

translate_rundown_spanish <- function(english_text){
    english_text <- tolower(english_text)
    if (is.na(english_text)){
        return("Nada")
    } else if (english_text == 'not at all') {
        return('Nada')
    } else if (english_text == 'a little bit') {
        return("Un Poquito")
    } else if (english_text == 'somewhat') {
        return("Algun Tanto")
    } else if (english_text == 'quite a bit') {
        return("Bastante")
    } else if (english_text == 'very much') {
        return(enc2utf8("Muchísimo"))
    }
}

translate_cloverleaf_spanish <- function(english_text, fair_poor='majo/muy bajo') {
    english_text <- tolower(english_text)
    if (english_text == 'excellent') {
        return("Excelente")
    } else if (english_text == 'very good') {
        return('Muy buena')
    } else if (english_text == 'good') {
        return('Buena')
    } else if (english_text == 'fair') {
        if (fair_poor == 'majo/muy bajo') {
            return('Bajo')
        } else if (fair_poor == 'regular/mala') {
            return('Regular')
        }
    } else if (english_text == 'poor') {
        if (fair_poor == 'majo/muy bajo') {
            return('Muy bajo')
        } else if (fair_poor == 'regular/mala') {
            return('Mala')
        }
    } else{
        return(sprintf('Unknown english text: %s', english_text))
    }
}

get_health_summary_words_from_color <- function(health_summary_color, language='english'){
    health_summary_color <- tolower(health_summary_color)
    if (language == 'english'){
        if (health_summary_color == "green"){
            return("healthy")
        } else if (health_summary_color == 'yellow') {
            return("borderline")
        } else if (health_summary_color == 'red') {
            return("unhealthy")
        } else {
            stop("Unknown health summary color")
        }
    } else if (language == 'spanish') {
        if (health_summary_color == "green") {
            return("estaba saludable")
        } else if (health_summary_color == 'yellow') {
            return("requiere cuidado")
        } else if (health_summary_color == 'red') {
            return("no estaba saludable")
        } else {
            stop("Unknown health summary color")
        }
    } else {
        stop('Unknown Language')
    }

}
