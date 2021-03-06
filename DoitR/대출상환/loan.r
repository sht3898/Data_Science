loan <- read.csv("C:\\Users\\HyunTaek\\Desktop\\study\\DoitR\\대출상환\\Loan_payments_data.csv")
class(loan$Gender) # 성별의 클래스 확인
class(loan$past_due_days) # 연체일 클래스 확인
class(loan$due_date) # 반납예정일 클래스 확인
class(loan$paid_off_time) # 실제반납시간 클래스 확인
table(loan$due_date) # 반납예정일 이상치 확인
table(loan$paid_off_time) # 실제반납시간 이상치 확인
table(loan$past_due_days) # 연체일 이상치 확인
table(is.na(loan$past_due_days))
table(is.na(loan$due_date))
table(is.na(loan$paid_off_time))

# 성별 대출액의 관계
class(loan$Principal)
table(loan$Principal)

library(ggplot2)
qplot(loan$Gender)

summary(loan$Principal)
qplot(loan$Principal)
table(is.na(loan$Principal))

library(dplyr)
gender_principal <- loan %>%
  group_by(Gender) %>%
  summarise(mean_principal = mean(Principal))

gender_principal
ggplot(data = gender_principal, aes(x= Gender, y = mean_principal)) + geom_col()

# 나이와 대출액의 관계
class(loan$age)
summary(loan$age)
qplot(loan$age)

table(is.na(loan$age))

age_principal <- loan %>%
  group_by(age) %>%
  summarise(mean_principal = mean(Principal))

head(age_principal)

ggplot(data = age_principal, aes(x = age, y = mean_principal)) + geom_line()

age_principal <- loan %>%
  group_by(age, Gender) %>%
  summarise(mean_principal = mean(Principal))

age_principal
ggplot(data = age_principal, aes(x = age, y = mean_principal, fill = Gender)) +
  geom_col(position = "dodge")

class(loan$education)
table(loan$education)
edu_principal <- loan %>%
  group_by(education) %>%
  summarise(mean_principal = mean(Principal))
edu_principal

ggplot(data = edu_principal, aes(x=reorder(education, mean_principal), y = mean_principal))+
  geom_col()+
  coord_flip()
