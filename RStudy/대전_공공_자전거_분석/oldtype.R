rm(list=ls())
library(ggmap)
oldtype<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/oldtype.csv")
cent<-c(mean(oldtype$lon),mean(oldtype$lat))
attach(oldtype)

bmap<- ggmap(get_googlemap(center = cent, zoom=11, maptype = "roadmap"))+
  geom_point(data=oldtype, aes(x=lon, y=lat, colour=type, size=1),size=2)
print(bmap)
