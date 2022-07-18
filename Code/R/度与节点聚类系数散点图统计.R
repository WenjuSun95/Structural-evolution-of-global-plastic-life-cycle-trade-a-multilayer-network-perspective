#1990
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data0<-read.csv("1990.csv")
data0
degree0<-data0$degree
degree1<-matrix(degree0)
degree2<-as.vector(degree1)
degree2
cluster0<-data0$clustering
cluster1<-matrix(cluster0)
cluster2<-as.vector(cluster1)
cluster2

df0<-data.frame(
  Degree=degree2,
  Clustering=cluster2
);df0
library(ggplot2)
p1 <- ggplot(df0, aes(x=degree2, y=cluster2))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1990")
p1 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1991
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data1<-read.csv("1991.csv")
data1
degree3<-data1$degree
degree4<-matrix(degree3)
degree5<-as.vector(degree4)
degree5
cluster3<-data1$clustering
cluster4<-matrix(cluster3)
cluster5<-as.vector(cluster4)
cluster5

df1<-data.frame(
  Degree=degree5,
  Clustering=cluster5
);df1
library(ggplot2)
p2<- ggplot(df1, aes(x=degree5, y=cluster5))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1991")
p2 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1992
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data2<-read.csv("1992.csv")
data2
degree6<-data2$degree
degree7<-matrix(degree6)
degree8<-as.vector(degree7)
degree8
cluster6<-data2$clustering
cluster7<-matrix(cluster6)
cluster8<-as.vector(cluster7)
cluster8

df2<-data.frame(
  Degree=degree8,
  Clustering=cluster8
);df2
library(ggplot2)
p3 <- ggplot(df2, aes(x=degree8, y=cluster8))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1992")
p3 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1993
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data3<-read.csv("1993.csv")
data
degree9<-data3$degree
degree10<-matrix(degree9)
degree11<-as.vector(degree10)
degree11
cluster9<-data3$clustering
cluster10<-matrix(cluster9)
cluster11<-as.vector(cluster10)
cluster11

df3<-data.frame(
  Degree=degree11,
  Clustering=cluster11
);df3
library(ggplot2)
p4 <- ggplot(df3, aes(x=degree11, y=cluster11))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1993")
p4 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1994
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data4<-read.csv("1994.csv")
data4
degree12<-data4$degree
degree13<-matrix(degree12)
degree14<-as.vector(degree13)
degree14
cluster12<-data4$clustering
cluster13<-matrix(cluster12)
cluster14<-as.vector(cluster13)
cluster14

df4<-data.frame(
  Degree=degree14,
  Clustering=cluster14
);df4
library(ggplot2)
p5 <- ggplot(df4, aes(x=degree14, y=cluster14))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1994")
p5 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1995
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data5<-read.csv("1995.csv")
data5
degree15<-data5$degree
degree16<-matrix(degree15)
degree17<-as.vector(degree16)
degree17
cluster15<-data5$clustering
cluster16<-matrix(cluster15)
cluster17<-as.vector(cluster16)
cluster17

df5<-data.frame(
  Degree=degree17,
  Clustering=cluster17
);df5
library(ggplot2)
p6 <- ggplot(df5, aes(x=degree17, y=cluster17))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1995")
p6 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1996
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data6<-read.csv("1996.csv")
data6
degree18<-data6$degree
degree19<-matrix(degree18)
degree20<-as.vector(degree19)
degree20
cluster18<-data6$clustering
cluster19<-matrix(cluster18)
cluster20<-as.vector(cluster19)
cluster20

df6<-data.frame(
  Degree=degree20,
  Clustering=cluster20
);df6
library(ggplot2)
p7 <- ggplot(df6, aes(x=degree20, y=cluster20))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1996")
p7 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1997
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data7<-read.csv("1997.csv")
data7
degree21<-data7$degree
degree22<-matrix(degree21)
degree23<-as.vector(degree22)
degree23
cluster21<-data7$clustering
cluster22<-matrix(cluster21)
cluster23<-as.vector(cluster22)
cluster23

