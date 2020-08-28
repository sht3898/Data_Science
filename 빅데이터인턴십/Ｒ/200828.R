PSDS_PATH <- file.path('C:/Users/User/Desktop/sht3898/Data_Science/빅데이터인턴십/Ｒ')

# p.219
# t검정
# 세 종류 데이터
data1 <- c(30, -5, 55, -30, -20, 45)
data2 <- c(12, 13, 12, 13, 12, 13)
data3 <- c(30, -5, 55, -30, -20, 45, 30, -5, 55, -30, -20, 45)

# t검정
t.test(data1, alternative = c("greater"))
t.test(data2, alternative = c("greater"))
t.test(data3, alternative = c("greater"))

# p.222
# t검정
session_times <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\web_page_data.csv')
head(session_times)
t.test(Time~Page, data=session_times, alternative="less")

# p.229
# 분산분석
four_sessions <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\four_sessions.csv')
summary(aov(Time~Page, data=four_sessions))
oneway.test(four_sessions$Time~four_sessions$Page, var=T)


# p.232
# 카이제곱검정
click_rate <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\click_rates.csv')
clicks <- matrix(click_rate$Rate, nrow = 3, ncol = 2, byrow = TRUE)
head(clicks)
chisq.test(clicks, simulate.p.value = TRUE)


# p.239
# 적합성검정
obs <- c(20, 40, 40)
obs.probs <- c(2/10, 3/10, 5/10)
(g.fit <- chisq.test(obs, p=obs.probs))

# p.243
# 독립성검정
raw_data <- c(7,13,9,12,13,21,10,19,11,18,12,13)
data_mtx <- matrix(raw_data, byrow = TRUE, nrow = 3)
data_mtx

dimnames(data_mtx) <- list("Class"=c("Class1", "Class2", "Class3"),
                           "Score"=c("ScoreA", "ScoreB", "ScoreC", "ScoreF"))
data_mtx
addmargins(data_mtx)

# p.244
addmargins(prop.table(data_mtx))

barplot(t(data_mtx), beside = TRUE, legend=TRUE,
        ylim=c(0, 30),
        ylab="Observed frequencies in sample",
        main="Frequency of math score by class")

# p.245
(i.fit <- chisq.test(data_mtx))
1-pchisq(q=c(1.3859), df=6, lower.tail = TRUE)


# p.249
raw_data <- c(50, 30, 20, 50, 80, 70)
data_mtx <- matrix(raw_data, byrow = TRUE, nrow = 2)
data_mtx
dimnames(data_mtx) <- list("성별"=c("남학생", "여학생"),
                           "DS교과목"=c("통계", "머신러닝", "딥러닝"))
data_mtx
addmargins(data_mtx)

# p.250
addmargins(prop.table(data_mtx))
barplot(t(data_mtx), beside = TRUE, legend=TRUE,
        ylim = c(0, 120),
        ylab = "Observerd frequencies in sample",
        main = "데이터 사이언스 교과목 선호 조사 결과")

# p.251
(h.fit <- chisq.test(data_mtx))
# 카이제곱분포의 누적 분포 함수를 이용한 p-value 계산
1-pchisq(q=c(19.318), df=2, lower.tail = TRUE)


# p.256
lung <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ\\LungDisease.csv')
plot(lung$Exposure, lung$PEFR, xlab = "Exposure", ylab = "PEFR")

# p.257
model <- lm(PEFR ~ Exposure, data = lung)
model


# p.258
# 단순성형회귀
# cars 데이터로 단순선형회귀
head(cars)
attach(cars)

# 1 plot
plot(dist~speed, data = cars)

# 2 lm() ~ abline()
m3 <- lm(dist~speed, cars)
abline(m3, col = "red")

# 3 predict 함수를 사용하여 예측
yhat <- predict(m3)

# 잘 예측 되었는지 비교하기 위해 오른쪽에 실제 값을 붙여주겠습니다
cbind(dist, yhat)

join <- function(i)
  lines(c(speed[i], speed[i]), c(dist[i], yhat[i]), col="green")  
sapply(1:50, join)

cars$speed
cars$dist
yhat
lines(c(speed[1], speed[1]), c(dist[1], yhat[1]), col="red")
lines(c(speed[2], speed[2]), c(dist[2], yhat[2]), col="blue")
lines(c(5, 10), c(10, 40))

# p.260
# plot를 그리고, 회귀선과 잔차선을 나타내시오
model <- lm(PEFR ~ Exposure, data = lung)
plot(lung$Exposure, lung$PEFR, xlab = "PEER", ylab = "PEFR", pch=20, col="red")
abline(model, col="blue")

attach(lung)
head(lung)
str(lung)

# predict 함수를 사용하여 예측
yhat <- predict(model)
head(yhat)
cbind(Exposure, yhat)

# 직선연결: lines(x, y)
join <- function(i)
  lines(c(Exposure[i], Exposure[i]), c(PEFR[i], yhat[i]), col="green")
sapply(1:122, join)

# p.261
# 회귀 함수 학습
model <- lm(PEFR ~ Exposure, data = lung)
model
fitted <- predict(model) # 예측값
resid <- residuals(model) # 잔차



# p.266
# 다중선형회귀
house <- read.csv(file.path(PSDS_PATH, 'house_sales.csv'), sep='\t')
head(house[, c("AdjSalePrice", "SqFtTotLiving", "SqFtLot", "Bathrooms",
               "Bedrooms", "BldgGrade")])
# p.267
house_lm <- lm(AdjSalePrice ~ SqFtTotLiving + SqFtLot + Bathrooms +
                 Bedrooms + BldgGrade,
               data=house, na.action = na.omit)
house_lm

# p.270
summary(house_lm)

# p.274
house_full <- lm(AdjSalePrice ~ SqFtTotLiving + SqFtLot + Bathrooms +
                   Bedrooms + BldgGrade + PropertyType + NbrLivingUnits +
                   SqFtFinBasement + YrBuilt + YrRenovated + NewConstruction,
                 data=house, na.action = na.omit)
house_full
library(MASS)
step_lm <- stepAIC(house_full, direction = "both")
