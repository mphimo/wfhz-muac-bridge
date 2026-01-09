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
