# ==============================================================================
#               TEST WHETHER FEATURES LEAD TO ACCURATE PREDICTION 
# ==============================================================================

## ---- Get the prevalence estimate from the testing set  ----------------------

### Time-based split ----
muac_wfhz_pred_fl_time <- muac_wfhz_fl_test_time |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_muac = mean(gam_muac, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev = prev_muac, 
      known_prop_wfhz = muac_wfhz_feat_fl_time$median_prop_wfhz, 
      known_prop_muac = muac_wfhz_feat_fl_time$median_prop_muac,
      .for = "wfhz"
    ),
    pred_muac = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = muac_wfhz_feat_fl_time$median_prop_wfhz,
      known_prop_muac = muac_wfhz_feat_fl_time$median_prop_muac,
      .for = "muac"
    ),
    pred_wfhz_ratio = prev_muac * muac_wfhz_feat_fl_ratio_time$median_wfhz_muac,
    abs_error = get_absolute_percent_error(prev_wfhz, pred_wfhz),
    abs_ratio = get_absolute_percent_error(prev_wfhz, pred_wfhz_ratio),
    raw_error = pred_wfhz - prev_wfhz,
    raw_error_ratio = pred_wfhz_ratio - prev_wfhz,
    .by = surv_id
  )

### Estimate model accuracy: MAE and MAPE ----
  muac_wfhz_fl_time_model_accuracy <- muac_wfhz_pred_fl_time |> 
    summarise(
      mae = mae(actual = prev_wfhz, predicted = pred_wfhz),
      ratio_mae = mae(actual = prev_wfhz, predicted = pred_wfhz_ratio),
      mape = mape(actual = prev_wfhz, predicted = pred_wfhz) * 100,
      ratio_mape = mape(actual = prev_wfhz, predicted = pred_wfhz_ratio) * 100,
    )

### Random-based split ----
muac_wfhz_pred_fl_rdm <- muac_wfhz_fl_test_rdm |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_muac = mean(gam_muac, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev = prev_muac, 
      known_prop_wfhz = muac_wfhz_feat_fl_rdm$median_prop_wfhz, 
      known_prop_muac = muac_wfhz_feat_fl_rdm$median_prop_muac,
      .for = "wfhz"
    ),
    pred_muac = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = muac_wfhz_feat_fl_rdm$median_prop_wfhz,
      known_prop_muac = muac_wfhz_feat_fl_rdm$median_prop_muac,
      .for = "muac"
    ),
    pred_wfhz_ratio = prev_muac * muac_wfhz_feat_fl_ratio_rdm$median_wfhz_muac,
    abs_error = get_absolute_percent_error(prev_wfhz, pred_wfhz),
    abs_ratio = get_absolute_percent_error(prev_wfhz, pred_wfhz_ratio),
    raw_error = pred_wfhz - prev_wfhz,
    raw_error_ratio = pred_wfhz_ratio - prev_wfhz,
    .by = surv_id
  )

### Estimate model accuracy: MAE and MAPE ----
  muac_wfhz_fl_rdm_model_accuracy <- muac_wfhz_pred_fl_rdm |> 
    summarise(
      mae = mae(actual = prev_wfhz, predicted = pred_wfhz),
      ratio_mae = mae(actual = prev_wfhz, predicted = pred_wfhz_ratio),
      mape = mape(actual = prev_wfhz, predicted = pred_wfhz) * 100,
      ratio_mape = mape(actual = prev_wfhz, predicted = pred_wfhz_ratio) * 100,
    )

# ============================  End of Workflow ================================