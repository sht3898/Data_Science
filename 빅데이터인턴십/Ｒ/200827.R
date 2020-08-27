# p.113
score <- c(85, 90, 93, 86, 82)
mean(score)
median(score)
var(score)
sd(score)

# 데이터프레임: 평균, 편차, 표준 편차
# p.114
name <- c('주시현', '최경우', '이은주', '허민성', '홍미나')
height <- c(168, 176, 167,174, 169)
weight <- c(52, 68, 47, 82, 51)
df <- data.frame(이름=name, 키=height, 몸무게=weight)
attach(df)
df
mean(키)
median(키)
mean(몸무게)
sd(키)
sd(몸무게)

# p.117
height <- rnorm(n=1000000, mean=168, sd=7)
hist(height, breaks = 10, probability = T)

# t검정
# p.121
score1 <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\tdata.csv', header=T, stringsAsFactors=T)
score1
shapiro.test(score1$성적)
# p.122
result <- t.test(score1$성적, alternative=c("greater"), mu=75)
result

# p.123
score1 <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\tdata2.csv', header=T, stringsAsFactors=T)
score1
shapiro.test(score1$성적)
# p.124
result <- t.test(score1$성적, alternative=c("greater"), mu=75)
result

# p.125
x <- c(15, 10, 13, 7, 9, 8, 21, 9, 14, 8)
y <- c(15, 14, 12, 8, 14, 7, 16, 10, 15, 12)
shapiro.test(x)
shapiro.test(y)

t.test(x, y)

# p.127
# t검정 - 대응표본
x <- c(52, 60, 63, 43, 46, 56, 62, 50)
y <- c(58, 62, 62, 48, 50, 55, 68, 57)
shapiro.test(x)
shapiro.test(y)
t.test(x, y, paired = TRUE)

# p.128
# oneway test 3집단
x <- c(1.09, 2.12, 2.92, 4.06, 4.90); y <- c(1, 2, 3, 4, 5)
z <- c(1.10, 1.96, 3.98, 4.09, 4.92)
shapiro.test(x); shapiro.test(y); shapiro.test(z)

mydata <- c(x, y, z); mydata
group <- c(rep(1,5), rep(2,5), rep(3,5))
group
oneway.test(mydata~group, var=T) # 마이데이터를 3그룹 지어서 평균이 같은지 검증

# p.129
x1 <- c(23, 27, 24, 25, 29, 30, 26)
x2 <- c(35, 32, 38, 36, 32, 33, 34)
x3 <- c(36, 41, 38, 39, 40, 38, 39)
x4 <- c(32, 30, 37, 34, 35, 34, 32)
shapiro.test(x1)
shapiro.test(x2)
shapiro.test(x3)
shapiro.test(x4)
mydata <- c(x1, x2, x3, x4)
group <- c(rep(1,7), rep(2,7), rep(3,7), rep(4,7))
oneway.test(mydata~group, var=T)


# 빈도분석
# p.132
fruits1 <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\love_fruits.csv', header=T)
fruits1
prop.table(table(fruits1$선호과일))
round(prop.table(table(fruits1$선호과일))*100, 2)

# p.133
table(fruits1$선호과일)
count <- c(table(fruits1$선호과일))
pct <- c(round(prop.table(table(fruits1$선호과일))*100, 2))
love_fruits <- data.frame(건수=count, 비율=pct)
love_fruits


# bar plot
# p.134
barplot(love_fruits$건수,
        names.arg = c('바나나', '복숭아', '사과', '체리', '포도'),
        ylim=c(0,15), col=rainbow(5))

# 상관분석
# p.139
x <- c(3, 5, 8, 11, 13)
y <- c(1, 2, 3, 4, 5)
cor(x, y)
cor.test(x, y)

# 회귀분석
# p.144
x <- c(110, 120, 130, 140, 150)
y <- c(100, 105, 128, 115, 142)
plot(x, y, pch=20, col="red")
line <- lm(y~x)
line
abline(line, col="blue")

# 회귀분석
# p.146
score <- read.csv("C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\score.txt", header=T, sep=",")
attach(score)
lm1 <- lm(성적~IQ)
lm1
y <- -5.292 + 0.671 * 125 # IQ가 125일 경우 예상 점수 계산하기기
y
plot(IQ, 성적, pch=20, col="red")
abline(lm1, col="blue")

