
# Title           : Download data directly from the KOBO humanitarian response. 
# Developer       : Cal Pearson
# Email           : callum-pearson@outlook.com
# Version         : v1
# Date Mofified   : 10/06/2020
# Modified by who : Cal Pearson
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

# Plug in your 6 figure code of the form you want to take data from.  

# 6) Download data in CSV format
form_id_Yobe <- 560411 # id of the deployed project Yobe
form_id_Adamawa <- 560407 # id of the deployed project Adamawa
form_id_Borno <- 560409 # id of the deployed project Borno
# remember you need to put the number at the end .csv of the code below.
# In this case its 553863.csv


# 6.1 Get data for Yobe form
url_Yobe <-"https://kc.humanitarianresponse.info/api/v1/data/560411.csv"
d_raw_Yobe <- kobohr_getdata_csv(url_Yobe,kobo_user,kobo_pw)
d_raw_Yobe <- as.data.frame(d_raw_Yobe)

# 6.2 Get data for Adamawa form
url_Adamawa <-"https://kc.humanitarianresponse.info/api/v1/data/560407.csv"
d_raw_Adamawa <- kobohr_getdata_csv(url_Adamawa,kobo_user,kobo_pw)
d_raw_Adamawa <- as.data.frame(d_raw_Adamawa)

# 6.3 Get data for Borno form
url_Borno <-"https://kc.humanitarianresponse.info/api/v1/data/560409.csv"
d_raw_Borno <- kobohr_getdata_csv(url_Borno,kobo_user,kobo_pw)
d_raw_Borno <- as.data.frame(d_raw_Borno)

# 7) Bind them in one single dataset.
complete_raw <- as.tibble(full_join(d_raw_Yobe,d_raw_Adamawa,d_raw_Borno))

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# Code Functional : yes | however should not be used for very very large datasets.

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
