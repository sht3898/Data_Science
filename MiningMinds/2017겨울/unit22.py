#%%
#unit22
import numpy as np
x1=3*np.random.random(10)
x2=np.arange(-1,1,0.2)
x3=np.random.random(10)+np.arange(0,1,0.1)
y=10*x1+3*x2+np.random.random(10)

def multireg2(y,x1,x2):
    n = len(y)
    if (n != len(x1)) | (n != len(x2)):
        print("Error")
        return null
    X = np.array([np.ones(n), x1, x2])
    X = X.T
    from numpy.linalg import inv
    return inv(X.T @ X) @ X.T @ y
multireg2(y,x1,x2)

#%%
#unit25
data = np.random.random(20)*10
data[len(data)-1] = np.random.random(1)*50

outlier = (data<(np.mean(data)-3*np.std(data)))|(data>(np.mean(data)+3*np.std(data)))
outlier


#%%
#unit27
np.pv
data=data[0:19]
mu=5
def MUtest(data):
    if ((np.mean(data)-mu)/np.std(data) > 1.96) | ((np.mean(data)-mu)/np.std(data) < -1.96):
        print('"H0: 모평균은 5"라는 귀무가설을 기각한다.')
    else:
        print('"H0:모평균은 5"라는 귀무가설을 기각하지 않는다.')
MUtest(data)