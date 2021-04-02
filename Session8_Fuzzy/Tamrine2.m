x = zeros(100, 1);
for i = 1:100
   x(i) = i; 
end

young = gaussmf(x, [13, 25]);
old = gaussmf(x, [13, 75]);
cmp = compliment(young);

figure(1)
plot(x, young, x, cmp);
figure(2)
plot(x, einsteinsum(old, young), x, einsteinprod(old, young))
figure(3)
plot(x, snorm(old, young), x, einsteinprod(old, young))

function [cmp] = compliment(x)
    cmp = 1 - x;
end

function [s] = snorm(x, y)
    s = max(x, y);
end

function [t] = tnorm(x, y)
    t = min(x, y);
end

function ensum = einsteinsum(muA,muB)

ensum = (muA + muB)/(1 + muA.*muB);

end

function enprod = einsteinprod(muA,muB)

enprod = (muA.*muB)/(2 - (muA + muB - muA .* muB));

end