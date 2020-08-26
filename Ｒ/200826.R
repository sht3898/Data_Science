str(cars)
plot(cars)
cars

search()

install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

search()

x<-1
y<-2
x
y
z <- x+y
z
x <- 1
x
x <- x+1
x
x <- x+3
x

# 변수 이름 규칙
a <- 1
a
initial_value <- 1
initial_value

xi <- 1+2i
yi <- 1-2i
xi+yi

is.integer(1)
is.numeric(1)
is.integer(1L)
is.numeric(1L)
is.complex(3+4i)
is.character(1)


# 데이터형 변환 함수들
x <- 1
x
is.integer(x)

x <- 1L
x
is.integer(x)

x <- as.integer(1)
x
is.integer(x)

5/2
5^2
5%%2
5%/%2

# 비교연산자
TRUE | FALSE
TRUE & FALSE
isTRUE(TRUE)


# 벡터 생성
1:7
7:1
c(1:5)
c(1, 2, 3, c(4:6))
x <- c(1, 2, 3)
x
y <- c()
y <- c(y, c(1:3))
y
seq(from=1, to=10, by=2)
seq(1, 10, by=2)
seq(0, 1, by=0.1)
seq(0, 1, length.out = 11)

rep(c(1:3), times=2)
rep(c(1:3), each=2)


# 벡터 연산
x <- c(2, 4, 6, 8, 10)
length(x)
x[1]
x[1, 2, 3]
x[c(1, 2, 3)]
x[-c(1, 2, 3)]
x[c(1:3)]

# 벡터끼리 연산 수행
x <- c(1, 2, 3, 4)
y <- c(5, 6, 7, 8)
z <- c(3, 4)
w <- c(5, 6, 7)
x+2
x+y
x+z
x+w

# 벡터 연산에 유용한 함수
x=1:10
x>5
all(x>5)
any(x>5)

head(x)
tail(x)
head(x, 3)
tail(x, 3)

# union intersect setdiff setequal : 벡터 간 집합 연산
x <- c(1, 2, 3)
y <- c(3, 4, 5)
z <- c(3, 1, 2)
union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)
setequal(x, y)
setequal(x, z)


# 배열
x <- array(1:5, c(2, 4))
x
x[1, ]

# 행과 열 이름 설정
dimnamex = list(c("1st", "2nd"), c("1st", "2nd", "3rd", "4th"))
x <- array(1:5, c(2,4), dimnames = dimnamex)
x
x["1st", ]
x[,"4th"]

# matrix 함수: 2차원 배열 생성
x <- 1:12
x
matrix(x, nrow = 3)
matrix(x, nrow=3, byrow=T)  # 행 우선

# 벡터를 묶어 배열 생성
v1 <- c(1, 2, 3, 4)
v2 <- c(5,6,7,8)
v3 <- c(9, 10, 11, 12)
cbind(v1, v2, v3)
rbind(v1, v2, v3)

# 2x2 행렬 2개를 각각 x, y에 저장
x <- array(1:4, dim = c(2, 2))
y <- array(5:8, dim = c(2, 2))
x
x+y
x-y
x*y

# apply 함수: 행 열로 함수 적용
x <- array(1:12, c(3, 4))
x

apply(x, 1, mean)
apply(x, 2, mean)
dim(x)
sample(x)
sample(x, 10)
sample(10)

# 데이터프레임
name <- c("하나", "두나", "세나")
age <- c(22, 20, 25)
gender <- factor(c("M", "F", "M"))
blood <- factor(c("A", "O", "B"))
patients <- data.frame(name, age, gender, blood)
patients
test <- data.frame()
test <- edit(test)

# 데이터 프로엠 요소에 접근 $, [,]
patients
patients$name
patients[1, ]
patients[, 2]
patients[3, 1]
patients[patients$name=='하나',]
patients[patients$name=='하나', c('name', 'age')]  # 하나의 이름과 나이 추출


# 데이터프레임에 유용한 함수
head(cars)
speed
attach(cars)
speed
detach(cars)
speed

# 데이터 속성을 이용해 함수 적용
mean(cars$speed)
max(cars$speed)
mean(speed)

# subset 일부 데이터만 추출
subset(cars, speed > 20)
subset(cars, speed > 20, select = c(dist))
subset(cars, speed > 20, select = -c(dist))

# list
patients <- data.frame(name=c("하나", "두나", "세나"),
                       age=c(22, 20, 25),
                       gender=factor(c("M", "F", "M")),
                       blood=factor(c("A", "O", "B")))
no.patients <- data.frame(day=c(1:6),
                          no=c(50, 60, 55, 52, 65, 58))
# 데이터를 단순 추가
listPatients <- list(patients=patients, no.patients=no.patients)
listPatients

