##0802 NumPy1

#%%
## 1_NumPy(Numerical Python)
## 1) 고성능의 수치 계산을 하기 위해 만들어진 python package
## 2) 선형대수, 무작위 난수 생성 등에 사용
## 3) list 자료구조와 유사, list보다 데이터 처리 속도가 빠름
## 파이썬을 이용한 데이터 분석을 하기 위해서는
## pandas와 numpy를 익혀야만 보다 효율적인 데이터 분석이 가능

## ndarray(n-dimentional array) : 다차원 배열
## array([list]) : 다차원 배열 데이터 생성
## np.array() -> ndaaray
## list와 ndarray의 차이점?(list와 배열)
## list안에는 다양한 형태의 데이터, ndarray안에는 동일한 형태의 데이터

a=[1,2,3,4,5]
b=[1,2,3,4,"Kim"]
##f9 일부분만 실행
##ctrl+Enter : 다음 셀로 넘어가면서 실행
##shift+Enter : 다음 셀로 안넘어가고 실행

'''
import numpy
:numpy의 모든 객체를 numpy.obj 형식으로 불러 사용할 수 있다.

import numpy as np ***
:numpy의 모든 객체를 np.obj 형식으로 불러 사용할 수 있다.

from numpy import *
:numpy의 모든 객체를 내장 함수(객체)처럼 사용할 수 있다.
'''

import numpy as np
#%%
## 1. 단일 리스트
list1 = [1,2,3,4,5]
arr1 = np.array(list1)
print(arr1)
arr1 = np.array([1,2,3,4,5])
type(list1)
type(arr1)
#위와 같이 두 가지 방법이 있음

#%%
## 2. 중첩 리스트 ***
list2 = [[1,2,3,4,5],[6,7,8,9,10]]
list3 = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]
arr2 = np.array(list2)
arr3 = np.array(list3)
print(arr2)
##arr2 : 2차원 배열
print(arr2[1,3])
print(arr2[0,2])
##배열은 0부터 시작
print(arr2 *0.5)
##배열의 원소들에 각각 0.5씩을 곱해준 형태

## array.shape : 다차원 배열의 차원과 그룹 안의 원소들의 크기를 확인할 때
arr2.shape # 2차원이고 그룹 안의 원소가 5개
arr3.shape
arr2.shape[0]
arr2.shape[1]

## array.dtype : 데이터 유형 확인
arr2.dtype

## np.asfarray() : float 데이터 형태를 원소로 가지는 배열
c = [1,2,3,4,5]
np.asfarray(c)

## arange(n) : 0~(n-1) wjdtn todtjd
np.arange(10)

## 자동으로 채워지는 행렬 데이터 만들 때
## np.zeros() : 0으로 채워진 배열 데이터 생성
## np.ones() : 1로 채워진 배열 데이터 생성
## np.eye() or np.identity() : 단위 행렬 데이터 생성

np.zeros(5)
np.zeros((3,5))
np.ones((5,3,2))
o = np.ones((5,3,2))
o.shape[0]

#%% NumPy2

## 무작위 표본 추출, 난수 생성
## Random Sampling, Random Number Generation
import numpy as np

## 정규분포를 따르는 갯수가 5개인 무작위 샘플
np.random.normal(size=5)

## seed : 난수 생성 초기값 부여
## 누가, 언제 하든지 간에 똑같은 난수 생성을 원할 때
np.random.seed(seed=100)
np.random.normal(size=5)

## 다차원의 array 형태로 무작위 샘플을 생성해보자.
np.random.normal(size=2)
np.random.normal(size=(2,3))
np.random.normal(size=(2,3,4))

## 이산형 확률분포(discrete probability distribution)
'''
1. 이항분포 2. 포아송분포 3. 초기하분포

1) 이항분포로부터 무작위 표본 추출
    np.random.binomial(n,p,size)
    앞(1) 또는 뒤(0)에 나올 확률이 각각 50%인 동전 던지기를 20회
'''
np.random.binomial(n=1,p=0.5,size=100)
sum(np.random.binomial(n=1,p=0.5,size=100)==1)/100
## 전체(100회) 중 앞이 나온 비율

'''
2) 초기하분포로부터 무작위 표본 추출(Hypergeometric distribution)
    np.random.hypergeometric()
    good이 5개, bad가 20개인 모집단에서 5개의 샘플을 무작위로 추출(비복원)
'''
hyp = np.random.hypergeometric(ngood=5,nbad=20,nsample=5,size=100)
hyp

'''
3) 포아송분포로부터 무작위 표본 추출(Poisson distribution)
    np.random.poisson(lam, size)
    일정한 단위 시간 혹은 공간에서 무작위로 발생하는 사건의 평균 횟수인 람다가 20인
    포아송분포로부터 100개의 난수 생성
'''

poisson = np.random.poisson(lam = 20, size = 100)
poisson

#%%
## 연속형 확률 분포(Continuous probability distribution)
'''
정규분포, t분포, 균등분포, F분포, 카이제곱분포

1) 정규분포로부터 무작위 표본 추출(Normal distribution)
    np.random.normal(mu, sigma, size)
    평균이 0, 표준편차가 3인 정규분포로부터 난수 100개를 생성
'''

norm = np.random.normal(0, 3.0, size = 100)
norm

'''
2) t분포로부터 무작위 표본 추출(t distribution)
    np.random.standard_t(df, size)
    자유도가 3인 t분포로부터 100개의 난수 생성
'''
t = np.random.standard_t(3,100)
t

'''
3) 균등분포로부터 무작위 표본 추출(Uniform distribution)
    np.random.uniform(low, high, size)
    최솟값이 0, 최댓값이 10인 구간에서 균등분포에서 100개 난수 생성
'''
unif = np.random.uniform(0,10,100)
unif


'''
4) F분포로부터 무작위 표본 추출(F distribution)
    np.random.f(dfnum, dfden, size)
    자유도 1이 5, 자유도 2가 10인 F분포로부터 100개의 난수 생성
'''
np.random.seed(seed=100)
f = np.random.f(5,10,100)
f


'''
5) 카이제곱분포로부터 무작위 표본 추출(Chisq-distribution)
    np.random.chisquare(df,size)
    자유도가 2인 카이제곱분포로부터 100개의 난수 생성
'''
chisq = np.random.chisquare(2, 100)
chisq

##histogram
import matplotlib.pyplot as plt

count, bins, ignored = plt.hist(chisq, bins=20, normed = True)

## numpy, pandas