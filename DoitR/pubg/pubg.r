pubg <- read.csv("C:\\Users\\HyunTaek\\Desktop\\study\\DoitR\\pubg\\PUBG_Player_Statistics.csv",header=T)
head(pubg)
solo <- pubg[1:52]
head(solo)
class(solo$solo_WinRatio)
table(solo$solo_WinRatio)
summary(solo$solo_WinRatio)

class(solo$solo_KillsPg)
table(solo$solo_KillsPg)
class(solo$solo_Rating)
table(solo$solo_Rating)

library(dplyr)
library(ggplot2)


summary(solo$solo_Rating)
solo <- solo %>%
  mutate(grade = ifelse(solo_Rating <= 1477.2, "chobo",
                        ifelse(solo_Rating <= 2041.1, "jungsu","gosu")))
head(subset(solo, select=c("solo_Rating","grade")),10)
table(solo$grade)

# 레이팅과 평균 킬
kill_grade <- solo %>%
  filter(!is.na(solo_KillsPg)) %>%
  group_by(grade) %>%
  summarise(mean_kills = mean(solo_KillsPg))
kill_grade

ggplot(data = kill_grade, aes(x=grade, y=mean_kills)) + 
  geom_col() +
  scale_x_discrete(limits=c("chobo","jungsu","gosu"))

# 레이팅과 평균 탑10
top10 <- solo %>%
  filter(!is.na(solo_Top10sPg)) %>%
  group_by(grade) %>%
  summarise(mean_top10 = mean(solo_Top10sPg))
ggplot(data = top10, aes(x=grade, y = mean_top10))+
  geom_col()+
  scale_x_discrete(limits = c("chobo","jungsu","gosu"))

# 레이팅과 평균 생존시간
head(solo)
survive <- solo %>%
  filter(!is.na(solo_AvgSurvivalTime)) %>%
  group_by(grade) %>%
  summarise(mean_survive = mean(solo_AvgSurvivalTime))
survive
ggplot(data = survive, aes(x=grade, y=mean_survive))+
  geom_col()+
  scale_x_discrete(limits = c("chobo","jungsu","gosu"))

# 레이팅과 평균 이동거리
distance <- solo %>%
  filter(!is.na(solo_MoveDistancePg)) %>%
  group_by(grade) %>%
  summarise(mean_distance = mean(solo_MoveDistancePg))
distance
ggplot(data = distance, aes(x=grade, y=mean_distance))+
  geom_col()+
  scale_x_discrete(limits=c("chobo","jungsu","gosu"))
