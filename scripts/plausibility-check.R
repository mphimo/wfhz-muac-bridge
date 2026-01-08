# ==============================================================================
#                             PLAUSIBILITY CHECK
# ==============================================================================


## ---- Plausibility Check WFHZ ------------------------------------------------

pl_wfhz <- .data |> 
  mw_plausibility_check_wfhz(
    sex = sex,
    age = age, 
    weight = weight,
    height = height, 
    flags = flag_wfhz,
    surv_id
  ) |> 
  mw_neat_output_wfhz()


## ---- Plausibility Check MFAZ ------------------------------------------------

pl_mfaz <- .data |> 
  mutate(muac = recode_muac(muac, "cm")) |> 
  mw_plausibility_check_mfaz(
    sex = sex,
    muac = muac,
    age = age, 
    flags = flag_mfaz,
    surv_id
  ) |> 
  mw_neat_output_mfaz()


## ---- Find faulty survey IDs as in `pl_mfaz` ---------------------------------

flawless <- pl_mfaz |> 
  mutate(
    faulty = ifelse(
      `Class. of age ratio` == "Problematic" | `Class. of standard dev` == "Problematic", 
      "yes", "no"
    )
  ) |> 
  filter(faulty == "no") |> 
  pull(Surv_id)
