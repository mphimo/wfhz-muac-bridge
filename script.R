# ==============================================================================
#
# ==============================================================================

## ---- Load project-specific libraries ----------------------------------------

library(cyphr)
library(dplyr)
library(tidyr)
library(mwana)
library(rsample)
library(lubridate)

## ---- Retrieve secret key ----------------------------------------------------

key <- data_key(".", Sys.getenv("path_secret_key"))

## ---- Load project-specific functions ----------------------------------------

for (i in list.files("R", full.names = TRUE)) source(i)

## ---- Read data --------------------------------------------------------------

source("scripts/read-data.R")

## ---- Data Wrangling ---------------------------------------------------------

source("scripts/data-wrangling.R")

## ---- Data Plausibility Check ------------------------------------------------

source("scripts/plausibility-check.R")

## ---- Split feature extraction and testing sets ------------------------------

source("scripts/split-feature-extract-testing-sets.R")

## ---- Extract insights from the feature extraction set -----------------------

source("scripts/extract-features-in-flawless-surveys-muac.R")
source("scripts/extract-features-in-flawless-surveys-mfaz.R")
source("scripts/extract-features-in-faulty-surveys-muac.R")
source("scripts/extract-features-in-faulty-surveys-mfaz.R")

## ---- Model ------------------------------------------------------------------

source("scripts/model-flawless-data-muac.R")
source("scripts/model-flawless-data-mfaz.R")
source("scripts/model-faulty-data-muac.R")
source("scripts/model-faulty-data-mfaz.R")


# ============================  End of Workflow ================================
