rm(list = ls())
setwd("E:/Plastic/Consumption/1990-2019年进出口贸易量（每个国家）/")
getwd()

dt<-read.csv("USA.csv", header=T)
dt
year1<-dt$year
import<-dt$import
export<-dt$export
h<-c(import,export)
h
year2<-c(year1,year1)
year2
library(ggplot2)
df <- data.frame(
  year = year2,
  weight = h,
  type = c (rep("Import",times=30),rep("Export",times=30))
);df
p<-ggplot(df, aes(x = year, y = weight, fill = type)) + geom_bar(position = "dodge", stat = "identity")
p
ggsave(filename = "1990-2019USA进出口.pdf",plot=p,path='E:/Plastic/代码/R/保存图/Consumption-进出口排名前十的国家')

