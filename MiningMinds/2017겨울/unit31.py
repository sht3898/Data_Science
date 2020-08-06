#%%

# unit31. Pandas 데이터 구조에 익숙해지기

# 1. 시리즈
"""
시리즈 - 1차원 데이터 벡터

시리즈에 속한 모든 엘리먼트는 하나의 데이터 타입에 속해야 함
"""
import numpy as np # numpy 모듈
import pandas as pd # pandas 모듈
inflation = pd.Series((2.2, 3.4, 2.8, 1.6, 2.3, 2.7, 3.4, 3.2, 2.8, 3.8, -0.4, 1.6, 3.2, 2.1, 1.5, 1.5))
inflation
len(inflation) # inflation의 길이
inflation.values # inflation의 값들
inflation.index # inflation의 인덱스
inflation.index.values # inflation의 인덱스의 값

"""
pandas는 이미 만든 것을 또 만들지 않고 numpy 배열을 저장공간으로 사용함
"""

inflation.values[-1] = 1.6 # inflation의 마지막 값을 1.6으로 바꿈
inflation.values
inflation = pd.Series({1999 : 2.2, 2000 : 3.4, 2001 : 2.8, 2002 : 1.6, 2003 : 2.3, 2004 : 2.7, 2005 : 3.4, 2006 : 3.2, 2007 : 2.8, 2008 : 3.8, 2009 : -0.4, 2010 : 1.6, 2011 : 3.2, 2012 : 2.1, 2013 : 1.5, 2014 : 1.6, 2015 : np.nan})
inflation

inflation = pd.Series((2.2, 3.4, 2.8, 1.6, 2.3, 2.7, 3.4, 3.2, 2.8, 3.8, -0.4, 1.6, 3.2, 2.1, 1.6, 1.5))
inflation.index = pd.Index(range(1999,2015)) # inflation의 index를 1999부터 2015까지의 수로 설정함
inflation[2015] = np.nan # inflation의 2015의 값을 nan으로 설정
inflation

inflation.index.name = "Year" # inflation의 인덱스 값을 Year로 설정
inflation.name = "%" # inflation의 name을 %로 설정
inflation
inflation.head()
inflation.tail()

#%%

# 2. 프레임

"""
데이터 프레임 - 레이블이 붙은 행과 열로 구성된 테이블
2차원 numpy 배열, 튜플로 구성된 리스트, 파이썬 딕셔너리와 또 다른 데이터 프레임으로 생성 가능
"""

import pandas as pd
alco2009 = pd.read_csv("niaaa-report2009.csv", index_col = "State")
alco2009

"""
alco2009를 만드는 다른 방법1

alco2009 = pd.DataFrame([(1.20, 0.22, 0.58),
                         1.31, 0.54, 1.16),
                        ...
                        columns = ("Beer", "Wine", "Spirits"),
                        index = ("Alabama", "Alaska", ...)])

alco2009를 만드는 다른 방법2(열로 구성된 딕셔너리)

alco2009 = pd.DataFrame({"Beer" : (1.20, 1.31, 1.19, ...),
                         "Wine" : (0.22, 0.54, 0.38, ...),
                         ...})
"""

alco2009["Wine"].head()

alco2009.Beer.tail()

alco2009["Total"] = 0
alco2009.head()
#%%
# unit32. 데이터 모양 바꾸기
# 1. 인덱싱
import pandas as pd
alco2009 = pd.read_csv("niaaa-report2009.csv", index_col = "State")
alco2009
alco2009.columns.values
alco2009.index.values
alco2009.reset_index().set_index("Beer").head()
alco2009.ix["Nebraska"]
"Samoa" in alco2009.index
#%%
# 2. 재인덱싱
