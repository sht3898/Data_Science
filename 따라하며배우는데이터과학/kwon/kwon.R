#3.데이터 취득과 데이터 가공: sql과 dplyr----
#3.2.데이터 취득----
#3.2.1 예제 데이터 어디서?----
help(package='datasets')
data(package='ggplot2')
#3.2.2 표 형태 텍스트 파일 읽어 들이기----
setwd("C:\\Users\\HyunTaek\\Desktop\\study\\kwon")
boston <- read.table("housing.data")
library(dplyr)
glimpse(boston)
names(boston) <- c('crim','zn','indus','chas','nox','rm','age','dis','rad','tax','ptratio','black','lstat','medv')
glimpse(boston)
plot(boston)
summary(boston)
#3.2.4 엑셀 파일 읽어들이기----
library(readxl)
#3.2.6 R에서의 SQL 연습
library(sqldf)
sqldf("select * from iris")
sqldf("select count(*) from iris")
sqldf("select Species, count(*), avg('Sepal.Length')
      from iris
      group by 'Species'")
sqldf("select Species, 'Sepal.Length', 'Sepal.Width'
      from iris
      where 'Sepal.Length' < 4.5
      order by 'Sepal.Width'")

(df1 <- data_frame(x = c(1,2), y = 2:1))
(df2 <- data_frame(x = c(1,3), a = 10, b = "a"))
sqldf("select * 
      from df1 inner join df2
      on df1.x = df2.x")

sqldf("select *
      from df1 left join df2
      on df1.x = df2.x")
#3.2.8 다른 소프트웨어 데이터 포맷 읽어 들이기
library(foreign)

#3.3 데이터 출력
#3.4 데이터 가공
#3.5 데이터 가공을 위한 도구----
#3.5.4 R
library(gapminder)

#행과열선택
gapminder[gapminder$country=='Korea, Rep.',c('pop','gdpPercap')]

#행선택
gapminder[gapminder$country=='Korea, Rep.',]
gapminder[gapminder$year==2007,]
gapminder[gapminder$country=='Korea, Rep.' & gapminder$year==2007,]
gapminder[1:10,]
head(gapminder, 10)

#정렬
gapminder[order(gapminder$year, gapminder$country),]

#변수선택
gapminder[,c('pop', 'gdpPercap')]
gapminder[,1:3]

#변수명바꾸기:gdpPercap를 gdp_per_cap으로 변경
f2 = gapminder
names(f2)
names(f2)[6] = 'gdp_per_cap'

#변수변환과 변수생성
f2 = gapminder
f2$total_gdp = f2$pop * f2$gdpPercap

#요약 통계량 계산
median(gapminder$gdpPercap)
apply(gapminder[,4:6], 2, mean)
summary(gapminder)


#3.6 R의 dplyr 패키지----
library(dplyr)
i2 <- tbl_df(iris)
class(i2)
i2

glimpse(i2)

iris %>% head
iris %>% head(10)

filter(gapminder, country == 'Korea, Rep.')
filter(gapminder, year == 2007)
filter(gapminder, country == 'Korea, Rep.' & year == 2007)

gapminder %>%
  filter(country == 'Korea, Rep.')
gapminder %>%
  filter(year == 2007)
gapminder %>%
  filter(country == 'Korea, Rep.' & year == 2007)


arrange(gapminder, year, country)
gapminder %>%
  arrange(year, country)

select(gapminder, pop, gdpPercap)
gapminder %>%
  select(pop, gdpPercap)

gapminder %>%
  mutate(total_gap = pop * gdpPercap,
         le_gdp_ratio = lifeExp/ gdpPercap,
         lgrk = le_gdp_ratio * 100)

gapminder %>%
  summarize(n_obs = n(),
            n_countries = n_distinct(country),
            n_years = n_distinct(year),
            med_gdpc = median(gdpPercap),
            max_gdppc = max(gdpPercap))

sample_n(gapminder, 10)
sample_frac(gapminder, 0.01)

distinct(select(gapminder, country))
distinct(select(gapminder, year))

gapminder %>%
  select(country) %>%
  distinct()

gapminder %>%
  select(year) %>%
  distinct()

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(median(lifeExp))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(lifeExp = median(lifeExp)) %>%
  arrange(-lifeExp)

(df1 <- data_frame(x = c(1,2), y=2:1))
(df2 <- data_frame(x= c(1,3), a=10, b= "a"))

df1 %>%
  inner_join(df2)

df1 %>%
  left_join(df2)

df1 %>%
  right_join(df2)

df1 %>%
  full_join(df2)

#4 데이터 시각화1 : ggplot2----
#4.1 시각화의 중요성----
library(gapminder)
?gapminder
gapminder

head(gapminder)
tail(gapminder)

library(dplyr)
glimpse(gapminder)
gapminder$lifeExp
gapminder$gdpPercap
gapminder[,c('lifeExp','gdpPercap')]
gapminder %>%
  select(gdpPercap, lifeExp)

summary(gapminder$lifeExp)
summary(gapminder$gdpPercap)
cor(gapminder$lifeExp, gapminder$gdpPercap)

opar = par(mfrow=c(2,2))
hist(gapminder$lifeExp)
hist(gapminder$gdpPercap, nclass = 50)
hist(log10(gapminder$gdpPercap), nclass = 50)
plot(log10(gapminder$gdpPercap), gapminder$lifeExp, cex=.5)
par(opar)

#4.2 베이스 R그래픽과 ggplot2----
library(ggplot2)
gapminder %>%
  ggplot(aes(x=lifeExp))+ geom_histogram()
gapminder %>%
  ggplot(aes(x=gdpPercap))+ geom_histogram()
gapminder %>%
  ggplot(aes(x=gdpPercap))+ geom_histogram()+
  scale_x_log10()
gapminder %>%
  ggplot(aes(x=gdpPercap, y=lifeExp))+ geom_point()+
  scale_x_log10()+
  geom_smooth()
example(ggplot)


#4.3 변수의 종류에 따른 시각화 기법----
gapminder %>%
  ggplot(aes(x=gdpPercap))+
  geom_histogram()

gapminder %>%
  ggplot(aes(x=gdpPercap))+
  geom_histogram()+
  scale_x_log10()

gapminder %>%
  ggplot(aes(x=gdpPercap))+
  geom_freqpoly()+
  scale_x_log10()

gapminder %>%
  ggplot(aes(x=gdpPercap))+
  geom_density()+
  scale_x_log10()

summary(gapminder)

# 한 범주형 변수

diamonds %>%
  ggplot(aes(cut))+
  geom_bar()

table(diamonds$cut)
prop.table(table(diamonds$cut))
round(prop.table(table(diamonds$cut))*100,1)

diamonds %>%
  group_by(cut) %>%
  tally() %>%
  mutate(pct = round(n/ sum(n) * 100,1))

# 두 수량형 변수
diamonds %>%
  ggplot(aes(carat, price))+
  geom_point()
diamonds %>%
  ggplot(aes(carat, price))+
  geom_point(alpha=.01)
mpg
library(gapminder)
library(dplyr)
library(ggplot2)
pairs(diamonds %>% sample_n(1000))

mpg %>% ggplot(aes(class, hwy)) + geom_boxplot()

mpg %>% ggplot(aes(class, hwy)) + geom_jitter(col='gray')+
  geom_boxplot(alpha=.5)
mpg %>% mutate(class = reorder(class, hwy, median)) %>%
  ggplot(aes(class, hwy))+
  geom_jitter(col='gray')+
  geom_boxplot(alpha=.5)

mpg %>%
  mutate(class = factor(class, levels=
                          c("2seater", "subcompact", "compact", "midsize",
                            "minivan", "suv", "pickup"))) %>%
  ggplot(aes(class, hwy)) + geom_jitter(col = 'gray')+
  geom_boxplot(alpha = .5)


mpg %>%
  mutate(class = factor(class, levels=
                          c("2seater", "subcompact", "compact", "midsize",
                            "minivan", "suv", "pickup"))) %>%
  ggplot(aes(class, hwy)) + geom_jitter(col = 'gray')+
  geom_boxplot(alpha = .5)+
  coord_flip()

glimpse(data.frame(Titanic))

xtabs(Freq~ Class + Sex + Age + Survived, data.frame(Titanic))

?Titanic
Titanic
mosaicplot(Titanic, main = "Survival on the Titanic")
mosaicplot(Titanic, main = "Survival on the Titanic", color = T)

library(dplyr)
library(ggplot2)
library(gapminder)

apply(Titanic, c(3,4), sum)
round(prop.table(apply(Titanic,c(3,4), sum), margin=1),3)

apply(Titanic, c(2,4), sum)

round(prop.table(apply(Titanic, c(2,4), sum), margin=1),3)

t2 = data.frame(Titanic)
t2 %>% group_by(Sex) %>%
  summarize(n = sum(Freq),
            survivors = sum(ifelse(Survived=="Yes", Freq, 0))) %>%
  mutate(rate_survival = survivors/n)

gapminder %>% filter(year==2007) %>%
  ggplot(aes(gdpPercap, lifeExp))+
  geom_point() + scale_x_log10()+
  ggtitle("Gapmider data for 2007")

# 4.3.7
gapminder %>%
  ggplot(aes(year, lifeExp, group = country))+
  geom_line()

gapminder %>%
  ggplot(aes(year, lifeExp, group = country, col = continent))+
  geom_line()

gapminder %>%
  ggplot(aes(year, lifeExp, group = country))+
  geom_line()+
  facet_wrap(~continent)

glimpse(gapminder)

imdb <- read.csv("C:\\Users\\HyunTaek\\Desktop\\study\\kwon\\tmdb_5000_movies.csv",header = T)
glimpse(imdb)
head(imdb)

#6. 통계의 기본 개념 복습
#6.1 통계, 올바른 분석을 위한 툴----

y <- sleep$extra[sleep$group==1]
y

summary(y)
sd(y)
par(mfrow=c(2,2))
hist(y)
boxplot(y)
qqnorm(y); qqline(y)
hist(y, prob=TRUE)
lines(density(y), lty=2)

#6.4. 셋째, 통계학은 관측된 데이터가 가능한 여러 값 중 하나라고 생각한다----
curve(dnorm(x,0,1.8),-4,4)

options(digits=3)
set.seed(1606)
(y_star <- rnorm(10,0,1.8))
mean(y_star-0); sd(y_star)
(t_star <- mean(y_star-0) / (sd(y_star)/sqrt(length(y_star))))

(y_star <- rnorm(10,0,1.8))
mean(y_star-0); sd(y_star)

(t_star <- mean(y_star-0)/(sd(y_star)/sqrt(length(y_star))))

set.seed(1606)
B <- 1e4
n <- 10
xbars_star <- rep(NA,B)
sds_star <- rep(NA,B)
ts_star <- rep(NA,B)
for(b in 1:B){
  y_star <- rnorm(n,0,1.789)
  m <- mean(y_star)
  s <- sd(y_star)
  xbars_star[b] <- m
  sds_star[b] <- s
  ts_star[b] <- m/(s/sqrt(n))
}


opar <- par(mfrow=c(2,2))
hist(xbars_star, nclass = 100)
abline(v = 0.75, col= 'red')
hist(sds_star, nclass = 100)
abline(v=1.789, col='red')
hist(ts_star, nclass = 100)
abline(v=1.3257, col='red')
qqnorm(ts_star); qqline(ts_star)
par(opar)
?par

length(which(ts_star > 1.3257)) / B

#6.8. 신뢰구간의 의미----
set.seed(1606)
(y_star <- rnorm(10,1,1.8))
t.test(y_star)$conf.int
(y_star <- rnorm(10,1,1.8))
t.test(y_star)$conf.int
(y_star <- rnorm(10,1,1.8))
t.test(y_star)$conf.int

set.seed(1606)
B <- 1e2
conf_intervals <- 
  data.frame(b=rep(NA,B),
             lower=rep(NA,B),
             xbar=rep(NA,B),
             upper=rep(NA,B))
true_mu <- 1.0
for(b in 1:B){
  (y_star <- rnorm(10, true_mu, 1.8))
  conf_intervals[b,]=c(b=b,
                       lower=t.test(y_star)$conf.int[1],
                       xbar=mean(y_star),
                       upper=t.test(y_star)$conf.int[2])
}
conf_intervals <- conf_intervals %>%
  mutate(lucky =(lower <= true_mu & true_mu <= upper))

glimpse(conf_intervals)
table(conf_intervals$lucky)
conf_intervals %>% ggplot(aes(b, xbar, col=lucky))+
  geom_point()+
  geom_errorbar(aes(ymin=lower, ymax=upper)) +
  geom_hline(yintercept = true_mu, col='red')

#6.10.모집단, 모수, 표본----
hist(c(0,1), nclass=100, prob=TRUE, main='Individual sleep time increase')
set.seed(1606)
B <- 1e4
n <- 10
xbars_star <- rep(NA,B)
for(b in 1:B){
  xbars_star[b] <- mean(sample(c(0,1), size=n, replace=TRUE))
}
hist(xbars_star, nclass=100, main='Sample mean of 10 obs')

#6.11.모수추정의 정확도는 sqrt(n)에 비례한다
diff(t.test(y)$conf.int)
mean(y)
diff(t.test(y)$conf.int)/2

#7.데이터 종류에 따른 분석 기법
#7.1.데이터형, 분석 기법, R함수----
mpg <- tbl_df(mpg)
mpg

#7.2.모든 데이터에 행해야 할 분석
glimpse(mpg)
summary(mpg)

#7.3.수량형 변수의 분석----
summary(mpg$hwy)
mean(mpg$hwy)
median(mpg$hwy)
range(mpg$hwy)
quantile(mpg$hwy)

opar <- par(mfrow=c(2,2))
hist(mpg$hwy)
boxplot(mpg$hwy)
qqnorm(mpg$hwy)
qqline(mpg$hwy)
par(opar)

#7.3.1 일변량 t검정----
hwy <- mpg$hwy
n <- length(hwy)
mu0 <- 22.9
t.test(hwy, mu=mu0, alternative = "greater")
t.test(hwy)

#7.3.2 이상점과 로버스트 통계방법----
c(mean(hwy),sd(hwy))
c(median(hwy), mad(hwy))

#7.4.성공-실패값 범주형 변수의 분석----
set.seed(1606)
n <- 100
p <- 0.5
x <- rbinom(n,1,p)
x <- factor(x, levels = c(0,1), labels=c("no","yes"))
x
table(x)
prop.table(table(x))
barplot(table(x))

binom.test(x=length(x[x=='yes']),n=length(x), p=0.5, alternative= "two.sided")

#7.4.1 오차한계, 표본 크기, sqrt(n)의 힘----
binom.test(x=5400, n=10000)
binom.test(x=54,n=100)

n <- c(100, 1000, 2000, 10000, 1e6)
data.frame(n=n, moe=round(1.96*sqrt(1/(4*n)),4))
curve(1.96*sqrt(1/(4*x)), 10, 10000, log='x')
grid()
?curve
?grid

#7.5 설명변수와 반응변수----
#7.6 수량형x 수량형y의 분석----
ggplot(mpg, aes(cty, hwy))+
  geom_jitter()+
  geom_smooth(method="lm")

cor(mpg$cty, mpg$hwy)
with(mpg, cor(cty, hwy))
with(mpg, cor(cty, hwy, method = "kendall"))
with(mpg, cor(cty, hwy, method = "spearman"))

(hwy_lm <- lm(hwy ~ cty, data=mpg))
summary(hwy_lm)

predict(hwy_lm)
resid(hwy_lm)
predict(hwy_lm, newdata = data.frame(cty=c(10,20,30)))
predict(hwy_lm, newdata = data.frame(cty=c(10,20,30)),
        se.fit = TRUE)

class(hwy_lm)
opar <- par(mfrow = c(2,2), oma = c(0,0,1.1,0))
plot(hwy_lm, las=1)
par(opar)


# 로버스트 선형회귀분석
library(MASS)
set.seed(123)
lqs(stack.loss~., data = stackloss)

lm(stack.loss~., data = stackloss)
library(ggplot2)
library(dplyr)

plot(hwy~displ, data=mpg)
mpg_lo <- loess(hwy~displ, data=mpg)
mpg_lo
summary(mpg_lo)

xs <- seq(2,7,length.out = 100)
mpg_pre <- predict(mpg_lo, newdata= data.frame(displ=xs), se=TRUE)
lines(xs, mpg_pre$fit)
lines(xs, mpg_pre$fit - 1.96*mpg_pre$se.fit, lty=2)
lines(xs, mpg_pre$fit + 1.96*mpg_pre$se.fit, lty=2)

ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  geom_smooth()

#7.7.범주형x, 수량형y----
mpg %>% ggplot(aes(class, hwy)) + geom_boxplot()
(hwy_lm2 <- lm(hwy~class, data= mpg))
summary(hwy_lm2)
predict(hwy_lm2, newdata = data.frame(class="pickup"))
opar <- par(mfrow=c(2,2), oma=c(0, 0, 1.1, 0))
plot(hwy_lm2, las = 1)
par(opar)

chall <- read.csv('https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/challenger.csv')
chall <- tbl_df(chall)
glimpse(chall)

chall %>% ggplot(aes(temperature, distress_ct)) +
  geom_point()
chall %>% ggplot(aes(factor(distress_ct), temperature))+
  geom_boxplot()

(chall_glm <- 
    glm(cbind(distress_ct, o_ring_ct - distress_ct) ~
          temperature, data = chall, family = 'binomial'))

summary(chall_glm)

predict(chall_glm, data.frame(temperature=30))

exp(3.45)/ (exp(3.45)+1)
predict(chall_glm, data.frame(temperature=30), type = 'response')

logistic <- function(x){exp(x)/(exp(x)+1)}
plot(c(20,85), c(0,1), type = "n", xlab="temperature",ylab = "prob")
tp <- seq(20,85,1)
chall_glm_pred <- 
  predict(chall_glm,
          data.frame(temperature = tp),
          se.fit = TRUE)
