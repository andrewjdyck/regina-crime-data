# Regina Crime Data

A repository of open data on crime from the Regina Police.

## Source
All data contained in /rawdata/ is downloaded from the Regina Police website (http://reginapolice.ca/resources/crime/crime-statistics/crime-map/) as of June 2019. 

At this time, the data is stored by the Regina Police on a could server in MS Excel format and downloaded to the repository. Future development of this repo could pull data dynamically using an example url such as: https://onedrive.live.com/redir?resid=FE3A0D85D07DBDF%21710&authkey=%21AMW9Zq9BJ2pxsrI&page=View.

## Parsing

See Parse-data.R for any data manipulation that is done. The intent behind any data manipulation is solely to tidy it up for analysis purposes.

## Export

Crime data is exported as separate CSV files for each calendar year with the number of incidents categoried by crime class and broken down by neighbourhood.

