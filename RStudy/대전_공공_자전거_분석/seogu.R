rm(list=ls())
library(ggmap)
seogu<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터 특강/seo.csv")
cent<-c(mean(seogu$lon),mean(seogu$lat))
attach(seogu)

bmap<- ggmap(get_googlemap(center = cent, zoom=12, maptype = "roadmap"))+
  geom_point(data=seogu, aes(x=lon, y=lat, colour=new, size=1),size=2)
print(bmap)
