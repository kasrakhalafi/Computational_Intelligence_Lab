function[input, output] = definer(x,y)
    input = zeros(length(x),7);
    output = x;
    input(2:end,1) = x(1:end-1);
    input(3:end,2) = x(1:end-2);
    input(4:end,3) = x(1:end-3);
    input(:,4) = y;
    input(2:end,5) = y(1:end-1);
    input(3:end,6) = y(1:end-2);
    input(4:end,7) = y(1:end-3);
end
