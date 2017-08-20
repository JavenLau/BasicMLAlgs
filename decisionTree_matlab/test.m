clc


for l = 1:layer 
    fprintf('\n');
    temp = [];
    for ln = 1:(2^(l-1)) %the numbers
        temp = [temp,subset{l,ln}];       
    end;
    disp([l, ln, size(unique(temp))]);
    pause;
end;