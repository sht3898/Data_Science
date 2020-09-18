install.packages("ggplot2")
install.packages("gapminder")
install.packages("dplyr")
library(ggplot2)
library(gapminder)
library(dplyr)
glimpse(gapminder)
# 나라 이름 찾기 위한 코드
gapminder$country
summary(gapminder$country)
# 문제1. 우리나라의 1990년대 이후의 기대 수명과 인구 추출
gapminder[gapminder$country == 'Korea, Rep.'& gapminder$year>1990, c('lifeExp', 'pop')]
# 문제2. 북한의 1990년도 이후의 기대 수명과 인구 추출
gapminder[gapminder$country == 'Korea, Dem. Rep.'& gapminder$year>1990, c('lifeExp', 'pop')]
