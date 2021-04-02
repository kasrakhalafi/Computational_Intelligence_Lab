import numpy as np
import cv2
import matplotlib.pyplot as plt


def sign(input):
  out = np.sign(input)
  out = out.astype(float)
  for i in range(len(out)):
    if out[i] == 0:
      out[i] = -1
  return out

def noisy(input):
  out = input
  l = np.random.randint(100, size=10).tolist()
  for i in l:
    if out[i] == -1:
      out[i] = 1
    else:
      out[i] = -1
  return out

def asynchornous(v_new,v_old):
  tmp = v_old
  for i in range(len(tmp)):
    if v_new[i] != tmp[i]:
      tmp[i] = v_new[i]
      return tmp
  return tmp
      




l1 = cv2.imread("L1.png")
l1 = cv2.resize(l1, (10, 10))
l1 = cv2.cvtColor(l1, cv2.COLOR_BGR2GRAY)
_, l1 = cv2.threshold(l1, 10, 255, 0)
l1 = sign(np.reshape(l1, (1, -1))[0])
l4 = cv2.imread("L4.png")
l4 = cv2.resize(l4, (10, 10))
l4 = cv2.cvtColor(l4, cv2.COLOR_BGR2GRAY)
_, l4 = cv2.threshold(l4, 10, 255, 0)
l4 = sign(np.reshape(l4, (1, -1))[0])
l5 = cv2.imread("L3.png")
l5 = cv2.resize(l5, (10, 10))
l5 = cv2.cvtColor(l5, cv2.COLOR_BGR2GRAY)
_, l5 = cv2.threshold(l5, 10, 255, 0)
l5 = sign(np.reshape(l5, (1, -1))[0])


pattern = np.transpose(np.concatenate(([l1], [l4], [l5]), axis=0))

l3 = cv2.imread("L5.png")
l3 = cv2.resize(l3, (10, 10))
l3 = cv2.cvtColor(l3, cv2.COLOR_BGR2GRAY)
_, l3 = cv2.threshold(l3, 10, 255, 0)
l3 = sign(np.reshape(l3, (1, -1))[0])
inputt = noisy(np.transpose(l3))
plt.imshow(inputt.reshape((10, 10)))
plt.show()

# pattern = np.array([[ 1, -1, 1],[ -1, -1, 1]]).transpose()
# m = pattern.shape[0]
# n = pattern.shape[1]
# W = np.dot(pattern,np.transpose(pattern)) - n * np.eye(m)
# inputt = np.array([[-0.5,-.7,0]])
# inputt = np.transpose(inputt)

m = pattern.shape[0]
n = pattern.shape[1]
W = np.dot(pattern,np.transpose(pattern)) - n * np.eye(m)
v0 = sign(inputt)
v_old = sign(np.dot(W, v0))
v_old = asynchornous(v_old, v0)
v_new = None
cnt = 1
while True:
  v_new = sign(np.dot(W, v_old))
  v_new = asynchornous(v_new, v_old)
  # print("itter {} -> {}".format(cnt, v_new.transpose()))
  if cnt == 20:
    break
  v_old = v_new
  cnt += 1

print("--------")
print("result -> {}".format(v_new.transpose()))
plt.imshow(v_new.reshape((10, 10)))
plt.show()