# 병원 친절도
# p.147
x <- c(15, 10, 13, 7, 9, 8, 21, 9, 14, 8)
y <- c(15, 14, 12, 8, 14, 7, 16, 10, 15, 12)
out=lm(y~x)
summary(out)
# Y = 6.359+0.52X

# 성적과 IQ
# p.148
lm3 <- lm(성적~IQ+다니는학원수+게임하는시간+TV시청시간)
lm3

# y = 23.299 + 0.468x1 + 0.718x2 - 0.839x3 - 1.385x4
# p.150
summary(lm3)

# 인맥관리
# p.152
x1 <- (c(100, 90, 98, 79, 81, 69, 80, 77, 68, 54))
x2 <- (c(5, 4, 5, 3, 4, 3, 2, 3, 2, 1))
x3 <- ((c(5, 3, 4, 3, 4, 3, 2, 3, 2, 1)))
x4 <- (c(5, 3, 3, 2, 3, 3, 4, 3, 2, 1))
mydata <- data.frame(y=x1, s1=x2, s2=x3, s3=x4)
mydata

model <- lm(y~.,data=mydata)
summary(model)

# 서비스요인
# p.153
x1 <- c(100, 90, 98, 79, 81, 69, 80, 77, 68, 74)
x2 <- c(5, 4, 4, 3, 4, 3, 4, 3, 2, 3)
x3 <- c(4,3,3,2,3,2,3,3,2,3)
x4 <- c(5,3,3,2,3,3,4,3,2,3)
mydata <- data.frame(y=x1, s1=x2, s2=x3, s3=x4)
mydata

model <- lm(y~.,data = mydata)
summary(model)

# 문제1
a <- c(65, 87, 73, 79, 81, 69, 80, 77, 68, 74)
b <- c(75, 69, 83, 81, 72, 79, 90, 88, 76, 82)
c <- c(59, 78, 67, 62, 83, 76, 55, 75, 49, 68)
d <- c(94, 89, 80, 88, 90, 85, 79, 93, 88, 85)
# 귀무가설 : 각 교육방법별 효과의 차이가 없다.
# 대립가설 : 각 교율방법별 효과의 차이가 있다.
edu <- c(a, b, c, d)
edu
group <- c(rep(1,10), rep(2,10), rep(3, 10), rep(4, 10))
oneway.test(edu~group, var=T)
# 분산분석 결과 p-value < 0.05 이므로 대립가설 채택 => 교육방법별 효과의 차이가 있다는 결론을 내림


# 문제2.
x <- c(52, 60, 63, 43, 46, 56, 62, 50)
y <- c(58, 62, 62, 48, 50, 55, 68, 57)
shapiro.test(x)
shapiro.test(y)
# 정규 분포 검사 결과 p-value가 0.05보다 크므로 모두 정규분포 따름
# 귀무가설: 교육의 효과가 없다.
# 대립가설: 교육의 효과가 있다.
# 대응 t검정
t.test(x, y, paired = TRUE)
# 대응t표본 검정 결과 p-value < 0.05 이므로 대립가설 채택 => 교육의 효과가 있다.


# 문제3.
pre <- c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
post <- c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
shapiro.test(pre)
shapiro.test(post)
# 정규 분포 검사 결과 p-value가 0.05보다 크므로 모두 정규분포 따름
# 귀무가설: 성형 전후 만족도의 차이가 없다.
# 대립가설: 성형 전후 만족도의 차이가 있다.
t.test(pre, post, paired = TRUE)
# 대응 t표본 검정 결과 p-value < 0.05 이므로 대립가설 채택 => 성형 전후 만족도의 차이가 있다.
# 만족도가 0.41 증가


# 문제4.
new <- c(15, 10, 13, 7, 9, 8, 21, 9, 14, 8)
old <- c(15, 14, 12, 8, 14, 7, 16, 10, 15, 12)
shapiro.test(new)
shapiro.test(old)
# 정규 분포 검사 결과 p-value가 0.05보다 크므로 모두 정규분포 따름
# 귀무가설: 신약의 개발 효과가 없다.
# 대립가설: 신약의 개발 효과가 있다.
t.test(new, old)
# t표본 검정 결과 p-value > 0.05 이므로 귀무가설 채택 => 신약의 개뱔 효과가 없다.


