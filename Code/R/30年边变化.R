setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("边数.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
	year = c(1990:2019),
	Ne = c,
	type = c (rep("original",times=30))
	);df
p <- ggplot(df, aes(x=year, y=Ne, color=type)) + geom_smooth(size = 3,se=FALSE) +geom_point(size = 3)
p + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14))


setwd("E:/Plastic/代码/R/txt")
getwd()
c3<-read.table("边数80%.txt")
c4<-as.matrix(c3)
c0<-as.vector(c4)
c0
library(ggplot2)
df1<-data.frame(
  year =c(1990:2019),
  Ne=c0,
  type=c(rep("merge",times=30))
)
df1
p1<-ggplot(df1,aes(x=year,y=Ne,color=type))+geom_point(size=3)+geom_line()
p1+theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size = 14) )

library(ggpubr)
ggarrange(p,p1,ncol = 2,nrow = 1)
