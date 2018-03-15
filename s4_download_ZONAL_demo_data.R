###################################################################
#######             Analyzing BFAST Spatial                 ####### 
#######            Scripts by Yelena Finegold               #######       
#######        contact: yelena.finegold@fao.org             ####### 
#######             Script 1: Download data                 ####### 
###################################################################

############### DOWNLOAD WORKSHOP DATA
wkdir <- "~/demo_zonal_20180315/"
if(!dir.exists(wkdir)){dir.create(wkdir, recursive = T)}
setwd(wkdir)


system("wget https://www.dropbox.com/s/52qgb5no2l3f10g/zonal_data.zip?dl=0")
system("mv zonal_data.zip?dl=0 data_tsa.zip" )

system("unzip zonal_data.zip" )
system("rm zonal_data.zip" )

############### SET WORKING ENVIRONMENT
setwd("~/demo_zonal_20180315/zonal_data/")
rootdir <- paste0(getwd(),"/")

