##############################################################
######## USER PARAMETERS
##############################################################
#  enter the directory where the time series is downloaded
time_series_dir <- '~/downloads/time-series-2018-03-15-1133/'
# specify the beginning of the historical period and monitoring period
historical_year_beg <- 2014
monitoring_year_beg <- 2017

# after running the below click on the map in the plot tab 
# to show the time series for one pixel
##############################################################
######## SCRIPT RUNS FROM HERE
##############################################################
result <- list.files(path=time_series_dir, pattern = "_threshold.tif$", recursive = TRUE)
TSstack <- paste0(time_series_dir,'/1/stack.vrt')
dates <- paste0(time_series_dir,'/1/dates.csv')
## BFAST pixel on the output
plot(raster(result))
pixelResult = bfmPixel(
  TSstack,
  dates = dates,
  history = c(historical_year_beg, 1),
  start = c(monitoring_year_beg, 1),
  interactive= TRUE,
  # cell = 17000, # Can be tricky to pick a cell that got data
  plot = TRUE
)
