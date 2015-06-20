#' calculates a BMI categor or group from a given bmi value
#' possible catetories/groups are:
#' underweight
#' normal
#' overweight
#' obese
calculate_pt_bmi_cat <- function(pt_bmi_value){
    if (is.na(pt_bmi_value)) {
        return(NA)
    } else if (pt_bmi_value <= 0) {
        stop("BMI is less than or equal to 0")
    } else if (pt_bmi_value < 18.5) {
        return('underweight')
    } else if (pt_bmi_value >= 18.5 & pt_bmi_value < 25) {
        return("normal")
    } else if (pt_bmi_value >= 25 & pt_bmi_value < 30) {
        return("overweight")
    } else if (pt_bmi_value >= 30) {
        return("obese")
    }
    else{
        stop("unknown pt_bmi_value value passed")
    }
}

#' first determines the sex of the patient
#' then depending on the sex, calculate which waist category the patient is in
#' possible categores:
#' "low"
#' "high"
calculate_pt_waist_in_cat <- function(pt_waist_in, pt_sex){
  if (is.na(pt_waist_in)) {
      return(NA)
  } else if (pt_waist_in <= 15) {
    stop("Waist inch measure is less than or equal to 15, this doesn't make sense")
  }else if (tolower(pt_sex) == "male" | pt_sex == 1){
    if (pt_waist_in < 40) {
      return("low")
    } else if (pt_waist_in >= 40) {
      return("high")
    } else{
      stop("unknown weight size for male")
    }
  } else if (tolower((pt_sex) == 'female' | pt_sex == 2)) {
    if (pt_waist_in < 35) {
      return("low")
    } else if (pt_waist_in >= 35) {
      return("high")
    } else{
      stop("unknown waist size for female")
    }
  } else{
    stop("Unknown pt_sex passed into calculate_pt_waist_in_cat")
  }
}

calculate_pt_bp_s_cat <- function(pt_bp_s){
    if (pt_bp_s <= 120) {
        return('healthy')
    } else if (pt_bp_s < 140) {
        return('borderline')
    } else if (pt_bp_s >= 140) {
        return('high')
    }
}

calculate_pt_bp_d_cat <- function(pt_bp_d){
    if (pt_bp_d <= 80) {
        return('healthy')
    } else if (pt_bp_d < 90) {
        return('borderline')
    } else if (pt_bp_d >= 90) {
        return('high')
    }
}

calculate_pt_bp_stoplight_color <- function(pt_bp_cat){
    if (pt_bp_cat == 'healthy') {
        return("Green")
    } else if (pt_bp_cat == 'borderline') {
        return("Yellow")
    } else if (pt_bp_cat == 'high') {
        return("Red")
    }
}
