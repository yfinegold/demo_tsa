###################################################################
#######             Analyzing BFAST Spatial                 ####### 
#######            Scripts by Yelena Finegold               #######       
#######        contact: yelena.finegold@fao.org             ####### 
#######             Script 1: Download data                 ####### 
###################################################################

############### DOWNLOAD WORKSHOP DATA
wkdir <- "~/demo_BFAST_20180315/"
if(!dir.exists(wkdir)){dir.create(wkdir, recursive = T)}
setwd(wkdir)


system("wget https://www.dropbox.com/s/5bjdxq3hx5fdzab/data_tsa.zip?dl=0")
system("mv data_tsa.zip?dl=0 data_tsa.zip" )

system("unzip data_tsa.zip" )
system("rm data_tsa.zip" )

############### SET WORKING ENVIRONMENT
setwd("~/demo_BFAST_20180315/data_tsa/")
rootdir <- paste0(getwd(),"/")

