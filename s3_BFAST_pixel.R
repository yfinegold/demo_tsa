##############################################################
######## USER PARAMETERS
##############################################################
library(bfastSpatial)
#  enter the directory where the time series is downloaded
# use tab at the end of the line after time-series to autocomplete the next line
time_series_dir <- '~/downloads/time-series'
# specify the beginning of the historical period and monitoring period
historical_year_beg <- 2014
monitoring_year_beg <- 2017

# after running the below click on the map in the plot tab 
# to show the time series for one pixel
##############################################################
######## SCRIPT RUNS FROM HERE
##############################################################
result <- list.files(path=time_series_dir, pattern = "_threshold.tif", recursive = TRUE, full.names = T)
TSstack <- paste0(time_series_dir,'1/stack.vrt')
dates <- paste0(time_series_dir,'1/dates.csv')
## BFAST pixel on the output
plot(raster(result))
pixelResult = bfmPixel(
  brick(TSstack),
  dates = unlist(read.csv(dates)),
  start = c(historical_year_beg, 1),
  monend = c(monitoring_year_beg, 1),
  interactive= TRUE,
  # cell = 17000, # Can be tricky to pick a cell that got data
  plot = TRUE
)

