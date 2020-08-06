#%% class(붕어빵 기계)
'''
class 클래스명:
    1. 변수 선언 = 초기화 - > data 저장
    2. 생성자 - > Object 생성
    3. def 함수명(인수) - > 기능 수행
        실행문
'''
## 객체 생성 과정 단계
## class 정의 - > object 생성(생성자) - > 참조변수
## 중요한 개념!! 공부 필수

## 1. 사용자 정의 클래스 ***
## 단계 1_ 클래스 정의

class Today: 
    #1. 멤버변수 : data 저장
    year = 2017 # 변수 초기화
    month = None # null
    day = None
    #2. 생성자 : 객체 생성 역할(객체를 생성할 때 호출되는 함수)
    #           객체 생성시 초기화를 위해 필요
    def __init__(self, year, month, day):
        # class 멤버변수 초기화
        self.month = year
        self.year = month
        self.day = day
        
    #3. 멤버함수 : 기능 정의
    def display(self):
        print('%d년-%d월-%d일' % (self.year, self.month, self.day))

## 단계 2_ 객체 생성(생성자 이용)
## 참조변수 = 생성자(실인수)
today = Today(2017, 5, 18) # 생성자를 이용해서 객체를 생성

## 단계 3_ 참조변수 이용 멤버(변수 + 함수) 호출
## 참조변수.멤버함수
today.display()
print(today.year, today.month, today.day)

######
class Person:
    # 멤버변수
    name = None
    gender = None
    age = 0
    # 생성자
    def __init__(self, name, gender, age):
        self.name = name
        self.gender = gender
        self.age = age
    # 멤버함수
    def display(self):
        print('이름: %s, 성별: %s' %(self.name, self.gender))
        print('나이: %d' %(self.age))

name = input('이름:')
gender = input('성별(male/female):')
age = int(input('나이:'))

# 객체 생성
human = Person(name, gender, age)

# 멤버함수 호출
human.display()
#%% self 배우기!
class foo:
    def func1():
        print("function1")
    def func2(self):
        print("function2")
        
f = foo()   # f라는 이름을 가진 foo 클래스의 객체(인스턴스)를 생성
f.func2()
f.func1()   # error
# error : func1()는 인자가 없지만 하나를 받았다.
# 왜냐하면 파이썬 메서드는 첫 번째 인자로 항상 객체(인스턴스)가 전달되기 때문

# 인스턴스.메서드 형태가 아닌 클래스명.메서드 형태로 호출해보자!
# 둘 방법에는 아무 차이 없지만 보통 인스턴스.메서드 형태를 자주 사용
foo.func1()
foo.func2() # error
# error : func2를 호출할 때 인자 하나(self)를 빠뜨림.

#%% 모듈 module

## 모듈(module)
## 모듈 : 변수, 클래스, 함수 등과 같은 여러 코드를 한 곳에 모아놓은 코드의 모음.
## 장점 : 코드의 재사용성 극대화!!

import math
## math는 내장 모듈
dir(math)
## dir 함수를 사용하면 그 모듈 내에 있는 여러가지 데이터 & 함수를 알 수 있다.
math.sin(90)
math.pi
## 모듈은 파일(.py)로 저장되어있다.
## 모듈을 만들어보자.

import mod1
dir(mod1)
mod1.plus(3, 4)
mod1.minus(5, 2)

## from 모듈명 import 어트리뷰트(함수)
from mod1 import plus
plus(3, 4)

mod1.minus(5, 3)

## 끝 : )







        








