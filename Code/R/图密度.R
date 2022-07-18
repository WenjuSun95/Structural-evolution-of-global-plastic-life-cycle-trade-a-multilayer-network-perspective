rm(list=ls())

###############图密度统计
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("合并数据-图密度.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
	Year = c(1990:2019),
	Density = c,
	type = "original"
	);df
p3 <- ggplot(df, aes(x=Year, y=Density, color=type)) + geom_line(size = 1,color='blue') +geom_point(size = 2,color='blue')
p3 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14))
ggsave(filename = "合并数据-图密度.pdf",plot=p3,path='E:/Plastic/代码/R/保存图',width=10,height=5)

