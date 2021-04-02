import numpy as np
from matplotlib import pyplot as plt
import math

U = np.arange(0,1,0.01)
def gaussmf(x, alpha, r):
  return 1./(math.sqrt(alpha**math.pi))*np.exp(-alpha*np.power((x - r), 2.))

A = gaussmf(U,0.350,0.5)

plt.plot(U, gaussmf(U, 0.350, 0.5))
print(A)
