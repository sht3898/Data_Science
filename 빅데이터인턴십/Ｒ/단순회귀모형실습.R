getwd()
setwd("C:\\Users\\User\\Desktop\\sht3898\\Data_Science\\빅데이터인턴십\\Ｒ")

# 대학생 92명의 키와 몸무게 데이터 읽기

# 1. 데이터 셋 읽어오기
PSDS_PATH <- file.path('C:/Users/User/Desktop/sht3898/Data_Science/빅데이터인턴십/Ｒ')
PSDS_PATH

std90 <- read.table(file.path(PSDS_PATH, "student90.csv"),
                    sep=",",
                    stringsAsFactors = FALSE,
                    header = TRUE,
                    na.strings = "")
head(std90)
str(std90)

# 2. 회귀 모델 생성
(m <- lm(weight_kg~height_cm, data=std90))

# 3. 회귀 계수 구하기
coef(m)
# height_cm: 0.2247, 잔차: 32.6604
# 학생의 몸무게(kg) = 32.6604 + 0.2247*학생의키(cm)

# 적합된 값 구하기기
fitted(m)[1:4]
((32.6604144) + (0.2246605) * (std90$height_cm[1:4]))

# 4. 회귀 계수 값 검증하기
# 이상값 구하기
plot(m, which=4)

# 이상값 진단
x_cooks.d <- cooks.distance(m)
x_cooks.d[1:4]

NROW(x_cooks.d)

x_cooks.d[which(x_cooks.d>qf(0.5, df1 = 2, df2 = 88))]
summary(m)

# install.packages("car")
# library(car)
outlierTest(m)

# 5. 잔차 구하기
# 잔차
residuals(m)[1:4]

std90$weight_kg[1:4]
fitted(m)[1:4] + residuals(m)[1:4]

# 잔차의 정규성 확인
qqnorm(residuals(m))
qqline(residuals(m))
shapiro.test(residuals(m))

# 6. 잔차 제곱 합 구하기
deviance(model)

# 7. 회귀 계수 신뢰 구간 구하기
# 회귀 계수의 95% 신뢰구간 구하기기
confint(m, level=0.95)
m_conf <- predict(m, level = 0.95, interval = "confidence")
head(m_conf)

# 키와 몸무게 산포도, 추정된 평균 몸무게, 신뢰구간
plot(weight_kg~height_cm, data=std90)
lwr <- m_conf[,2]
upr <- m_conf[,3]
sx <- sort(std90$height_cm, index.return=TRUE)
abline(coef(m), lwd=2)
lines(sx$x, lwr[sx$ix], col="blue", lty=2)
lines(sx$x, upr[sx$ix], col="blue", lty=2)

# 8. 새로운 학생 키로 몸무게 예측하기
m_pred <- predict(m, level = 0.95, interval = "predict")
head(m_pred)

# 키와 몸무게 산포도, 예측구간
p_lwr <- m_pred[,2]
p_upr <- m_pred[,3]
lines(std90$height_cm, p_lwr, col="red", lty=2)
lines(std90$height_cm, p_upr, col="red", lty=2)

predict(m, newdata=data.frame(height_cm=175), interval = "confidence")

# 9. 모델 평가하기
summary(m)

# F 통계량 구하기
anova(m)

(m_a <- lm(weight_kg~height_cm, data = std90))
(m_b <- lm(weight_kg~1, data=std90))
anova(m_a, m_b)

# RMSE, MAE를 이용한 모델간의 비교
rmse(m_a, std90)
mae(m_a, std90)
