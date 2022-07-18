rm(list = ls())
setwd("E:/Plastic")
getwd()

dt<-read.csv("Waste management-coordinate.csv", header=T)
dt
visit.x<-dt$long
visit.y<-dt$lat
N<-dt$label

library(ggplot2)
library(ggmap)
library(sp)
library(maptools)
library(maps)
mapworld<-borders("world",colour = "gray50",fill="white",lwd=0.4) #绘制基本地图

mp<-ggplot()+mapworld+ylim(-60,90)
mp
mp2<-mp+geom_point(aes(x=visit.x,y=visit.y),color="#d51600")+
  geom_text(aes(x=visit.x,y=visit.y,label=N),color="#d51600",size=3)
mp2
ggsave(filename = "Waste management-世界地图.pdf",plot=mp2,path='E:/Plastic/代码/R/保存图',width=12,height=6)
