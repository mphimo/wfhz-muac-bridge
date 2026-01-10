# ==============================================================================
#                  FEATURE EXTRACTION IN FLAWLESS SURVEYS: MUAC
# ==============================================================================


## ---- From time-based feature extraction set ---------------------------------


### Median based on the proportion of wasting ----
muac_feat_fl_time <- muac_fl_ex_time |> 
  estimate_burden_of_wasting(
    cgam = cgam,
    gam_wfhz = gam_wfhz,
    gam_muac = gam_muac,
    .by = surv_id
  ) |> 
  summarise(
    median_prop_wfhz = median(prop_wasting_by_wfhz),
    IQR_prop_wfhz = IQR(prop_wasting_by_wfhz),
    median_prop_muac = median(prop_wasting_by_muac),
    IQR_prop_muac = IQR(prop_wasting_by_muac)
  )

### Median based on the ratio between wasting WFHZ and MUAC ----
muac_feat_fl_ratio_time <- muac_fl_ex_time |> 
  summarise(
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE),
    prev_muac = mean(gam_muac, na.rm = TRUE),
    ratio = prev_wfhz / prev_muac, 
    .by = surv_id
  ) |> 
  summarise(median_wfhz_muac = median(ratio))


## ---- From random-based feature extraction set -------------------------------


### Median based on the proportion of wasting ----
muac_feat_fl_rdm <- muac_fl_ex_rdm |> 
  estimate_burden_of_wasting(
    cgam = cgam,
    gam_wfhz = gam_wfhz,
    gam_muac = gam_muac,
    .by = surv_id
  ) |> 
    summarise(
    median_prop_wfhz = median(prop_wasting_by_wfhz),
    IQR_prop_wfhz = IQR(prop_wasting_by_wfhz),
    median_prop_muac = median(prop_wasting_by_muac),
    IQR_prop_muac = IQR(prop_wasting_by_muac)
  )

### Median based on the ratio between wasting WFHZ and MUAC ----
muac_feat_fl_ratio_rdm <- muac_fl_ex_rdm |> 
  summarise(
    prev_wfhz = mean(gam_wfhz, na.rm = TRUE),
    prev_muac = mean(gam_muac, na.rm = TRUE),
    ratio = prev_wfhz / prev_muac, 
    .by = surv_id
  ) |> 
  summarise(median_wfhz_muac = median(ratio))


# ============================  End of Workflow ================================