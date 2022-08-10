# rm(list = ls())
setwd("E:/Plastic/代码/R")
getwd()
library("circlize")
library("ggsci")
library("comtradr")
library("jsonlite")
library("tidyverse")
library("ggmap")
library("gridExtra")
library("readxl")
library("callr")
library("ggrepel")
library("scales")
library("randomcoloR")
library("conflicted")
library("signal")
library("igraph")

nc<-read.csv("node_coordinate.csv",header = TRUE)
node_coordinate<-as.matrix(nc)

fle<-read_xlsx("four_layer_edges.xlsx")
four_layer_edges<-as.matrix(fle)

# set the line size
# if :weight>=6×10^9:line_size=2
#else if: weight>=2.7×10^9:line_size=1.5
#else if :weight>=10^9:line_size=1
# else :line_size=0.5
for(i in 1:dim(four_layer_edges)[1]){
  if(as.numeric(four_layer_edges[i,"weight"])>=110000000000){
    four_layer_edges[i,"line_size"]=2
  }
  else if(as.numeric(four_layer_edges[i,"weight"])>=50000000000){
    four_layer_edges[i,"line_size"]=1.5
  }
  else if(as.numeric(four_layer_edges[i,"weight"])>=10000000000){
    four_layer_edges[i,"line_size"]=1
  }else{
    four_layer_edges[i,"line_size"]=0.8
  }
}

# 把数据切成4层
Raw_material=four_layer_edges[1:10,]
Semifinished_product=four_layer_edges[11:20,]
Plastic_product=four_layer_edges[21:30,]
Plastic_waste=four_layer_edges[31:40,]


node_coordinate1=data.frame(lon=as.numeric( node_coordinate[,1]),lat=as.numeric(node_coordinate[,2]),
                  name=node_coordinate[,3],stringsAsFactors = FALSE)
rownames(node_coordinate1)=NULL

Raw_material1=data.frame(from = Raw_material[,1], to = Raw_material[,2], 
                  weight =as.numeric(Raw_material[,3]),stringsAsFactors = FALSE,layer=Raw_material[,4],
                  line_color=Raw_material[,5],curve=as.numeric(Raw_material[,6]),
                  line_size=as.numeric(Raw_material[,7]))

Semifinished_product1=data.frame(from = Semifinished_product[,1], to = Semifinished_product[,2], 
                             weight =as.numeric(Plastic_product[,3]),stringsAsFactors = FALSE,layer=Semifinished_product[,4],
                             line_color=Semifinished_product[,5],curve=as.numeric(Semifinished_product[,6]),
                             line_size=as.numeric(Semifinished_product[,7]))

Plastic_product1=data.frame(from = Plastic_product[,1], to = Plastic_product[,2], 
                             weight =as.numeric(Plastic_product[,3]),stringsAsFactors = FALSE,layer=Plastic_product[,4],
                             line_color=Plastic_product[,5],curve=as.numeric(Plastic_product[,6]),
                             line_size=as.numeric(Plastic_product[,7]))

Plastic_waste1=data.frame(from = Plastic_waste[,1], to = Plastic_waste[,2], 
                             weight =as.numeric(Plastic_waste[,3]),stringsAsFactors = FALSE,layer=Plastic_waste[,4],
                             line_color=Plastic_waste[,5],curve=as.numeric(Plastic_waste[,6]),
                             line_size=as.numeric(Plastic_waste[,7]))
# 为了画图做准备
Raw_material1_plot <- Raw_material1 %>%
  inner_join(node_coordinate1 %>% dplyr::select(name,lon,lat), by = c('from' = 'name')) %>%
  rename(x = lon, y = lat) %>%
  inner_join(node_coordinate1 %>% dplyr::select(name, lon, lat), by = c('to' = 'name')) %>%
  rename(xend = lon, yend = lat)

Semifinished_product1_plot <- Semifinished_product1 %>%
  inner_join(node_coordinate1 %>% dplyr::select(name,lon,lat), by = c('from' = 'name')) %>%
  rename(x = lon, y = lat) %>%
  inner_join(node_coordinate1 %>% dplyr::select(name, lon, lat), by = c('to' = 'name')) %>%
  rename(xend = lon, yend = lat)

