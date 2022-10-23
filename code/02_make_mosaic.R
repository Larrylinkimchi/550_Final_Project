here::i_am("code/02_make_mosaic.R")
library(ggplot2)
library(here)
data <- readRDS(
  file = here::here("output/data_clean.rds")
  
)



par(mfrow=c(1,2)) # display the plots in 1 row and 2 columns
mosaic<-mosaicplot(bmi_level~ever_married, data=data, color=TRUE,main = "BMI Level for differnt martial status")

jpeg(here::here("output/mosaicplot.png"))
mosaicplot(bmi_level~ever_married, data=data, color=TRUE,main = "BMI Level for differnt martial status")
dev.off()