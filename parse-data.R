
library(readxl)
library(tidyr)
library(dplyr)

# A Function to clean up an excel annual crime report file.
clean_crime_report <- function(yr) {
  file <- paste0('./rawdata/Community Crime ', yr, '.xlsx')
  dd <- read_excel(file, sheet=paste0(yr)) %>%
    rename(crime = 'Crime Classes') %>%
    gather(neighbourhood, incidents, -crime) %>%
    mutate(year = yr)
}

# as of June 2019, these years are covered by crime reports. 2019 includes incomplete data. (ie. < 12 months)
years <- 2007:2018

# looping through each crime report and cleaning it using the function noted above.
ll <- lapply(
  years,
  clean_crime_report
)
names(ll) <- years

# collects all crime reports into a single data.frame
all_data <- bind_rows(ll)

# Export data to CSV for each annual crime report.
export_clean_crime_report <- function(df, year) {
  write.csv(df, paste0('./data/crime_report_', year, '.csv'), row.names=FALSE)
}
lapply(years, function(x) export_clean_crime_report(ll[[as.character(x)]], x))

# Export the full data.frame for all years.
write.csv(all_data, './data/regina_crime_reports.csv', row.names=FALSE)
