rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("四阶段-平均路径长度.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
  Year = c(rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019))),
  cluster = c,
  type=c(rep("GPRMTN",times=30),rep("GPSTN",times=30),rep("GPPTN",times=30),rep("GSPTN",times=30))
);df
p <- ggplot(df, aes(x=Year, y=cluster,color=type))+xlab("Year")+
  ylab("Average path length")+geom_point(size=2,aes(shape=type,color=type))+
  geom_smooth(se=FALSE)

p1<-p + theme(axis.text = element_text(size=18,color = "black",vjust = 0.5,hjust = 0.5),
              axis.title = element_text(size = 24,vjust = 0.5,hjust = 0.5),
              panel.background=element_rect(fill="transparent",color="black"),
              panel.border = element_rect(fill = "transparent",color = "black"))
p1
ggsave(filename = "四阶段-平均路径长度.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=10,height=5)
