rm(list = ls())
showtext_auto()  # 全局自动使用
setwd("E:/Plastic/代码/R/txt")
getwd()
c1 <- read.table("排名前十国家统计_年份.txt")
c2 <- as.matrix(c1)
c <- as.vector(c2);c
c3 <- read.table("排名前十国家统计_Consumption_export.txt")
c4 <- as.matrix(c3)
c5 <- as.vector(c4);c5
library(ggplot2)
library(ggbreak)
library(showtext) # 加载包
library(sysfonts) # 加载包
df <- data.frame(
  year = c,	
  density = c5,	
  type = c (rep("CHN",times=30),rep("FRA",times=30),rep("USA",times=30),
            rep("DEU",times=30),rep("IND",times=30),rep("VNM",times=30),
            rep("ZAF",times=30),rep("TUR",times=30),rep("ITA",times=30),
            rep("NLD",times=30))
);df
p <- ggplot(df, aes(x=year, y=density,color=type))+xlab("Year")+ylab("Rank") +
  geom_line(size=1.5)+geom_point(size=3) +scale_y_reverse(limits = c(20, 1))
p
p1<-p + theme(axis.text.x = element_text(family = "myFont1",size=15,color = "black"),
              axis.text.y = element_text(family = "myFont1",size=15,color = "black"),
              axis.title.x = element_text(family = "myFont1",size=18,color = "black"),
              axis.title.y = element_text(family = "myFont1",size=18,color = "black"),
              legend.position = "bottom",
              legend.key.size=unit(10,"mm"),
              legend.text = element_text(family = "myFont1",size=14))
p1
windows()  # 手动打开图形设备
print(p1)

ggsave(filename = "Consumption_export.pdf",path='E:/Plastic/Figure 6/',width=10,height=8)
showtext_auto(FALSE) # 不在需要就关闭

