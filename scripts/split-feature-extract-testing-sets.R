# ==============================================================================
#             SPLIT DATA INTO FEATURE EXTRACTION AND TESTING SETS
# ==============================================================================


## ---- MUAC -------------------------------------------------------------------


### Filter out faulty data ----
muac_wfhz_fl_data <- muac_wfhz_data |> 
  filter(surv_id %in% flawless_surv) |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))


### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
muac_wfhz_fl_split_extest_time <- initial_time_split(muac_wfhz_fl_data, prop = 0.80)
muac_wfhz_fl_ex_time <- training(muac_wfhz_fl_split_extest_time)
muac_wfhz_fl_test_time <- testing(muac_wfhz_fl_split_extest_time)

#### Purely random-based split ----
muac_wfhz_fl_split_extest_rdm <- initial_split(muac_wfhz_fl_data, prop = 0.80)
muac_wfhz_fl_ex_rdm <- training(muac_wfhz_fl_split_extest_rdm)
muac_wfhz_fl_test_rdm <- testing(muac_wfhz_fl_split_extest_rdm)

### Keep all data ----
muac_wfhz_flt_data <- muac_wfhz_data |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))

### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
muac_wfhz_flt_split_extest_time <- initial_time_split(muac_wfhz_flt_data, prop = 0.80)
muac_wfhz_flt_ex_time <- training(muac_wfhz_flt_split_extest_time)
muac_wfhz_flt_test_time <- testing(muac_wfhz_flt_split_extest_time)

#### Purely random-based split ----
muac_wfhz_flt_split_extest_rdm <- initial_split(muac_wfhz_flt_data, prop = 0.80)
muac_wfhz_flt_ex_rdm <- training(muac_wfhz_flt_split_extest_rdm)
muac_wfhz_flt_test_rdm <- testing(muac_wfhz_flt_split_extest_rdm)


## ---- MFAZ -------------------------------------------------------------------


### Filter out faulty data ----
mfaz_wfhz_fl_data <- mfaz_wfhz_data |> 
  filter(surv_id %in% flawless_surv) |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))

### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
mfaz_wfhz_fl_split_extest_time <- initial_time_split(mfaz_wfhz_fl_data, prop = 0.80)
mfaz_wfhz_fl_ex_time <- training(mfaz_wfhz_fl_split_extest_time)
mfaz_wfhz_fl_test_time <- testing(mfaz_wfhz_fl_split_extest_time)

#### Purely random-based split ----
mfaz_wfhz_fl_split_extest_rdm <- initial_split(mfaz_wfhz_fl_data, prop = 0.80)
mfaz_wfhz_fl_ex_rdm <- training(mfaz_wfhz_fl_split_extest_rdm)
mfaz_wfhz_fl_test_rdm <- testing(mfaz_wfhz_fl_split_extest_rdm)

### Keep all data ----
mfaz_wfhz_flt_data <- mfaz_wfhz_data |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))

### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
mfaz_wfhz_flt_split_extest_time <- initial_time_split(mfaz_wfhz_flt_data, prop = 0.80)
mfaz_wfhz_flt_ex_time <- training(mfaz_wfhz_flt_split_extest_time)
mfaz_wfhz_flt_test_time <- testing(mfaz_wfhz_flt_split_extest_time)

#### Purely random-based split ----
mfaz_wfhz_flt_split_extest_rdm <- initial_split(mfaz_wfhz_flt_data, prop = 0.80)
mfaz_wfhz_flt_ex_rdm <- training(mfaz_wfhz_flt_split_extest_rdm)
mfaz_wfhz_flt_test_rdm <- testing(mfaz_wfhz_flt_split_extest_rdm)


# ============================  End of Workflow ================================