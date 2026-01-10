#'
#' 
#' Estimate the total burden of wasting and the 
#' 
#' @description 
#' Estimate the total number of cases of wasting based on the combined case defi-
#' nition, based on weight-for-height z-scores and mid-upper arm circumference. 
#' Then estimate the respective proportions. 
#' 
#' @param .data a data frame.
#' @param cgam a vector containing definition of wasting (combined).
#' @param gam_wfhz a vector containing definiton of wasting based on WFHZ.
#' @param gam_muac a vector containing defintion of wasting based on MUAC.
#' @param .by A vector for grouped analysis. Optional
#' 
#' 
#' @returns a summarised tibble. 

estimate_burden_of_wasting <- function(.data, cgam, gam_wfhz, gam_muac, .by) {

  df <- summarise(
    .data = .data,

    ## Get the number of children/observations in the data ----
    total_children = n(),

    ## Get the number of positive cases ----
    nr_combined_wasting = sum({{ cgam  }}, na.rm = TRUE),
    nr_wasting_by_wfhz = sum({{ gam_wfhz }}, na.rm = TRUE),
    nr_wasting_by_muac = sum({{ gam_muac }}, na.rm = TRUE),

    ## Get the proportion against the combined wasting (overall burden) ----
    prop_wasting = nr_combined_wasting / nr_combined_wasting,
    prop_wasting_by_wfhz = nr_wasting_by_wfhz / nr_combined_wasting,
    prop_wasting_by_muac = nr_wasting_by_muac / nr_combined_wasting,
    .by = {{ .by }}
  ) 

  df
}


#'
#' @title
#' Predict the prevalence of wasting derived from weight-for-height z-score or
#' mid-upper arm cincunference on the basis on known feature insights from 
#' historical data
#' 
#' @description
#' The function estimates what would be the prevalence of wasting derived from
#' either weight-for-height z-scores (WFHZ) or mid-upper arm circunference when either 
#' is unavailable. The prediction happens thanks to insights on the median 
#' proportion of cases of wasting that each methods identifies over the overall
#' burden based on combined definition of wasting, learned extracted from histor-
#' ical datasets.
#' 
#' @param prev The observed prevalence of wasting.
#' @param known_prop_wfhz The known median proportion of cases of wasting 
#' identified by WFHZ from historical survey dataset.
#' @param known_prop_muac The known median proportion of cases of wasting ident-
#' ified by MUAC from historical survey dataset.
#' @param .for The method for which the prediction should be. Defaults to WFHZ
#' 
#' 
#' @returns A value for the predicted prevalence of wasting for the method 
#' chosen in the `.for` argument.

predict_prevalence <- function(
  obs_prev, 
  known_prop_wfhz, 
  known_prop_muac, 
  .for = c("wfhz", "muac")
) {

  ## Enforce options in `.for` ----
  .for <- match.arg(.for)

 if (.for == "wfhz") {
    (obs_prev * known_prop_wfhz) / known_prop_muac
  } else {
    (obs_prev * known_prop_muac) / known_prop_wfhz
  }

}
