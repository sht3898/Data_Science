#%%first cell
## 0704
## 파이썬 제대로 알자

## 1.파이썬 IDE(Integrated Development Enviroment)
## 효율적으로 소프트웨어를 개발하기 위한 개발환경 소프트웨어 어플리케이션
## 다양한 기능을 포함한 종합세트

## 대표적인 예
## R : Rstudio
## Java : Eclipse
## C/C++ : Visual Studio
## 파이썬 : PyCharm, Eclipse, Spyder
## 
## 아나콘다(Anaconda)
## 파이썬 : 튜닝 전, 아나콘다 : 수학, 과학 분야의 패키지로 튜닝한 파이썬


## 파이썬의 5가지 자료구조, 변수 유형

## 1_수
## 2_문자열
## 3_리스트
## 4_튜플
## 5_사전, 집합

## 1.수 : 정수, 실수, 복소수

## 1) 연산자
## +,-,*,/
## % : 나눗셈의 나머지, // : 나눗셈의 몫,  **:지수


5 / 2
5 // 2

## 2.문자열
## 1)문자열 생성 : ' ', " "
## 2)문자열 인덱싱
## 3)문자열 분리(슬라이싱)
## 4)문자열 합치기
## 5)문자열 반복하기

## R과 파이썬 문자열 차이
#%% second cell
a='Hello World'
a[0]

##3,4,5 리스트, 튜플, 사전&집합=>많음

#%% third cell
##if문, while문, for문
##파이썬의 for문의 쓰임새는 다른 언어와는 차이가 있다
a=[4,5,6,7]
for i in a:
    print(i)

##과제1. 국어(90), 영어(98), 수학(100)을 이용해서 총점, 평균을 구하고 평균을 이용해서 수우미양가를 입력(elif문 사용)
point=[90,98,100]
sum_point=point[0]+point[1]+point[2]
aver = sum_point/len(point)
if aver>90:
    grade= '수'
elif aver>80:
    grade= '우'
elif aver>70:
    grade= '미'
elif aver>60:
    grade= '양'
else:
    grade= '가'
    
print(grade)

#%% forth cell
##과제2. 0부터 20까지 짝수들의 합을 구하라(while)
sum=0
i=0
while i<=20:
    sum += i
    i+=2
print(sum)
#%% fifth cell
##과제3. 위의 for문을 range처럼 이용해서 똑같이 출력되도록 만들어보자
for i in range(4,8):
    print(i)
    
#%% sixth cell
"""
def 함수명(입력 인수):
    <수행할 문장1>
    <수행할 문장2>
    ...
"""
def sum(a,b):
    return a+b
sum(2,4)

##클래스 : 가수, 객체 : 지드래곤
class Singer:
    def sing(self):
        return "lalala~"
    
gd = Singer()
gd.sing()

## 패키지 맛보기 : Numpy

## 선형대수(배열, 행렬) 연산에 효과적인 함수를 제공하는 패키지
## list 자료구조와 유사
## list보다 데이터 처리 속도가 빠름
## array([list]) : 다차원 배열 데이터 생성

import numpy as np
arr = np.array([1,2,3,4,5])
np.mean(arr)
np.sum(arr)
np.max(arr)
np.min(arr)
np.var(arr)
np.std(arr)

print("평균:", np.mean(arr))
