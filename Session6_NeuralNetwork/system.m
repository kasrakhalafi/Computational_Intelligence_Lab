function[x1Dot, x2Dot] = system(x1,x2)

x1Dot = x2;
x2Dot = -x1 + (1 - x1 ^ 2) * x2;

end