df7<-data.frame(
  Degree=degree23,
  Clustering=cluster23
);df7
library(ggplot2)
p8 <- ggplot(df7, aes(x=degree23, y=cluster23))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1997")
p8 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1998
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data8<-read.csv("1998.csv")
data8
degree24<-data8$degree
degree25<-matrix(degree24)
degree26<-as.vector(degree25)
degree26
cluster24<-data8$clustering
cluster25<-matrix(cluster24)
cluster26<-as.vector(cluster25)
cluster26

df8<-data.frame(
  Degree=degree26,
  Clustering=cluster26
);df8
library(ggplot2)
p9 <- ggplot(df8, aes(x=degree26, y=cluster26))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1998")
p9 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#1999
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data9<-read.csv("1999.csv")
data9
degree27<-data9$degree
degree28<-matrix(degree27)
degree29<-as.vector(degree28)
degree29
cluster27<-data9$clustering
cluster28<-matrix(cluster27)
cluster29<-as.vector(cluster28)
cluster29

df9<-data.frame(
  Degree=degree29,
  Clustering=cluster29
);df9
library(ggplot2)
p10 <- ggplot(df9, aes(x=degree29, y=cluster29))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("1999")
p10 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2000
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data10<-read.csv("2000.csv")
data10
degree30<-data10$degree
degree31<-matrix(degree30)
degree32<-as.vector(degree31)
degree32
cluster30<-data10$clustering
cluster31<-matrix(cluster30)
cluster32<-as.vector(cluster31)
cluster32

df10<-data.frame(
  Degree=degree32,
  Clustering=cluster32
);df10
library(ggplot2)
p11 <- ggplot(df10, aes(x=degree32, y=cluster32))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2000")
p11 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2001
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data11<-read.csv("2001.csv")
data11
degree33<-data11$degree
degree34<-matrix(degree33)
degree35<-as.vector(degree34)
degree35
cluster33<-data11$clustering
cluster34<-matrix(cluster33)
cluster35<-as.vector(cluster34)
cluster35

df11<-data.frame(
  Degree=degree35,
  Clustering=cluster35
);df11
library(ggplot2)
p12 <- ggplot(df11, aes(x=degree35, y=cluster35))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2001")
p12 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2002
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data12<-read.csv("2002.csv")
data12
degree36<-data12$degree
degree37<-matrix(degree36)
degree38<-as.vector(degree37)
degree38
cluster36<-data12$clustering
cluster37<-matrix(cluster36)
cluster38<-as.vector(cluster37)
cluster38

df12<-data.frame(
  Degree=degree38,
  Clustering=cluster38
);df12
library(ggplot2)
p13 <- ggplot(df12, aes(x=degree38, y=cluster38))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2002")
p13 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2003
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data13<-read.csv("2003.csv")
data13
degree39<-data13$degree
degree40<-matrix(degree39)
degree41<-as.vector(degree40)
degree41
cluster39<-data13$clustering
cluster40<-matrix(cluster39)
cluster41<-as.vector(cluster40)
cluster41

df13<-data.frame(
  Degree=degree41,
  Clustering=cluster41
);df13
library(ggplot2)
p14 <- ggplot(df13, aes(x=degree41, y=cluster41))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2003")
p14 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2004
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data14<-read.csv("2004.csv")
data14
degree42<-data14$degree
degree43<-matrix(degree42)
degree44<-as.vector(degree43)
degree44
cluster42<-data14$clustering
cluster43<-matrix(cluster42)
cluster44<-as.vector(cluster43)
cluster44

df14<-data.frame(
  Degree=degree44,
  Clustering=cluster44
);df14
library(ggplot2)
p15 <- ggplot(df14, aes(x=degree44, y=cluster44))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2004")
p15 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2005
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data15<-read.csv("2005.csv")
data15
degree45<-data15$degree
degree46<-matrix(degree45)
degree47<-as.vector(degree46)
degree47
cluster45<-data15$clustering
cluster46<-matrix(cluster45)
cluster47<-as.vector(cluster46)
cluster47

