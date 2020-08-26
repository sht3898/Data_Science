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
