clc
clear all;
close all;

x = [1:1:10];
y = [5.56 5.76 5.91 6.40 6.80 7.05 8.90 8.70 9.00 9.05];

%% 1
f = zeros(1,10);
residual = y;
for i = 1:6

    s = [1.5:1:9.5]; %separate point
    [unused, snum] = size(s);
    for i = 1:snum
        [r1, r2, c1, c2] = separateRegion(x, residual, s(i));
        ms(i) = sum( (residual(r1) - c1).^2 ) + sum( (residual(r2) - c2).^2 );
    end;
    [minValue minIndex]=min(ms);
    [r1, r2, c1, c2] = separateRegion(x, residual, s(minIndex));

    T_i(r1)=c1;     %the Tree
    T_i(r2)=c2;
    f=f+T_i;

    residual = y - f;
    L = sum(residual.^2); %loss
    disp([s(minIndex), c1,c2, L]);
    
end;






















