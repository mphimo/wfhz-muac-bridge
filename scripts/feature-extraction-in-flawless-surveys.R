# ==============================================================================
#                     FEATURE EXTRACTION IN FLAWLESS SURVEYS
# ==============================================================================


## ---- Filter out faulty surveys from the dataset -----------------------------

flawless_data <- .data |> 
  filter(surv_id %in% flawless_surv) |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))


## ---- Split feature extraction and testing sets ------------------------------

### Time-based split: take the first prop for feature extraction set ----
split_FextrTest_yr <- initial_time_split(flawless_data, prop = 0.80)
Fextr_flawless_yr <- training(split_FextrTest_yr)
Test_flawless_yr <- testing(split_FextrTest_yr)

### Purely random-based split ----
split_FextTest_rd <- initial_split(flawless_data, prop = 0.80)
Fextr_flawless_rd <- training(split_FextTest_rd)
Test_flawless_rd <- testing(split_FextTest_rd)


# ============================  End of Workflow ================================