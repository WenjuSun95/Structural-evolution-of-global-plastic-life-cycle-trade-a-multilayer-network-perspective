rm(list = ls())
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("四阶段贸易总量统计.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c

library(ggplot2)
df <- data.frame(
  year = c(rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019)),rep(seq(1990,2019))),
  weight = c,
  type = c (rep("GPRMTN",times=30),rep("GPSTN",times=30),rep("GPPTN",times=30),
            rep("GSPTN",times=30))
);df
p <- ggplot(df, aes(x=year, y=weight,color=type,fill=type))+xlab("Year")+ylab("Unit 10^8 t") +geom_line()+geom_area()+xlim(1990,2019)+ylim(0,20)
p
p1<-p + theme(axis.text = element_text(size=15,vjust = 0.5,hjust = 0.5,color = "black"),
              axis.title = element_text(size = 20,vjust = 0.5,hjust = 0.5),
              panel.background=element_rect(fill="transparent",color="black"),
              panel.border = element_rect(fill = "transparent",color = "black"),
              legend.key=element_rect(fill="transparent",color="transparent"),
              legend.title = element_text(size = 15),
              legend.text = element_text(size = 13))+scale_color_manual(values=c("#ffb6b9","#fff5b7","#62d9ad","#663399"))+scale_fill_manual(values=c("#ffb6b9","#fff5b7","#62d9ad","#663399"))
p1
ggsave(filename = "四个阶段塑料贸易量.pdf",plot=p1,path='E:/Plastic/代码/R/保存图',width=8,height=5)
