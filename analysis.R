
# popn_url <- 'https://ckanprodstorage.blob.core.windows.net/opendata/NeighbourhoodServiceAreas/XLS/PopEstimatesByNHood.xls'

popn <- read_excel('./rawdata/PopEstimatesByNHood.xls')


# Merge data
dd <- ll[['2018']] %>%
  filter(crime == 'Total') %>%
  select(-Year, -crime) %>%
  mutate(neighbourhood = toupper(neighbourhood)) %>%
  left_join(popn, by=c('neighbourhood' = 'Nhood_name')) %>%
  select(neighbourhood, incidents, Total_pop)

