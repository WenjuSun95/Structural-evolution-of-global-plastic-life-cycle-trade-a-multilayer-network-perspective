rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("合并数据-国家比率统计.txt")
c2 <- as.matrix(c1)
c0 <- as.vector(c2);c0
c3<-read.table("合并数据-权重比率统计.txt")
c4<-as.matrix(c3)
c<-as.vector(c4);c
library(ggplot2)
df <- data.frame(
  countries = c0,
  degree = c,
  type = c (rep("1990",times=191),rep("2000",times=227),rep("2010",times=230),
            rep("2019",times=231))
);df
p <- ggplot(df, aes(x=countries, y=degree, color=type))+xlab("Percentage of countries")+ylab("Percentage of weight") + geom_line(size =2)
p1<-p + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14)
          ,legend.position = c(1,0),legend.justification = c(1,0),legend.margin = unit(0,'mm')
          )
p1
ggsave(filename = "合并数据-国家与权重比率统计.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=10,height=5)