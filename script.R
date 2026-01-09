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

## ---- Read data --------------------------------------------------------------

source("scripts/read-data.R")

## ---- Data Wrangling ---------------------------------------------------------

source("scripts/data-wrangling.R")

## ---- Data Plausibility Check ------------------------------------------------

source("scripts/plausibility-check.R")

## ---- Extract insights from the feature extraction set -----------------------

source("scripts/feature-extraction-in-flawless-surveys.R")
source("scripts/feature-extraction-in-faulty-surveys.R")

