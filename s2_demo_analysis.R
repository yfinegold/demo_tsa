###################################################################
#######             Analyzing BFAST Spatial                 ####### 
#######            Scripts by Yelena Finegold               #######       
#######        contact: yelena.finegold@fao.org             ####### 
#######             Script 2: Analyze data                  ####### 
###################################################################

## test BFAST
## load libraries
options(stringsAsFactors = FALSE)
packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

# clean GIZ data and extract variables
packages(zoo)
packages(raster)
packages(rgdal)
packages(dplyr)
packages(ggpubr)

# set the working directory
rootdir <- '~/demo_BFAST_20180315/data_tsa/'
setwd(rootdir)
rootdir <- paste0(getwd(),"/")

fielddata <- read.csv(paste0(wd,'demo_inventory_data.csv'))
# check first 6 lines of the data
head(fielddata)
# convert to a spatial points dataframe
coordinates(fielddata) <- ~X + Y
# assign projection
crs(fielddata) <- CRS("+init=epsg:4326")
# plot the data to get the points
plot(fielddata)
# get the names all the tif files in the folder
files <- list.files(path=wd, pattern="tif$", full.names=TRUE) 
# stack all of the tif files using r raster library
s <- stack(files)
# extract the values from raster stack.
ext <- extract(s, fielddata)
fielddata_extracted <- cbind(fielddata,ext)
plot(fielddata_extracted$NDMI_example_2.2, fielddata_extracted$Number.of.illegal.cuts)
plot(fielddata_extracted@data$NDVI_example_2.2, fielddata_extracted@data$Tree.DBH.at.1.3m..cm.)


ggscatter(merged, x = "average_tree_dbh", y = "EVI_example_2.2", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Average DBH", ylab = "EVI magnitude")


ggscatter(merged, x = "average_tree_dbh", y = "NDVI_example_2.2", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Average DBH", ylab = "NDVI magnitude")

# add option to runBFAST spatial
