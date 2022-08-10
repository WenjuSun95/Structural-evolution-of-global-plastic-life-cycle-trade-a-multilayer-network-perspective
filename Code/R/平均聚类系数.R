rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("合并数据-平均聚类系数.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
  Year = c(1990:2019),
  cluster = c
);df
p <- ggplot(df, aes(x=Year, y=cluster)) + geom_line(size=1,color='red') +geom_point(size = 2,color='red')+ylab('Average Clustering Coefficient')+ylim(0.65,0.85)
p1<-p + theme(axis.text = element_text(size=18,color="black",vjust=0.5,hjust=0.5),
              axis.title=element_text(size=24,vjust=0.5,hjust=0.5,color="black"),
              panel.background=element_rect(fill="transparent",color="black"),
              panel.border = element_rect(fill = "transparent",color = "black"))
p1
ggsave(filename = "合并数据-平均聚类系数统计.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=10,height=5)
