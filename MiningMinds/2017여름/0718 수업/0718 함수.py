#%%
## 형변환
age = 25     # age는 정수형
birth = "19930906" # birth는 문자열

a = str(age)    # age를 문자열형으로 형변환
b = int(birth)  # birth를 정수형으로 형변환

print(a)
print(b)

## 사용자로부터 입력을 받은 문자열을 정수형으로

a = input('첫번째 숫자 입력:')
b = int(input('두번째 숫자 입력:'))
## input()은 사용자로부터 무언가를 입력받을수 있는 기능
## 하지만 input을 통해 입력되는 것은 숫자를 입력하더라도 문자열형으로 입력됨.
## 즉, 형변환이 필요!!

add = a + b
print('add = %.3f' % add)

## print 출력 양식
## print('%양식문자' % (변수))
## %s : 문자열, %c: 한 개 문자, %d : 정수, %f : 실수

## 문1) 다음 사다리꼴을 보고 넓이를 구하시오.
## [밑변 = 10, 윗변 = 7, 높이 = 9]
## 조건1) 데이터는 사용자로부터 키보드로 입력받음.
## 조건2) 출력은 소수점 3자리까지 출력
## 조건3) 사다리꼴 넓이 = (밑변 + 윗변) * 높이 / 2

down = float(input("밑변을 입력하시오:"))
up = float(input("윗변을 입력하시오:"))
height = float(input("높이을 입력하시오:"))
 
area = (down + up) * height / 2

print("사다리꼴의 넓이는 %.3f입니다." %(area))

#%% 함수(function)
## 함수
## 1. 내장함수
## 2. 사용자 정의 함수

## 1) 내장함수 : python에서 제공하는 함수
## 이미 만들어져 있다.

data = [1, 2, 3, 4, 5]
print('합계:', sum(data))
print('평균:', mean(data))
print('최소값:', min(data))
print('최대값:', max(data))
print('길이:', len(data))

## eval() : 문자열을 수식으로 변경하는 기능
a = 10.5
b = eval('a + 3.14547')
print('b = ', b)

## round() : 소수점 반올림 하는 기능
print(round(b, 2))

## 2) 사용자 정의함수
'''
def 함수명(인수):
    실행문
    실행문...
    return 반환값
'''

## 1_ 인수가 없는 함수
## 2_ 인수가 있는 함수
## 3_ return값이 있는 함수

## 1) 인수가 없는 함수
def userFunc1():
    print('userFunc1')
    
userFunc1()

## 2) 인수가 있는 함수
def userFunc2(name):
    print('hello', name, '!!')
    
userFunc2('정재환')
#%%
## 3) return값이 있는 함수

def userFunc3(a, b):
    calc = a + b
    return calc
    
a = int(input('첫 번째 수 입력:'))
b = int(input('두 번째 수 입력:'))
result1 = userFunc3(a, b)
print('반환값1:', result1)

result2 = userFunc3('안녕하세요', '홍길동입니다.')
print('반환값2:', result2)
## 파이썬에만 있는 기능, 문자열 덧셈
















