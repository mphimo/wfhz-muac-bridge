# ==============================================================================
#                       PREDICT WASTING BY WFHZ FROM MUAC 
# ==============================================================================

## ---- Test whether insights lead to accurate predictions ---------------------

### Time-based split ----
muac_wfhz_pred_flt_time <-  muac_wfhz_flt_test_time |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_muac = mean(gam_muac, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev =  prev_muac, 
      known_prop_wfhz = muac_wfhz_feat_flt_time$median_prop_wfhz, 
      known_prop_muac = muac_wfhz_feat_flt_time$median_prop_muac,
      .for = "wfhz"
    ),
    pred_muac = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = muac_wfhz_feat_flt_time$median_prop_wfhz,
      known_prop_muac = muac_wfhz_feat_flt_time$median_prop_muac,
      .for = "muac"
    ),
    pred_wfhz_ratio = prev_muac * muac_wfhz_feat_flt_ratio_time$median_wfhz_muac,
    bias_wfhz = pred_wfhz - prev_wfhz,
    bias_wfhz_ratio = pred_wfhz_ratio - prev_wfhz,
    bias_muac = pred_muac - prev_muac,
    .by = surv_id
  )


### Random-based split ----
muac_wfhz_pred_flt_rdm <- muac_wfhz_flt_test_rdm |> 
  summarise(
    n = n(),
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE) * 100,
    prev_muac = mean(gam_muac, na.rm = TRUE) * 100,
    pred_wfhz = predict_prevalence(
      obs_prev = prev_muac, 
      known_prop_wfhz = muac_wfhz_feat_flt_rdm$median_prop_wfhz, 
      known_prop_muac = muac_wfhz_feat_flt_rdm$median_prop_muac,
      .for = "wfhz"
    ),
    pred_muac = predict_prevalence(
      obs_prev = prev_wfhz, 
      known_prop_wfhz = muac_wfhz_feat_flt_rdm$median_prop_wfhz,
      known_prop_muac = muac_wfhz_feat_flt_rdm$median_prop_muac,
      .for = "muac"
    ),
    pred_wfhz_ratio = prev_muac * muac_wfhz_feat_flt_ratio_rdm$median_wfhz_muac,
    bias_wfhz = pred_wfhz - prev_wfhz,
    bias_wfhz_ratio = pred_wfhz_ratio - prev_wfhz,
    bias_muac = pred_muac - prev_muac,
    .by = surv_id
  )

# ============================  End of Workflow ================================