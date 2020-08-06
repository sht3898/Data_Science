## 0817 Pandas

## 파이썬이 인기가 있는 이유는 기본 자료구조인
## 리스트, 튜플, 딕셔너리가 굉장히 사용하기 편하고
## 데이터를 다루는 데 효과적이기 때문

## 또한 파이썬이 오픈소스 기반의 통계언어인 R과
## 더불어 빅데이터 분석 분야에 인기가 높아진 것은
## 여러 가지 이유가 있지만, 이번에 배우게 될
## Pandas라는 라이브러리가 큰 이유!!

## Pandas의 핵심 자료구조인 Series와 Dataframe.
## 1) series는 1차원 데이터를 다루는 데 효과적인 자료구조
## 2) dataframe은 행과 열로 구성된 2차원 데이터를 다루는 데 효과적


'''
그 전에 알아야 할 것들
import numpy as np
1.import pandas (pandas. 함수)
2.import pandas as pd(pd.함수명)
3.from pandas import Series, DataFrame(바로 함수명) 귀찮음을 덜기위해
'''

## dictionary
## 파이썬 자료구조 5가지
## 숫자형, 문자형, 리스트, 튜플, 딕셔너리

## key와 value
## {Key1:Value1, Key2:Value2, Key3: Value3 ...} 괄호가 다 다름
exam_dic = {'name' : 'Hyun Taek', 'phone' : '92443898','birth':'1011'}
exam_dic

#%%
from pandas import Series, DataFrame
## 1. Pandas의 Series
## Series는 파이썬의 리스트와 튜플 같은 1차원 배열의 자료구조
## 차이점은?!

data1 = Series([10,20,30,40,50])
print(data1)
## Series 는 파이썬의 리스트와 튜플과 같은 1차원 배열의 자료구조
## 0부터 시작하는 정수값으로 인덱싱된다.

list = [1,2,3,4,5]
list[0]

print(data1[0])
data1.index
data1.values

data2 = Series([20,40,60,80,100], index = ['a','b','c','d','e'])
data2

## Serires 객체 내의 데이터는 1차원으로 저장되어 있지만
## 파이썬의 딕셔너리와 유사하게 값과 이에 대응되는 인데스
## 값이 서로 연결되어 있다.

print(data2['a'])
data2['a']
data2[data2>0]
data2*2

data1 = Series([10,20,30,40,50], index = ['b','e','a','d','c'])
data2 = Series([20,40,60,80,100], index = ['a','b','c','d','e'])
data1+data2
#%%

## 1. Pandas의 DataFrame
## DataFrame는 여러 개의 열로 구성된 2차원 형태의 자료구조
## DataFrame 객체를 생성하는 가장 쉬운 방법은 파이썬의 딕셔너리를 사용

col_data = {'col0' : [1,2,3,4],
            'col1' : [10,20,30,40],
            'col2' : [100,200,300,400]}

data = DataFrame(col_data)
data
## 'col0', 'col1', 'col2'라는 문자열은 DataFrame의 각 열을 인덱싱.
## 행 방향으로는 Series와 유사하게 정숫값으로 자동 인덱싱.

data['col0']
data['col1']
data['col2']
type(data['col0'])
## DataFrame을 인덱스가 같은 여러 개의 Series 객체로 구성된 자료구조로 생각
## 기술통계 계산과 요약, 상관관계와 공분산, 각종 통계들... 수없이 많다!!

#%% csv 파일 불러오기

import pandas as pd

csv_test = pd.read_csv('C:\\Users\\sht3898\\Desktop\\zigbak\\0817\\test_csv_file.csv')
csv_test
