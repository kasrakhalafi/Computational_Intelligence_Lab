x = 0;
mu = 0;
sig = 0;
y = exp(-power(x - mu, 2.) / (2 * power(sig, 2.)));

noron_num = 4;
input = linspace(-3,3);
outputDesired = sin(input);
%plot(input,outputDesired);
outputNoisy = outputDesired - 0.1 + (0.2)*rand(1,100);
%plot(input,outputNoisy)
%outputNoisy = outputDesired + random.normal(0, 0.1, input.shape)
centers = [-2.3, -0.8, 0.8, 2.3];
max_dist = -1;
for i = 1:noron_num
    for j = 1:noron_num
       dist = abs(centers(:,i) - centers(:,j));
        if(dist > max_dist)
            max_dist = dist;
        end
    end
end

%matrix = ones(noron_num,length(input))
matrix = ones(noron_num+1,length(input));

for i =1:noron_num
    x = input;
    mu = centers(i);
    sig = noron_num / (sqrt(2 * max_dist));
    matrix(i+1,:) = exp(-power(x - mu, 2.) / (2 * power(sig, 2.)));
end

matrix = transpose(matrix);

W = inv(transpose(matrix)*matrix) * transpose(matrix);
%W = transpose(W)
size(outputNoisy)
size(W)
W = W * outputNoisy;

size(W)
% W = W * outputNoisy
actual_output = zeros(1,length(input));

for i = 1:length(input)
    actual_output(i) = matrix(i) * W(rem(i,4)+1);
end

plot(input, actual_output);

