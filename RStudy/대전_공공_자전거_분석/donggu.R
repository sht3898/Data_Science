rm(list=ls())
library(ggmap)
donggu<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/dong.csv")
cent<-c(mean(donggu$lon),mean(donggu$lat))
attach(donggu)

bmap<- ggmap(get_googlemap(center = cent, zoom=12, maptype = "roadmap"))+
  geom_point(data=donggu, aes(x=lon, y=lat,colour=new,size=1),size=3)
print(bmap)
