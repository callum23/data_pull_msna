
# Title           : Download data directly from the KOBO humanitarian response. 
# Version         : v1
# Date Mofified   : 10/06/2020
# Description     : Find the form ID
#                 : Directly attaching the data into R


# Packages
library(tidyverse)
library(lubridate)
library(readxl)
library(httr)
library(devtools)


# 1) Locate raw file in the github.
source_url("https://raw.githubusercontent.com/ppsapkota/kobohr_apitoolbox/master/R/r_func_ps_kobo_utils.R")

# 2) Download form/project list
kobo_user <- "" # kobo user account name as string (example "nnkbuser")
kobo_pw <- "" # password for kobo user account as string (example "nnkbpassword")

# 3) This is getting your 6 figure codes for each of your forms.
url <-"https://kc.humanitarianresponse.info/api/v1/data.csv"
d_formlist_csv <- kobohr_getforms_csv(url,kobo_user, kobo_pw)
d_formlist_csv <- as.data.frame(d_formlist_csv)

# 4 Get data from a dataset
# within the d_formlist_csv you will find a column called url. Select the survey you want to download and make it a vector calling it url
url <-"https://kc.humanitarianresponse.info/api/v1/data/540431.csv"
raw_data <- kobohr_getdata_csv(url,kobo_user,kobo_pw)
raw_data <- as.data.frame(d_raw_Yobe)

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# Code Functional : yes | however should not be used for very very large datasets.

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
