#%%
import networkx as nx # 라이브러리를 nx로 불러오기

import matplotlib.pyplot as plt # plt로 불러오기
 
G = nx.Graph() # 빈 그래프 구조 G 생성

G.add_edge(1,2) # 엣지 추가

nx.draw(G) # 그래프 G 그리기

plt.show() # pyplot으로 보여주기

#%%
G = nx.Graph()

G.add_node('apple') # 노드 'apple' 추가

G.add_nodes_from(['banana', 'kiwi', 'mango'])
# 리스트로 추가1

fruits = ['banana',' kiwi', 'mango']
G.add_nodes_from(fruits) #리스트로 추가2

G.nodes()

#%%
G = nx.Graph()
G.add_edge('apple','banana') # 노드 'apple' 추가
#G.add_edges_from(['banana', 'kiwi', 'mango'])
relations = [('apple','mango'),('apple','kiwi')]
G.add_edges_from(relations)
G.edges()

#%%
G.nodes()
G.node['kiwi']
G.node['kiwi']['kind'] = 'fruit'
G.node['kiwi']
G.nodes(data=True)

#%%
G.nodes()
G.node['kiwi']
G.node['kiwi']['kind'] = 'fruit'
G.node['kiwi']

G.add_node('kiwi', kind = 'fruit')
G.add_nodes_from(['banana', 'apple'], kind = 'fruit')
G.node['banana']
#%%
G.edges()
G.edges(data=True)

G.add_edge('apple', 'mango', weight = 2.5)
G.add_edges_from(relations, color = 'blue')
G['apple']['mango']['weight']=5
G.edges[('apple','kiwi')]['weight']=2
G.edges(data=True)
