rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("四阶段合并-平均聚类系数.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
library(ggplot2)
df <- data.frame(
  Year = c(rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019))),
  cluster = c,
  type=c(rep("GPRMTN",times=30),rep("GPSTN",times=30),rep("GPPTN",times=30),rep("GSPTN",times=30))
);df
p <- ggplot(df, aes(x=Year, y=cluster,color=type))+xlab("Year")+
  ylab("Average clustering coefficient")+geom_point(size=2,aes(shape=type,color=type))+
  geom_smooth(se=FALSE)

p1<-p + theme(axis.text = element_text(size=18,color = "black",vjust = 0.5,hjust = 0.5),
              axis.title = element_text(size = 24,vjust = 0.5,hjust = 0.5),
              legend.position = c(0.98,0.02),legend.justification = c(0.98,0.02),
              panel.background=element_rect(fill="transparent",color="black"),
              panel.border = element_rect(fill = "transparent",color = "black"))
p1

c3 <- read.table("合并数据-R^2.txt")
c4 <- as.matrix(c3)
c5 <- as.vector(c4);c5
library(ggplot2)
df1 <- data.frame(
  Year = c(1990:2019),
  cluster = c5
);df
p2 <- ggplot(df1, aes(x=Year, y=cluster)) + geom_line(size=1,color='Blue') +geom_point(size = 2,color='Blue')+ylab('R^2')+ylim(0.5,1)
p3<-p2 +theme(axis.text = element_text(size=18,vjust = 0.5,hjust = 0.5,color = "black"),
              axis.title = element_text(size = 24,vjust = 0.5,hjust = 0.5),
              panel.background=element_rect(fill="transparent",color="black"),
              panel.border = element_rect(fill = "transparent",color = "black"))
p3
library(ggpubr)
p4<-list(p1,p3)

p5<-ggarrange(plotlist = p4,ncol=2,nrow=1)
p5
ggsave(filename = "四阶段合并-平均聚类系数+R^2.pdf",plot=p5,path='E:/Plastic/代码/R/保存图',width=18,height=6)