listPatients$patients
listPatients[[1]] # 인덱스 입력
listPatients[["patients"]]  # 요소명을 ""에 입력
lapply(listPatients$no.patients, mean)  # 평균 구하기
sapply(listPatients$no.patients, mean)


name <- c("김수민", "소다영", "김소담", "김지원", "문주일", "서현택")
age <- c(26, 22, 26, 24, 27, 28)
gender <- c("F", "F", "F", "F", "M", "M")
major <- c("Enviroment", "BigData", "Statistics", "Computer", "Management", "Statistics")
member <- data.frame(name, age, gender, major)
member

# 문제1.
# 전공이 통계학인 사람의 데이터를 출력하라
subset(member, major=="Statistics")
# 문제2. 
# 성별이 여자이고 나이가 25이하인 사람의 이름을 출력하라
subset(member, age<=25, select=name)
# 문제3.
# 성별과 전공만 출력하라
subset(member, select=c(gender, major))



students <- read.table("C:/Users/User/Desktop/sht3898/Intern/Ｒ/students.txt", header=T)
students
str(students)

# name 속성을 요인에서 문장으로 변경
students$name <- as.character(students$name)
str(students)


test = c(15, 20, 30, NA, 45)
test[test<40] # 값이 40 미만인 요소 추출
test[test%%3!=0]
test[is.na(test)]
test[!is.na(test)]
test[test%%2==0&!is.na(test)]


characters <- data.frame(name=c("하나", "두나", "세나"),
                         age=c(30, 16, 21),
                         gender=factor(c("M", "F", "M")))
characters
characters[characters$gender=="F",]
characters[characters$age<30&characters$gender =="M",]

# if문
x <- 5
if (x%%2==0){
  print('x는 짝수')
}else{
  print('x는 홀수')
}

x <- -1
if(x>0){
  print('x is a positive value')
}else if(x<0){
  print('x is a negative value')
}else{
  print('x is zero')
}


x <- c(-5:5)
options(digits = 3)
sqrt(x)
sqrt(ifelse(x>=0, x, NA))


# 반복문
i <- 1
repeat{
  if(i>10){
    break
  }else{
    print(i)
    i = i+1
  }
}

# while
i <- 1
while(i <= 10){
  print(i)
  i = i + 1
}

# for
for(i in 1:9){
  print(paste(2, "x", i, "=", 2*i))
}

for (i in 1:10){
  if(i%%2==0){
    print(i)
  }
}


# transMile() 함수 작성
transMile <- function(x) {
  tmile = x*1.6
  result = paste(tmile, "km", sep = "")
  return(result)
}
transMile(5)

fact <- function(x){
  fa = 1
  while(x>1){
    fa = fa*x
    x = x-1
  }
  return(fa)
}

fact(5)

cat("5!을 계산한 결과는", fact(5), "입니다.")



# 문제1. for문을 이용해 구구단 2~9단 만들기
for(i in 2:9){
  for(j in 1:9){
    print(paste(i, "x", j, "=", i*j))
  }
}

# 문제2. 1부터 100까지의 수 중에서 3의 배수이면서 4의 배수는 아닌 수의 합을 구하라
func1 <- function(x){
  total <- 0
  for(i in 1:x){
    if(i%%3==0&i%%4!=0){
      total <- total + i
    }
  }
  return(total)
}
func1(100)

# 문제3. x와 n을 입력하면 1부터 n까지의 수 중에서 x의 배수 합을 구해주는 사용자 정의 함수를 만들어라
multipsum <- function(x, n){
  total <- 0
  for(i in 1:n){
    if(i%%x==0){
      total <- total+i
    }
  }
  return(cat("1부터", n,"까지의 수 중에서", x,"의 배수 합은", total,"입니다"))
}
multipsum(3, 100)



# 결측값 처리
# is.na 함수 이용
str(airquality)
head(is.na(airquality))
table(is.na(airquality))
table(is.na(airquality$Temp))
table(is.na(airquality$Ozone))
mean(airquality$Temp)
mean(airquality$Ozone)
air_narm <- airquality[!is.na(airquality$Ozone),]
mean(air_narm$Ozone)
air_narm1 <- na.omit(airquality)
mean(air_narm1$Ozone)
mean(airquality$Ozone, na.rm = T)

# 이상값 처리
patients <- data.frame(name=c("하나", "두나", "세나", "네나", "다나"),
                       age=c(22, 20, 25, 30, 27),
                       gender=factor(c("M", "F", "M", "K", "F")),
                       blood=factor(c("A","O","B","AB","C")))
patients
patients_outrm <- patients[patients$gender=="M"|patients$gender=='F', ]
patients_outrm

patients_outrm1 <- patients[(patients$gender=='M'|patients$gender == 'F')
                            &(patients$blood=='A'
                              |patients$blood=='B'
                              |patients$blood=='O'
                              |patients$blood=='AB'),]
patients_outrm1

