# ==============================================================================
#                     FEATURE EXTRACTION IN FLAWLESS SURVEYS
# ==============================================================================


## ---- Filter out faulty surveys from the dataset -----------------------------

flawless_data <- .data |> 
  filter(surv_id %in% flawless_surv) |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))


## ---- Split feature extraction and testing sets ------------------------------

### Time-based split: take the first prop for feature extraction set ----
split_flawless_FextrTest_time <- initial_time_split(flawless_data, prop = 0.80)
Fextr_flawless_time <- training(split_flawless_FextrTest_time)
Test_flawless_time <- testing(split_flawless_FextrTest_time)

### Purely random-based split ----
split_flawless_FextTest_random <- initial_split(flawless_data, prop = 0.80)
Fextr_flawless_random <- training(split_flawless_FextTest_random)
Test_flawless_random <- testing(split_flawless_FextTest_random)


## ---- Extract features -------------------------------------------------------

### In time-based feature extraction set ----
features_flawless_time <- Fextr_flawless_time |> 
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
features_flawless_random <- Fextr_flawless_random |> 
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