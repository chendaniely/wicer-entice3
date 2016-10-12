calculate_age_group <- function(pt_age){
    # 18-30; 31-50; 51-64; 65+
    if (is.na(pt_age)) {
        return(NA)
    }
    if (pt_age >= 18 & pt_age <= 30) {
        return("18-30")
    } else if (pt_age >= 31 & pt_age <= 50) {
        return("31-50")
    } else if (pt_age >= 51 & pt_age <= 64) {
        return("51-64")
    } else if (pt_age >= 65) {
        return("65+")
    }
}

calculate_fruit_servings_recommended <- function(pt_sex, pt_age){
    if (pt_sex == 1) {
        return(2)
    } else if (pt_sex == 2) {
        if (pt_age >= 18 & pt_age <= 30) {
            return(2)
        } else{
            return(1.5)
        }
    }
}

calculate_vegetable_servings_recommended <- function(pt_sex, pt_age){
    if (pt_sex == 1) {
        if (pt_age < 50) {
            return(3)
        } else {
            return(2.5)
        }
    } else if (pt_sex == 2) {
        if (pt_age < 50) {
            return(2.5)
        } else {
            return(2)
        }
    }
}

calculate_cloverleaf_fruit_value <- function(fruit_value, vegetable_value,
                                             pt_sex, pt_age){
    fruit_min <- calculate_fruit_servings_recommended(
        data_config_pt_sex, data_config_pt_age)

    vegetable_min <- calculate_vegetable_servings_recommended(
        data_config_pt_sex, data_config_pt_age)
    if (is.na(fruit_value)){
        fruit_value <- 0
    }
    if (is.na(vegetable_value)){
        vegetable_value <- 0
    }
    if (fruit_value == 0 & vegetable_value == 0){
        return("Poor")
    } else if (fruit_value >= fruit_min & vegetable_value >= vegetable_min){
        return("Excellent")
    } else if (fruit_value >= fruit_min | vegetable_value >= vegetable_min){
        return("Good")
    } else if (fruit_value > 0 | vegetable_value > 0){
        return("Fair")
    }
}

translate_cloverleaf_value_spanish <- function(cloverleaf_value){
    if (cloverleaf_value == 'Poor'){
        return("Mala")
    } else if (cloverleaf_value == "Fair"){
        return("Regular")
    } else if (cloverleaf_value == 'Good') {
        return("Buena")
    } else if (cloverleaf_value == 'Very Good') {
        return("Muy Buena")
    } else if (cloverleaf_value == 'Excellent') {
        return("Excelente")
    }
}

#'full petal for 0 days (excellent/excelente).
#'Largish petal for 1-5 days (good/buena).
#'Medium petal for 6-10 days (fair/regular).
#'Small petal for >10 days (poor/mala).
calculate_cloverleaf_mental_value <- function(mental_value){
    if (is.na(mental_value)){
        mental_value <- 99
    }
    if (mental_value == 0){
        return("Excellent")
    } else if (mental_value >= 1 & mental_value <= 5){
        return("Good")
    } else if (mental_value >= 6 & mental_value <= 10){
        return("Fair")
    } else if (mental_value > 10){
        return("Poor")
    }
}

#' Five petal sizes correspond to poor, fair, good, very good, and
#' excellent / mala, regular, buena, muy buena, excelente
calculate_cloverleaf_overall_value <- function(overall_value){
    if (is.na(overall_value)){
        return("Poor")
    } else if (overall_value == 1){ ## TODO SHOULD BE 5 or 6
        return("Poor")
    } else if (overall_value == 2){ ## TODO SHOULD BE 4
        return("Fair")
    } else if (overall_value == 3){ ## TODO should be 3
        return("Good")
    } else if (overall_value == 4){ ## TODO SHOULD BE 2
        return("Very Good")
    } else if (overall_value == 5){ ## TODO SHOULD BE 1
        return("Excellent")
    }
}

#' [moderate + 2(vigorous)= adjusted minutes].
#' Full petal if adjusted minutes > 150 (excellent/excelente).
#' Middle petal if 75 < adj. min. < 150 (good/bueno).
#' Small petal if 0 < adj. min. <     75 min (fair/bajo).
#' Tiny petal if zero (poor/muy bajo)
calculate_cloverleaf_physical_value <- function(moderate_value, vigorous_value){
    moderate_value <- as.numeric(moderate_value)
    vigorous_value <- as.numeric(vigorous_value)

    if (is.na(moderate_value)){
        moderate_value <- 0
    }
    if (is.na(vigorous_value)){
        vigorous_value <- 0
    }
    adj_mins <- moderate_value + (2 * vigorous_value)
    if (adj_mins == 0){
        return("Poor")
    } else if (adj_mins < 75){
        return("Fair")
    } else if (adj_mins < 150){
        return("Good")
    } else if (adj_mins >= 150){
        return("Excellent")
    }
}
