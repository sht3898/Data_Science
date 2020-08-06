# -*- coding: utf-8 -*-
"""
Created on Tue Feb 27 19:19:17 2018

@author: HyunTaek
"""
#%%
import numpy as np
import matplotlib.pyplot as plt

a=np.arange(-3.0,3.0,0.01)

plt.plot(a,1/a,label='y=1/x')
plt.plot(a,a,label='y=x')
plt.plot(a,a**2,label='y=x^2')
plt.plot(a,a**3,label='y=x^3')
plt.ylim(-3,3)
plt.grid(True)
plt.legend(loc=2)
plt.xlabel('X')
plt.ylabel('Y')
plt.show()

#%% 
plt.subplot(221)
plt.ylim(-3,3)
plt.plot(a,1/a,label='y=1/x')
plt.legend(loc=2)

plt.subplot(222)
plt.plot(a,a,label='y=x')
plt.legend(loc=2)

plt.subplot(223)
plt.plot(a,a**2,label='y=x^2')
plt.legend(loc=2)

plt.subplot(224)
plt.plot(a,a**3,label='y=x^3')
plt.legend(loc=2)

plt.show()

#%% 