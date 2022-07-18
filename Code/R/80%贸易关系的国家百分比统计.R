rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("合并数据-80%贸易重量的国家百分比.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
  Year = c(1990:2019),
  Proportion = c
);df
p <- ggplot(df, aes(x=Year, y=Proportion,group=1))+
  geom_line(size=1,color='blue')+geom_point(size=2,color='blue')+ylab('Proportion')+
  scale_y_continuous(labels = scales::percent_format())
p1<-p +theme_classic()+ theme(axis.text = element_text(size=15,color = "black"),
                              axis.title = element_text(size = 20))
p1
ggsave(filename = "合并数据贸易重量的国家百分比统计1.pdf",plot=p1,
       path='E:/Plastic/代码/R/保存图',width=10,height=5)