clc
clear all;
close all;

x = [0:1:9];
y = [1 1 1 -1 -1 -1 1 1 1 -1];


w = ones(1,10)*0.1;
T = 2.5;
[errorRate, weightG, Gx] = optimalT(x, y, w, T);
G1 = weightG * Gx;
errornum = errortest(G1, y);
disp([errorRate, weightG, errornum]);


w = exp(-weightG*y.*Gx).*w / sum(exp(-weightG*y.*Gx).*w);
T = 8.5;
[errorRate, weightG, Gx] = optimalT(x, y, w, T);
G2 = weightG * Gx;
G2 = G2 + G1;
errornum = errortest(G2, y);
disp([errorRate, weightG, errornum]);

w = exp(-weightG*y.*Gx).*w / sum(exp(-weightG*y.*Gx).*w);
T = 5.5;
[errorRate, weightG, Gx] = optimalT2(x, y, w, T);
G3 = weightG * Gx;
G3 = G3 + G2 + G1;
errornum = errortest(G3, y);
disp([errorRate, weightG, errornum]);