patients <- data.frame(name=c("하나", "두나", "세나", "네나", "다나"),
                       age=c(22, 20, 25, 30, 27),
                       gender=c(1, 2, 1, 3, 2),
                       blood=c(1,3,2,4,5))
patients
patients$gender <- ifelse((patients$gender<1|patients$gender>2),
                          NA, patients$gender)
patients
patients$blood <- ifelse((patients$blood<1|patients$blood>4),
                         NA, patients$blood)
patients
patients[!is.na(patients$gender)&!is.na(patients$blood),]

# 이상값 처리
boxplot(airquality[, c(1:4)])
boxplot(airquality[,1])$stats

air <- airquality
table(is.na(air$Ozone))

air$Ozone <- ifelse(air$Ozone<1|air$Ozone>122, NA, air$Ozone)
table(is.na(air$Ozone))

air_narm <- air[!is.na(air$Ozone),]
mean(air_narm$Ozone)
boxplot(air_narm$Ozone)$stats


## 데이터 가공
install.packages("gapminder")
install.packages("dplyr")
library(gapminder)
library(dplyr)
glimpse(gapminder)

gapminder[, c("country", "lifeExp")]
gapminder[, c("country", "lifeExp", "year")]
gapminder[1:15,]

# gapminder 라이브러리
gapminder[gapminder$country == 'Croatia', ]
gapminder[gapminder$country == 'Croatia', 'pop']
gapminder[gapminder$country == 'Croatia', c('lifeExp', 'pop')]
gapminder[gapminder$country == 'Croatia' & gapminder$year > 1990, c('lifeExp', 'pop')]
head(gapminder)

select(gapminder, country, year, lifeExp)
filter(gapminder, country == 'Croatia')

summarise(gapminder, pop_avg=mean(pop))
summarise(group_by(gapminder, continent), pop_avg=mean(pop))
summarise(group_by(gapminder, continent, country), pop_avg=mean(pop))

summarise(group_by(gapminder, continent, country),
          pop_avg=mean(pop))

gapminder %>%
  group_by(continent, country) %>%
  summarise(pop_avg=mean(pop))

temp1 <- filter(gapminder, country == 'Croatia')
temp2 <- select(temp1, country, year, lifeExp)
temp3 <- apply(temp2[,c('lifeExp')], 2, mean)
temp3
gapminder %>%
  filter(country == 'Croatia') %>%
  select(country, year, lifeExp) %>%
  summarise(lifeExp_avg = mean(lifeExp))


# 아보카도
avocado <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Intern\\Ｒ\\avocado.csv', header=TRUE, sep=',')
str(avocado)
(x_avg <- avocado %>%
    group_by(region) %>%
    summarize(v_avg=mean(Total.Volume), P_avg=mean(AveragePrice)))

(x_avg <- avocado %>%
    group_by(region, year) %>%
    summarize(V_avg=mean(Total.Volume), P_avg=mean(AveragePrice)))

(x_avg <- avocado %>%
    group_by(region, year, type) %>%
    summarize(V_avg=mean(Total.Volume), P_avg=mean(AveragePrice)))

install.packages("ggplot2")
library(ggplot2)

(x_avg %>%
    filter(region != 'Totalus') %>%
    ggplot(aes(year, V_avg, col=type))+geom_line()+facet_wrap(~region))

arrange(x_avg, desc(V_avg))

install.packages("lubridate")
library(lubridate)

(x_avg <- avocado %>%
    group_by(region, year, month(Date), type) %>%
    summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))

wine <- read.table('C:\\Users\\User\\Desktop\\sht3898\\Intern\\Ｒ\\wine.data.txt', header=TRUE, sep=',')
head(wine)
train_set <- sample_frac(wine, 0.6)
str(train_set)


# 전기 생산량
# 데이터 구조 변경
elec_gen <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Intern\\Ｒ\\electricity_generation_per_person.csv', header=TRUE, sep=',')
names(elec_gen)
names(elec_gen) <- substr(names(elec_gen), 2, nchar(names(elec_gen)))
names(elec_gen)

elec_use <- read.csv('C:\\Users\\User\\Desktop\\sht3898\\Intern\\Ｒ\\electricity_use_per_person.csv', header=TRUE, sep=',')
names(elec_use)[2:56] <- substr(names(elec_use)[2:56], 2, nchar(names(elec_use)[2:56]))
names(elec_use)[2:56]

install.packages("tidyr")
library(tidyr)
elec_gen_df <- gather(elec_gen, -ountry, key="year", value = "ElectricityGeneration")
names(elec_gen_df) <- c("country", "year", "ElectricityGeneration")
elec_use_df <- gather(elec_use, -country, key="year", value = "ElectricityUse")
elec_gen_use <- merge(elec_gen_df, elec_use_df)
elec_gen_use

gapminder[gapminder$country=='South Korea' & gapminder%year>1990, c('lifeExp', 'pop')]
gapminder