Plastic_product1_plot <- Plastic_product1 %>%
  inner_join(node_coordinate1 %>% dplyr::select(name,lon,lat), by = c('from' = 'name')) %>%
  rename(x = lon, y = lat) %>%
  inner_join(node_coordinate1 %>% dplyr::select(name, lon, lat), by = c('to' = 'name')) %>%
  rename(xend = lon, yend = lat)

Plastic_waste1_plot <- Plastic_waste1 %>%
  inner_join(node_coordinate1 %>% dplyr::select(name,lon,lat), by = c('from' = 'name')) %>%
  rename(x = lon, y = lat) %>%
  inner_join(node_coordinate1 %>% dplyr::select(name, lon, lat), by = c('to' = 'name')) %>%
  rename(xend = lon, yend = lat)

## prepare the map
maptheme <- theme(panel.grid = element_blank()) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.title = element_blank()) +
  theme(legend.position = "bottom") +
  theme(panel.grid = element_blank()) +
  theme(panel.background = element_rect(fill = "#dbdee0")) +
  theme(plot.margin = unit(c(0.1, 0.1, 0.1, 0.1), 'cm'))

country_shapes <- geom_polygon(aes(x = long, y = lat, group = group),
                               data = map_data('world'),
                               fill = "#CECECE", color = "#515151",size = 0.15)
mapcoords <- coord_fixed(xlim = c(-180, 180), ylim = c(-50, 100))

## ggplot 
countryplot=ggplot(node_coordinate1)

countryplot= countryplot+country_shapes


# CountryPlot=CountryPlot+scale_size_continuous(guide = FALSE, range = c(0.5, 2))


countryplot=countryplot+ geom_text_repel(data = node_coordinate1,aes(x = lon, y = lat, label = name),color="black",size=3,nudge_x = 1,nudge_y =1, fontface = "bold")
countryplot=countryplot+mapcoords 
countryplot=countryplot+ maptheme
countryplot=countryplot+geom_curve(data = Raw_material1_plot,aes(x = x, y = y, xend = xend, yend = yend,color=layer),
                                   # color = "red",
                                   alpha = 0.9, curvature = 0.15,angle =60, 
                                   ncp=10,linetype=1,size=Raw_material1_plot$line_size,
                                   arrow = arrow(angle = 10,length = unit(0.2,"inches"),type="closed"))+
  geom_curve(data = Semifinished_product1_plot,aes(x = x, y = y, xend = xend, yend = yend,color=layer),#color="blue",
             alpha = 0.9, curvature = 0.3,angle =60, 
             ncp=10,linetype=1,size=Semifinished_product1_plot$line_size,
             arrow = arrow(angle = 10,length = unit(0.2,"inches"),type="closed"))+
  geom_curve(data = Plastic_product1_plot,aes(x = x, y = y, xend = xend, yend = yend,color=layer),
             #color="green",
             alpha = 0.9, curvature = 0.45,angle =60, 
             show.legend=TRUE,ncp=10,linetype=1,size=Plastic_product1_plot$line_size,
             arrow = arrow(angle = 10,length = unit(0.2,"inches"),type="closed"))+
  geom_curve(data = Plastic_waste1_plot,aes(x = x, y = y, xend = xend, yend = yend,color=layer),
             #color="purple",
             alpha = 0.9, curvature = 0.6,angle =60, 
             show.legend=TRUE,ncp=10,linetype=1,size=Plastic_waste1_plot$line_size,
             arrow = arrow(angle = 10,length = unit(0.2,"inches"),type="closed"))
countryplot=countryplot+
  geom_point(data = node_coordinate1,aes(x = lon, y = lat),size=3,fill="#00477D", stroke = 0.5,shape=21,color="white")

ggsave(filename = "World_map_30年合并.pdf",plot=countryplot,path='E:/Plastic/代码/R/保存图',width=10,height=5)
