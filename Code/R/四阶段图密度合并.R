rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("四条密度曲线合并-年份.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c

c3 <- read.table("四条密度曲线-图密度.txt")
c4 <- as.matrix(c3)
c5 <- as.vector(c4);c5
library(ggplot2)
df <- data.frame(
  year = c,
  density = c5,
  type = c (rep("GPRMTN",times=30),rep("GPSTN",times=30),rep("GPPTN",times=30),
            rep("GSPTN",times=30))
);df
p <- ggplot(df, aes(x=year, y=density,color=type))+xlab("Year")+ylab("Density") +geom_line(size=1)+geom_point(size=2)
p
p1<-p + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),legend.position = "bottom",legend.key.size=unit(10,"mm"),legend.text = element_text(size=14))
p1
ggsave(filename = "四阶段密度曲线合并-图例在下方.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=10,height=5)