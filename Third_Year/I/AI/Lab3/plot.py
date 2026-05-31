import networkx as nx
import numpy as np
import matplotlib.pyplot as plt

A = np.array([[1, 1],[2, 1]])
G = nx.from_numpy_array(A)
nx.draw(G, with_labels=True)
plt.show()