df15<-data.frame(
  Degree=degree47,
  Clustering=cluster47
);df15
library(ggplot2)
p16 <- ggplot(df15, aes(x=degree47, y=cluster47))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2005")
p16 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2006
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data16<-read.csv("2006.csv")
data16
degree48<-data16$degree
degree49<-matrix(degree48)
degree50<-as.vector(degree49)
degree50
cluster48<-data16$clustering
cluster49<-matrix(cluster48)
cluster50<-as.vector(cluster49)
cluster50

df16<-data.frame(
  Degree=degree50,
  Clustering=cluster50
);df16
library(ggplot2)
p17 <- ggplot(df16, aes(x=degree50, y=cluster50))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2006")
p17 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2007
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data17<-read.csv("2007.csv")
data17
degree51<-data17$degree
degree52<-matrix(degree51)
degree53<-as.vector(degree52)
degree53
cluster51<-data17$clustering
cluster52<-matrix(cluster51)
cluster53<-as.vector(cluster52)
cluster53

df17<-data.frame(
  Degree=degree53,
  Clustering=cluster53
);df17
library(ggplot2)
p18 <- ggplot(df17, aes(x=degree53, y=cluster53))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2007")
p18 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2008
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data18<-read.csv("2008.csv")
data18
degree54<-data18$degree
degree55<-matrix(degree54)
degree56<-as.vector(degree55)
degree56
cluster54<-data18$clustering
cluster55<-matrix(cluster54)
cluster56<-as.vector(cluster55)
cluster56

df18<-data.frame(
  Degree=degree56,
  Clustering=cluster56
);df18
library(ggplot2)
p19 <- ggplot(df18, aes(x=degree56, y=cluster56))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2008")
p19 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2009
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data19<-read.csv("2009.csv")
data19
degree57<-data19$degree
degree58<-matrix(degree57)
degree59<-as.vector(degree58)
degree59
cluster57<-data19$clustering
cluster58<-matrix(cluster57)
cluster59<-as.vector(cluster58)
cluster59

df19<-data.frame(
  Degree=degree59,
  Clustering=cluster59
);df19
library(ggplot2)
p20 <- ggplot(df19, aes(x=degree59, y=cluster59))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2009")
p20 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2010
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data20<-read.csv("2010.csv")
data20
degree60<-data20$degree
degree61<-matrix(degree60)
degree62<-as.vector(degree61)
degree62
cluster60<-data20$clustering
cluster61<-matrix(cluster60)
cluster62<-as.vector(cluster61)
cluster62

df20<-data.frame(
  Degree=degree62,
  Clustering=cluster62
);df20
library(ggplot2)
p21 <- ggplot(df20, aes(x=degree62, y=cluster62))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2010")
p21 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2011
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data21<-read.csv("2011.csv")
data21
degree63<-data21$degree
degree64<-matrix(degree63)
degree65<-as.vector(degree64)
degree65
cluster63<-data21$clustering
cluster64<-matrix(cluster63)
cluster65<-as.vector(cluster64)
cluster65

df21<-data.frame(
  Degree=degree65,
  Clustering=cluster65
);df21
library(ggplot2)
p22 <- ggplot(df21, aes(x=degree65, y=cluster65))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2011")
p22 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2012
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data22<-read.csv("2012.csv")
data22
degree66<-data22$degree
degree67<-matrix(degree66)
degree68<-as.vector(degree67)
degree68
cluster66<-data22$clustering
cluster67<-matrix(cluster66)
cluster68<-as.vector(cluster67)
cluster68

