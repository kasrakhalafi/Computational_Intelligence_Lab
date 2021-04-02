function[input, output] = definer(x,y)
    input = zeros(length(x),6);
    output = y;
    input(:,1) = x;
    input(2:end,2) = x(1:end-1);
    input(3:end,3) = x(1:end-2);
    input(2:end,4) = y(1:end-1);
    input(3:end,5) = y(1:end-2);
    input(4:end,6) = y(1:end-3);
end
