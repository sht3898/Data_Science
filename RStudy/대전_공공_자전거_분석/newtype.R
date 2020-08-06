rm(list=ls())
library(ggmap)
newtype<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/newtype.csv")
cent<-c(mean(newtype$lon),mean(newtype$lat))
attach(newtype)

bmap<- ggmap(get_googlemap(center = cent, zoom=11, maptype = "roadmap"))+
  geom_point(data=newtype, aes(x=lon, y=lat, colour=type, size=1),size=2)
print(bmap)
