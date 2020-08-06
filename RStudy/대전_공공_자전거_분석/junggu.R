rm(list=ls())
library(ggmap)
junggu<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/jung.csv")
cent<-c(mean(junggu$lon),mean(junggu$lat))
attach(junggu)

bmap<- ggmap(get_googlemap(center = cent, zoom=12, maptype = "roadmap"))+
  geom_point(data=junggu, aes(x=lon, y=lat, colour=new, size=1),size=3)
print(bmap)
