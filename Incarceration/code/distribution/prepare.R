
#code for tract level data

#libraries
library(readr)
library(tigris)
library(tidycensus)
library(dplyr)
library(readxl)

#reading the original data downloaded from prison policy
data_2020_tract <- read_excel("~/git/sdc.public_safety_dev/Incarceration/data/original/Incarceration_tract_2020.xlsx")

#converting to dataframe
data_2020_tract <- data.frame(data_2020_tract)

#Selecting required columns and changing it to our format
data_2020_df_tract <- data_2020_tract %>%
  select(FIPS, Incarceration_rate_per_100000) %>%
  mutate(
    geoid = FIPS,
    measure = "incarceration_rate_per_100000",
    year = 2020,
    value = Incarceration_rate_per_100000
  ) %>%
  select(geoid, measure, year, value)

#exporting the file
write.csv(data_2020_df_tract, "~/git/sdc.public_safety_dev/Incarceration/data/distribution/va_tr_2020_incarceration_rate.csv", row.names = FALSE)


#code for county level data

library(readr)
library(tigris)
library(tidycensus)
library(dplyr)


data_2020_county <- read_excel("~/incarceration/incarceration_county_2020.xlsx")

data_2020_county <- data.frame(data_2020_county)


data_2020_df_county <- data_2020_county %>%
  select(FIPS, Incarceration_rate_per_100000) %>%
  mutate(
    geoid = FIPS,
    measure = "incarceration_rate_per_100000",
    year = 2020,
    value = Incarceration_rate_per_100000
  ) %>%
  select(geoid, measure, year, value)

write.csv(data_2020_df_county, "~/git/sdc.public_safety_dev/Incarceration/data/distribution/va_ct_2020_incarceration_rate.csv", row.names = FALSE)



