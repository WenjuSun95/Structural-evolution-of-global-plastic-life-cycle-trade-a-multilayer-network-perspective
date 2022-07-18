rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("合并数据-R^2.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
  Year = c(1990:2019),
  cluster = c
);df
p <- ggplot(df, aes(x=Year, y=cluster)) + geom_line(size=1,color='Blue') +geom_point(size = 2,color='Blue')+ylab('R^2')+ylim(0,1)
p1<-p + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14))
p1
ggsave(filename = "合并数据-R^2统计.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=10,height=5)

