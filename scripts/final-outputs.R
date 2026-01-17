### Bind ----
stacked_accuracy <- bind_rows(
  "muac_wfhz_fl_time"  = muac_wfhz_fl_time_model_accuracy,
  "muac_wfhz_fl_rdm"   = muac_wfhz_fl_rdm_model_accuracy,
  "mfaz_wfhz_fl_time"  = mfaz_wfhz_fl_time_model_accuracy,
  "mfaz_wfhz_fl_rdm"   = mfaz_wfhz_fl_rdm_model_accuracy,
  "muac_wfhz_flt_time" = muac_wfhz_flt_time_model_accuracy,
  "muac_wfhz_flt_rdm"  = muac_wfhz_flt_rdm_model_accuracy,
  "mfaz_wfhz_flt_time" = mfaz_wfhz_flt_time_model_accuracy,
  "mfaz_wfhz_flt_rdm"  = mfaz_wfhz_flt_rdm_model_accuracy,
  .id = "model"
)
