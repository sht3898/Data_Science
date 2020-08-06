install.packages("ggmap")
library(ggmap)
newt<-read.csv("F:/내 문서/대외활동/빅데이터 특강/newtassu.csv")
cent<-c(mean(newt$lon),mean(newt$lat))
attach(newt)

bmap<- ggmap(get_googlemap(center = cent, zoom=11, maptype = "roadmap"))+
  geom_point(data=newt, aes(x=lon, y=lat, colour="red"),size=2)
print(bmap)
?colours
