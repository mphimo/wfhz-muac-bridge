# ==============================================================================
#                     FEATURE EXTRACTION IN FAULTY SURVEYS
# ==============================================================================


## ---- Filter out faulty surveys from the dataset -----------------------------

faulty_data <- .data |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))


## ---- Split feature extraction and testing sets ------------------------------

### Time-based split: take the first prop for feature extraction set ----
split_faulty_FextrTest_time <- initial_time_split(faulty_data, prop = 0.80)
Fextr_faulty_time <- training(split_faulty_FextrTest_time)
Test_faulty_time <- testing(split_faulty_FextrTest_time)

### Purely random-based split ----
split_faulty_FextTest_random <- initial_split(faulty_data, prop = 0.80)
Fextr_faulty_random <- training(split_faulty_FextTest_random)
Test_faulty_random <- testing(split_faulty_FextTest_random)


## ---- Extract features -------------------------------------------------------

### In time-based feature extraction set ----
features_faulty_time <- Fextr_faulty_time |> 
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

### in Random-based feature extraction set ----
features_faulity_random <- Fextr_faulty_random |> 
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

# ============================  End of Workflow ================================