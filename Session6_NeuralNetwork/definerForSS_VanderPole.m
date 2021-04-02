    function[input, output] = definerForSS_VanderPole(x1in,x2in,x1o,x2o)
    input = zeros(length(x1in),10);
    output = zeros(length(x1o),2);
    output(:,1) = x1o;
    output(:,2) = x2o;
    input(:,1) = x1in;
    input(2:end,2) = x1in(1:end-1);
    input(3:end,3) = x1in(1:end-2);
    input(2:end,4) = x1o(1:end-1);
    input(3:end,5) = x1o(1:end-2);
    input(:,6) = x2in;
    input(2:end,7) = x2in(1:end-1);
    input(3:end,8) = x2in(1:end-2);
    input(2:end,9) = x2o(1:end-1);
    input(3:end,10) = x2o(1:end-2);
end
