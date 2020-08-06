rm(list=ls())##기존 저장 데이터 삭제
library(ggmap)
newtype<-read.csv("C:/Users/sht3898/Desktop/대외활동/빅데이터2/finaljung.csv")##파일 이름을 각 구로 바꾸면됨
cent<-c(mean(newtype$lon),mean(newtype$lat))
attach(newtype)

bmap<- ggmap(get_googlemap(center = cent, zoom=12, maptype = "roadmap"))+
  geom_point(data=newtype, aes(x=lon, y=lat, colour=newtype, size=1),size=2)##colour가 나누고 싶은 기준
print(bmap)
