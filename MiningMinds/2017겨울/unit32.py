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