df22<-data.frame(
  Degree=degree68,
  Clustering=cluster68
);df22
library(ggplot2)
p23 <- ggplot(df22, aes(x=degree68, y=cluster68))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2012")
p23 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2013
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data23<-read.csv("2013.csv")
data23
degree69<-data23$degree
degree70<-matrix(degree69)
degree71<-as.vector(degree70)
degree71
cluster69<-data23$clustering
cluster70<-matrix(cluster69)
cluster71<-as.vector(cluster70)
cluster71

df23<-data.frame(
  Degree=degree71,
  Clustering=cluster71
);df23
library(ggplot2)
p24 <- ggplot(df23, aes(x=degree71, y=cluster71))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2013")
p24 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2014
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data24<-read.csv("2014.csv")
data24
degree72<-data24$degree
degree73<-matrix(degree72)
degree74<-as.vector(degree73)
degree74
cluster72<-data24$clustering
cluster73<-matrix(cluster72)
cluster74<-as.vector(cluster73)
cluster74

df24<-data.frame(
  Degree=degree74,
  Clustering=cluster74
);df24
library(ggplot2)
p25 <- ggplot(df24, aes(x=degree74, y=cluster74))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2014")
p25 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2015
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data25<-read.csv("2015.csv")
data25
degree75<-data25$degree
degree76<-matrix(degree75)
degree77<-as.vector(degree76)
degree77
cluster75<-data25$clustering
cluster76<-matrix(cluster75)
cluster77<-as.vector(cluster76)
cluster77

df25<-data.frame(
  Degree=degree77,
  Clustering=cluster77
);df25
library(ggplot2)
p26 <- ggplot(df25, aes(x=degree77, y=cluster77))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2015")
p26 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2016
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data26<-read.csv("2016.csv")
data26
degree78<-data26$degree
degree79<-matrix(degree78)
degree80<-as.vector(degree79)
degree80
cluster78<-data26$clustering
cluster79<-matrix(cluster78)
cluster80<-as.vector(cluster79)
cluster80

df26<-data.frame(
  Degree=degree80,
  Clustering=cluster80
);df26
library(ggplot2)
p27 <- ggplot(df26, aes(x=degree80, y=cluster80))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2016")
p27 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2017
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data27<-read.csv("2017.csv")
data27
degree81<-data27$degree
degree82<-matrix(degree81)
degree83<-as.vector(degree82)
degree83
cluster81<-data27$clustering
cluster82<-matrix(cluster81)
cluster83<-as.vector(cluster82)
cluster83

df27<-data.frame(
  Degree=degree83,
  Clustering=cluster83
);df27
library(ggplot2)
p28 <- ggplot(df27, aes(x=degree83, y=cluster83))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2017")
p28 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2018
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data28<-read.csv("2018.csv")
data28
degree84<-data28$degree
degree85<-matrix(degree84)
degree86<-as.vector(degree85)
degree86
cluster84<-data28$clustering
cluster85<-matrix(cluster84)
cluster86<-as.vector(cluster85)
cluster86

df28<-data.frame(
  Degree=degree86,
  Clustering=cluster86
);df28
library(ggplot2)
p29 <- ggplot(df28, aes(x=degree86, y=cluster86))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2018")
p29 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))
#2019
setwd("E:/Plastic/合并数据/合并数据-30年国家与度的数据")
getwd()
data29<-read.csv("2019.csv")
data29
degree87<-data29$degree
degree88<-matrix(degree87)
degree89<-as.vector(degree88)
degree89
cluster87<-data29$clustering
cluster88<-matrix(cluster87)
cluster89<-as.vector(cluster88)
cluster89

df29<-data.frame(
  Degree=degree89,
  Clustering=cluster89
);df29
library(ggplot2)
p30 <- ggplot(df29, aes(x=degree89, y=cluster89))  +geom_point(size =1)+xlim(0,300)+xlab("Degree")+ylab("Clustering")+ggtitle("2019")
p30 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14),plot.title = element_text(hjust = 0.5))

library(ggpubr)
list1<-list(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30)
ggarrange(plotlist = list1,ncol=5,nrow=6)

