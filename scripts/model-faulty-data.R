# ==============================================================================
#                 TEST WHETHER FEATURES LEAD TO ACCURATE PREDICTION 
# ==============================================================================

## ---- Get the prevalence estimate from the testing set  ----------------------

### Time-based split ----
pred_faulty_time <- Test_faulty_time |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_muac = mean(gam_muac, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev =  prev_muac, 
      known_prop_wfhz = features_faulty_time$median_prop_wfhz, 
      known_prop_muac = features_faulty_time$median_prop_muac,
      .for = "wfhz"
    ),
    pred_muac = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = features_faulty_time$median_prop_wfhz,
      known_prop_muac = features_faulty_time$median_prop_muac,
      .for = "muac"
    ),
    bias_wfhz = pred_wfhz - prev_wfhz,
    bias_muac = pred_muac - prev_muac,
    .by = surv_id
  )


### Time-based split ----
pred_faulty_random <- Test_flawless_random |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_muac = mean(gam_muac, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev = prev_muac, 
      known_prop_wfhz = features_flawless_random$median_prop_wfhz, 
      known_prop_muac = features_flawless_random$median_prop_muac,
      .for = "wfhz"
    ),
    pred_muac = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = features_flawless_random$median_prop_wfhz,
      known_prop_muac = features_flawless_random$median_prop_muac,
      .for = "muac"
    ),
    bias_wfhz = pred_wfhz - prev_wfhz,
    bias_muac = pred_muac - prev_muac,
    .by = surv_id
  )

# ============================  End of Workflow ================================