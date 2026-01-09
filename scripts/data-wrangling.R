# ==============================================================================
#                              DATA WRANGLING
# ==============================================================================


## ---- Fill all NA's in `survdate` with values from previous cell -------------

data <- surveys |> 
  fill(
    survdate, 
    .direction = "updown"
  ) |> 
  mutate(
    survdate = ymd(as.Date(survdate, format = "%d/%m/%Y")), #date forwat is untidy; used year instead.
    year = year(survdate), 
    year = case_match(year,
      c(2204, 2240, 2034, 2040, 2012, 2014) ~ 2024,
      c(2030, 2203) ~ 2023,
      c(2028, 2005, 2026) ~ 2025,
      .default = year
    ), 
    year = ifelse(year == "2020" & surv_id == "13", 2023, year),
    year = ifelse(year == "2020" & surv_id == "65", 2024, year)
  )

## ---- Compute z-scores -------------------------------------------------------

### Weight-for-height ----
data <- data |> 
  mw_wrangle_wfhz(
    sex = sex,
    weight = weight,
    height = height, 
    .recode_sex = TRUE,
    .decimals = 3
  )

### MUAC ----
data <- data |> 
  mw_wrangle_age(age = age) |> 
  mw_wrangle_muac(
    sex = sex, 
    .recode_sex = FALSE,
    muac = muac,
    .recode_muac = TRUE,
    .to = "cm",
    age = age,
    .decimals = 3
  )


## ---- Define wasting ---------------------------------------------------------

### Combined case definition ----
data <- data |> 
    mutate(
    muac = recode_muac(muac, "mm")
  ) |> 
  define_wasting(
    zscores = wfhz,
    muac = muac,
    oedema = NULL,
    .by = "combined"
  )

### Wasting case-definition by WFHZ ----
  data <- data |> define_wasting(
    zscores = wfhz,
    .by = "zscores"
  ) |> 
  rename(
    gam_wfhz = gam,
    sam_wfhz = sam,
    mam_wfhz = mam
  )

### Wasting case-definition by MUAC ----
data <- data |> 
  define_wasting(
    muac = muac,
    .by = "muac"
  ) |> 
  rename(
    gam_muac = gam, 
    sam_muac = sam, 
    mam_muac = mam
  )


## ---- Filter out outliers by both WFHZ and MFAZ ------------------------------

.data <- data |> 
  mutate(
    cflags = ifelse(flag_wfhz == 1 | flag_mfaz == 1, 1, 0)
  ) |> 
  filter(cflags != 1)

# ============================  End of Workflow ================================