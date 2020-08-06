rm(list=ls())
library(ggmap)
yuseonggu<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/yuseong.csv")
cent<-c(mean(yuseonggu$lon),mean(yuseonggu$lat))
attach(yuseonggu)

bmap<- ggmap(get_googlemap(center = cent, zoom=12, maptype = "roadmap"))+
  geom_point(data=yuseonggu, aes(x=lon, y=lat, colour=new, size=1),size=2)
print(bmap)