# 문제5.
first <- c(23, 27, 24, 25, 29, 30, 26)
second <- c(35, 32, 38, 36, 32, 33, 34)
third <- c(36, 41, 38, 39, 40, 38, 39)
forth <- c(32, 30, 37, 34, 35, 34, 32)
strongtest <- c(first, second, third, forth)
# 귀무가설: 제품별 강도의 차이가 없다.
# 대립가설: 제품별 강도의 차이가 있다.
group <- c(rep(1,7), rep(2,7), rep(3,7), rep(4,7))
oneway.test(strongtest~group, var=T)
# 분산분석 결과 p-value < 0.05 이므로 대립가설 채택 => 제품별 강도의 차이가 있다.

# 문제6.
kindness <- c(15, 10, 13, 7, 9, 8, 21, 9, 14, 8)
satisfaction <- c(15, 14, 12, 8, 14, 7, 16, 10, 15, 12)
# 귀무가설 : 병원 직원들의 친절도가 병원 만족도에 영향을 미치지 않는다.
# 대립가설 : 병원 직원들의 친절도가 병원 만족도에 영향을 미친다.
out = lm(satisfaction~kindness)
summary(out)
# 회귀분석 결과 p-value < 0.05이므로 병원 직원들의 친절도가 병원 만족도에 영향을 미친다.


# 문제7.
x1 <- c(100, 90, 98, 79, 81, 69, 80, 77, 68, 54)
x2 <- c(5, 4, 5, 3, 4, 3, 2, 3, 2, 1)
x3 <- c(5, 3, 4, 3, 4, 3, 2, 3, 2, 1)
x4 <- c(5, 3, 3, 2, 3, 3, 4, 3, 2, 1)
mydata <- data.frame(y=x1, s1=x2, s2=x3, s3=x4)
# 귀무가설: 개인요인이 인맥관리에 유의한 영향을 미치지 않는다.
# 대립가설: 개인요인이 인맥관리에 유의한 영향을 미친다.
mydata
model <- lm(y~.,data=mydata)
summary(model)
# 회귀분석 결과 p-value < 0.05이므로 개인요인이 인맥관리에 유의한 영향을 미친다.


# 문제8.
x1 <- c(100, 90, 98, 79, 81, 69, 80, 77, 68, 54)
x2 <- c(5, 4, 4, 3, 4, 3, 4, 3, 2, 3)
x3 <- c(5, 3, 5, 2, 3, 2, 3, 3, 2, 3)
x4 <- c(5, 3, 4, 4, 3, 2, 4, 4, 2, 3)
mydata <- data.frame(y=x1, s1=x2, s2=x3, s3=x4)
# 귀무가설: 서비스 요인이 고객충성도에 유의한 영향을 미치지 않는다.
# 대립가설: 서비스 요인이 고객충성도에 유의한 영향을 미친다.
mydata
model <- lm(y~.,data=mydata)
summary(model)
# 회귀분석 결과 p-value > 0.05이므로 서비스 요인이 고객충성도에 유의한 영향을 미치지 않는다.

# 문제9.
math <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)
shapiro.test(math)
# 귀무가설: 0교시 수업을 통해 학생들의 성적은 오르지 않았다.
# 대립가설: 0교시 수업을 통해 학생들의 성적은 올랐다.
t.test(math, alternative = "greater", mu = 55)
# t표본 검정 결과 p-value > 0.05이므로 0교시 수업을 통해 학생들의 성적은 오르지 않았다.



# 위치 추정
# p.172
state <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\state.csv')
mean(state[["Population"]])
mean(state[["Population"]], trim=0.1)
median(state[["Population"]])
weighted.mean(state[["Murder.Rate"]], w=state[["Population"]])

weighted.mean(state[["Population"]], w=state[["Murder.Rate"]])
weighted.mean(state[["Murder.Rate"]], state[["Population"]])

# 가중평균
# p.174
weighted_mean1 <- (200*0.99 + 1000*0.21)/(200+1000)

alchol <- data.frame(volume=c(200, 1000), alchol_rate=c(0.09, 0.21))
weighted_mean2 <- weighted.mean(alchol$alchol_rate, alchol$volume)
weighted_mean2

