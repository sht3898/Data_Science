rm(list=ls())
library(ggmap)
daedeok<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/daedeok.csv")
cent<-c(mean(daedeok$lon),mean(daedeok$lat))
attach(daedeok)

bmap<- ggmap(get_googlemap(center = cent, zoom=12, maptype = "roadmap"))+
  geom_point(data=daedeok, aes(x=lon, y=lat, colour=new, size=1),size=3)
print(bmap)
