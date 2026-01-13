# ==============================================================================
#                       PREDICT WASTING BY WFHZ FROM MFAZ 
# ==============================================================================

## ---- Test whether insights lead to accurate predictions ---------------------

### Time-based split ----
mfaz_wfhz_pred_fl_time <- mfaz_wfhz_fl_test_time |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_mfaz = mean(gam_mfaz, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev =  prev_mfaz, 
      known_prop_wfhz = mfaz_wfhz_feat_fl_time$median_prop_wfhz, 
      known_prop_muac = mfaz_wfhz_feat_fl_time$median_prop_mfaz,
      .for = "wfhz"
    ),
    pred_mfaz = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = mfaz_wfhz_feat_fl_time$median_prop_wfhz,
      known_prop_muac = mfaz_wfhz_feat_fl_time$median_prop_mfaz,
      .for = "muac"
    ),
    pred_wfhz_ratio = prev_mfaz * mfaz_wfhz_feat_fl_ratio_time$median_wfhz_mfaz,
    bias_wfhz = pred_wfhz - prev_wfhz,
    bias_wfhz_ratio = pred_wfhz_ratio - prev_wfhz,
    bias_mfaz = pred_mfaz - prev_mfaz,
    .by = surv_id
  )

### Random-based split ----
mfaz_wfhz_pred_fl_rdm <- mfaz_wfhz_fl_test_rdm |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_mfaz = mean(gam_mfaz, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev =  prev_mfaz, 
      known_prop_wfhz = mfaz_wfhz_feat_fl_rdm$median_prop_wfhz, 
      known_prop_muac = mfaz_wfhz_feat_fl_rdm$median_prop_mfaz,
      .for = "wfhz"
    ),
    pred_mfaz = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = mfaz_wfhz_feat_fl_rdm$median_prop_wfhz,
      known_prop_muac = mfaz_wfhz_feat_fl_rdm$median_prop_mfaz,
      .for = "muac"
    ),
    pred_wfhz_ratio = prev_mfaz * mfaz_wfhz_feat_fl_ratio_rdm$median_wfhz_mfaz,
    bias_wfhz = pred_wfhz - prev_wfhz,
    bias_wfhz_ratio = pred_wfhz_ratio - prev_wfhz,
    bias_mfaz = pred_mfaz - prev_mfaz,
    .by = surv_id
  )


# ============================  End of Workflow ================================