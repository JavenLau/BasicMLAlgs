clc
clear all;
close all;

x = [0:1:9];
y = [1 1 1 -1 -1 -1 1 1 1 -1];


w = ones(1,10)*0.1;
T = 2.5;
[errorRate, weightG, Gx] = optimalT(x, y, w, T)
G1 = weightG * Gx;
GG1 = G1;
GG1(GG1>0) = 1;
GG1(GG1<0) = -1;
GG1;

w = exp(-weightG*y.*Gx).*w / sum(exp(-weightG*y.*Gx).*w);
T = 8.5;
[errorRate, weightG, Gx] = optimalT(x, y, w, T)
G2 = weightG * Gx;
G2 = G2 + G1;
GG2 = G2;
GG2(GG2>0) = 1;
GG2(GG2<0) = -1;
GG2;


w = exp(-weightG*y.*Gx).*w / sum(exp(-weightG*y.*Gx).*w);
T = 5.5;
[errorRate, weightG, Gx] = optimalT(x, y, w, T)