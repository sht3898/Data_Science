# 1.데이터 읽기 및 확인
short <- read.csv("C:\\Users\\HyunTaek\\Desktop\\study\\DoitR\\shorttrack\\shorttrack.csv", header = T)
head(short)

# 2.패키지 부착
library(dplyr) 
library(ggplot2)
library(readr)
library(tidyr)
library(repr)
library(plotly)

# 3.출발시간 분석
## 상위 10위 추출
short %>%
  arrange(time_lap1) %>%
  head(10) %>%
  select(Season, Series, City, Round, Name, Nationality, time_lap1, Time)


short1 <- short %>%
  filter(time_lap1 < 8 & Nationality %in%
           c("CAN", "KOR", "RUS", "HUN", "USA", "GBR", "KAZ", "NED", "ITA")) %>%
  drop_na()

options(repr.plot.width = 5.5, repr.plot.height = 4)

ggplot(short1, aes(Nationality, time_lap1))+
  geom_boxplot()+
  labs(title = "Distribution of Starting Time By Skaters Nationality")

# 4.데이터 형태 확인
table(short$Distance)
table(short$Nationality)

# 5.국가별 평균 총 시간분류
nation <- short %>%
  filter(!is.na(Time)) %>%
  group_by(Nationality) %>%
  summarise(time = mean(Time))
head(nation)

# 6.총 시간 기록 상위 10개국
top10 <- nation %>% 
  arrange(time) %>% 
  head(10)
top10

# 6-1.막대 그래프 만들기
ggplot(data = top10, aes(x=Nationality, y= time)) + 
  geom_col()+
  coord_flip(ylim=c(42,45))+
  scale_x_discrete(limits=rev(top10$Nationality)) # 역순 출력은 rev

# 7.총 시간 기록 하위 10개국
bottom10 <- nation %>%
  arrange(desc(time)) %>%
  head(10)
bottom10

# 7-1.막대 그래프 만들기
ggplot(data = bottom10, aes(x=Nationality, y= time))+
  geom_col()+
  coord_flip(ylim=c(47,53))+
  scale_x_discrete(limits=rev(bottom10$Nationality)) # 역순 출력은 rev


# ggplot2::ggplot(data = top10, 
#                 aes(x = reorder(top10$Nationality, time) , y = top10$time)) +
#   geom_col(color=top10$Nationality ) + 
#   coord_flip(ylim= c(42, 44))
