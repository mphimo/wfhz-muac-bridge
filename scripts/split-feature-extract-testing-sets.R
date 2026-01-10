# ==============================================================================
#             SPLIT DATA INTO FEATURE EXTRACTION AND TESTING SETS
# ==============================================================================


## ---- MUAC -------------------------------------------------------------------


### Filter out faulty data ----
muac_fl_data <- muac_data |> 
  filter(surv_id %in% flawless_surv) |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))


### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
muac_fl_split_extest_time <- initial_time_split(muac_fl_data, prop = 0.80)
muac_fl_ex_time <- training(muac_fl_split_extest_time)
muac_fl_test_time <- testing(muac_fl_split_extest_time)

#### Purely random-based split ----
muac_fl_split_extest_rdm <- initial_split(muac_fl_data, prop = 0.80)
muac_fl_ex_rdm <- training(muac_fl_split_extest_rdm)
muac_fl_test_rdm <- testing(muac_fl_split_extest_rdm)

### Keep all data ----
muac_flt_data <- muac_data |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))

### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
muac_flt_split_extest_time <- initial_time_split(muac_flt_data, prop = 0.80)
muac_flt_ex_time <- training(muac_flt_split_extest_time)
muac_flt_test_time <- testing(muac_flt_split_extest_time)

#### Purely random-based split ----
muac_flt_split_extest_rdm <- initial_split(muac_flt_data, prop = 0.80)
muac_flt_ex_rdm <- training(muac_flt_split_extest_rdm)
muac_flt_test_rdm <- testing(muac_flt_split_extest_rdm)


## ---- MFAZ -------------------------------------------------------------------


### Filter out faulty data ----
mfaz_fl_data <- mfaz_data |> 
  filter(surv_id %in% flawless_surv) |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))

### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
mfaz_fl_split_extest_time <- initial_time_split(mfaz_fl_data, prop = 0.80)
mfaz_fl_ex_time <- training(mfaz_fl_split_extest_time)
mfaz_fl_test_time <- testing(mfaz_fl_split_extest_time)

#### Purely random-based split ----
mfaz_fl_split_extest_rdm <- initial_split(mfaz_fl_data, prop = 0.80)
mfaz_fl_ex_rdm <- training(mfaz_fl_split_extest_rdm)
mfaz_fl_test_rdm <- testing(mfaz_fl_split_extest_rdm)

### Keep all data ----
mfaz_flt_data <- mfaz_data |> 
  select(surv_id, year, cluster, contains(c("flag", "am")))

### Split data ----
#### Time-based split: take the first prop for feature extraction set ----
mfaz_flt_split_extest_time <- initial_time_split(mfaz_flt_data, prop = 0.80)
mfaz_flt_ex_time <- training(mfaz_flt_split_extest_time)
mfaz_flt_test_time <- testing(mfaz_flt_split_extest_time)

#### Purely random-based split ----
mfaz_flt_split_extest_rdm <- initial_split(mfaz_flt_data, prop = 0.80)
mfaz_flt_ex_rdm <- training(mfaz_flt_split_extest_rdm)
mfaz_flt_test_rdm <- testing(mfaz_flt_split_extest_rdm)


# ============================  End of Workflow ================================