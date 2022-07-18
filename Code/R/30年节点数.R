setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("节点数.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
	year = c(1990:2019,1990:2019),
	Nv = c,
	type = c (rep("original",times=30),rep("merge",times=30))
	);df
p<-ggplot(df, aes(x=year, y=Nv, color=type)) + geom_smooth(size=3,se=FALSE) +geom_point(size=3) 
p+theme(axis.text.x = element_text(size = 14),axis.text.y = element_text(size=14))
