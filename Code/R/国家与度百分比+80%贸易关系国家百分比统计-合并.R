rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
# windowsFonts(myFont = windowsFont("Times New Roman"))
c1 <- read.table("四阶段-贸易关系国家比率统计.txt")
c2 <- as.matrix(c1)
c0 <- as.vector(c2);c0
c3<-read.table("四阶段-度比率统计.txt")
c4<-as.matrix(c3)
c<-as.vector(c4);c
library(ggplot2)
df <- data.frame(
  countries = c0,
  degree = c,
  type = c (rep("GPRMTN",times=225),rep("GPSTN",times=230),rep("GPPTN",times=230),
            rep("GSPTN",times=202))
);df
p <- ggplot(df, aes(x=countries, y=degree,color=type))+xlab("Percentage of countries")+ylab("Percentage of weight")+geom_line(size=1)
p
p1<-p +theme(axis.text = element_text(size=15,vjust = 0.5,hjust = 0.5,color = "black"),
              axis.title = element_text(size = 20,vjust = 0.5,hjust = 0.5),
             panel.background=element_rect(fill="transparent",color="black"),
             panel.border = element_rect(fill = "transparent",color = "black"),
             legend.key=element_rect(fill="transparent",color="transparent"),
             legend.position = c(1,0),
             legend.justification = c(1,0),
             legend.title = element_text(size = 15),
             legend.text = element_text(size = 13))
p1
# ggsave(filename = "国家与度百分比.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=10,height=5)

# legend.margin = unit(0,'mm'),
# c5 <- read.table("四阶段-80%贸易关系的国家百分比.txt")
# c6 <- as.matrix(c5)
# c7 <- as.vector(c6);c7
# library(ggplot2)
# df1 <- data.frame(
#   Year = c(rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019))),
#   type = c (rep("GPPTN",times=30),rep("GPSTN",times=30),rep("GPRMTN",times=30),
#             rep("GSPTN",times=30)),
#   Proportion = c7
# );df1
# p2 <- ggplot(df1, aes(x=Year, y=Proportion,color=type,fill=type))+geom_area(position = "identity")+geom_line()+ylab('Proportion')+scale_y_continuous(labels = scales::percent_format())
# p3<-p2 +theme(axis.text= element_text(size=15,vjust = 0.5,hjust = 0.5,color = "black"),
#                axis.title = element_text(size = 20,vjust = 0.5,hjust = 0.5),
#               panel.background=element_rect(fill="transparent",color="black"),
#               panel.border = element_rect(fill = "transparent",color = "black"))
# p3
# library(ggpubr)
# p4<-list(p1,p3)
# 
# p5<-ggarrange(plotlist = p4,ncol=2,nrow=1)
# p5
# ggsave(filename = "国家与权重百分比贸易重量的国家百分比.pdf",plot=p5,path='E:/Plastic/代码/R/保存图',width=20,height=6)

