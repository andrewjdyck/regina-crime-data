
# library(xlsx)
library(readxl)
library(reshape2)
library(tidyr)
library(dplyr)

# url <- 'https://onedrive.live.com/redir?resid=FE3A0D85D07DBDF%21710&authkey=%21AMW9Zq9BJ2pxsrI&page=View'

clean_crime_report <- function(year) {
  file <- paste0('./rawdata/Community Crime ', year, '.xlsx')
  dd <- read_excel(file, sheet=paste0(year)) %>%
    rename(crime = 'Crime Classes') %>%
    gather(neighbourhood, incidents, -crime)
}

years <- 2007:2019

ll <- lapply(
  years,
  clean_crime_report
)
names(ll) <- years

all_data <- bind_rows(ll)

# Export data to CSV
export_clean_crime_report <- function(df, year) {
  write.csv(df, paste0('./data/crime_report_', year, '.csv'), row.names=FALSE)
}

lapply(years, function(x) export_clean_crime_report(ll[[as.character(x)]], x))