# 변이 계산
# p.177
x <- c(1,2,3,3,5,6,7,9)
mean(x)
median(x)
max(x)
min(x)
summary(x)
var(x)
sd(x)
IQR(x)
mad(x)

# 데이터 분포 탐색
# p.178
quantile(state[["Population"]], p=c(.05, .25, .5, .75, .95)) # 백분위수수
boxplot(state[["Population"]]/1000000,
        ylab="Population (millions)")

# 도수분포표
# p.181
breaks <- seq(from=min(state[["Population"]]), to=max(state[["Population"]]),
              length=11)
pop_freq <- cut(state[["Population"]], breaks=breaks, right=TRUE, include.lowest = TRUE)
table(pop_freq)

hist(state[["Population"]], breaks=breaks)

# p.183
x <- c(1,2,3,3,5,6,7,9)
breaks1 <- seq(from=min(x), to=max(x), length=5)
pop_freq1 <- cut(x, breaks=breaks1, right=TRUE, include.lowest = TRUE)
table(pop_freq1)
hist(x, breaks=breaks1)

# 막대그래프
# p.184
dfw <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\dfw_airline.csv')
barplot(as.matrix(dfw))


barplot(as.matrix(dfw)/6, cex.axis = 0.8, cex.names = 0.7)
barplot(as.matrix(dfw)/6, ylim = c(0, 20000), cex.axis = 0.8, cex.names = 0.7)

# 상관관계
# p.188
sp500_px <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\sp500_0.csv')
sp500_sym <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\sp500_sym.csv', stringsAsFactors=FALSE)

telecom <- sp500_px[, sp500_sym[sp500_sym$sector=="telecommunications_services", "symbol"]]
telecom <- telecom[row.names(telecom)>"2012-07-01",]
telecom_cor <- cor(telecom)
telecom_cor


# 상관 행렬
# p.189
library(corrplot)
corrplot(cor(telecom), method = "circle")

# 데이터 준비
# p.191
telecom <- sp500_px[,sp500_sym[sp500_sym$sector=='telecommunications_services', 'symbol']]
telecom <- telecom[row.names(telecom)>"2012-07-01",]

# 산점도 그래프
plot(telecom$T, telecom$VZ, xlab = "T", ylab = "VZ")



## 표본 크기
# p.199
loans_income <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\loans_income.csv')[,1]
samp_data <- data.frame(income=sample(loans_income, 1000), type='data_dist')
str(samp_data)

samp <- data.frame(name=factor(c('kim', 'choi', 'choi', 'lee', 'kim', 'lee')),
                   score=c(50,30,10,50,20,30))
tapply(samp$score, samp$name, length)
tapply(samp$score, samp$name, mean)


# 표본분포
# p.200
loans_income <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\loans_income.csv')[,1]
samp_data <- data.frame(income=sample(loans_income, 1000), type='data_dist')
# 5개 표본씩 평균
samp_mean_05 <- data.frame(
  income=tapply(sample(loans_income, 1000*5),
                rep(1:1000, rep(5, 1000)), FUN = mean), type='mean_of_5'
)

# 20개 표본씩 평균
samp_mean_20 <- data.frame(
  income=tapply(sample(loans_income, 1000*20),
                rep(1:1000, rep(20, 1000)), FUN=mean),  type='mean_of_20'
)

income <- rbind(samp_data, samp_mean_05, samp_mean_20)
income$type = factor(income$type,
                     levels=c('data_dist', 'mean_of_5', 'mean_of_20'),
                     labels=c('Data', 'Mean of 5', 'Mean of 20'))

# p.201
table(income$type)
library(ggplot2)
ggplot(income, aes(x=income))+
  geom_histogram(bins=40)+
  facet_grid(type~.)

# p.202
ggplot(income, aes(x=income))+
  geom_histogram(bins=40)+
  facet_grid(type~.)

ggplot(income, aes(x=income))+
  geom_histogram(bins=400)+
  facet_grid(type~.)


# 부트스트랩
# p.204
install.packages("boot")
library(boot)
loans_income <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\loans_income.csv')[,1]
stat_fun <- function(x, idx) median(x[idx])
boot_obj <- boot(loans_income, R = 1000, statistic = stat_fun)
boot_obj
