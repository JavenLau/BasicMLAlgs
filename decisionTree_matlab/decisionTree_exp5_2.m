
clc
clear all;
close all;

data = [1 2 2 1;
        1 2 2 2;
        1 1 2 2;
        1 1 1 1;
        1 2 2 1;
        2 2 2 1;
        2 2 2 2;
        2 1 1 2;
        2 2 1 3;
        2 2 1 3;
        3 2 1 3;
        3 2 1 2;
        3 1 2 2;
        3 1 2 3;
        3 2 2 1];
label = [2 2 1 1 2 2 2 1 1 1 1 1 1 1 2];

computeInfoGain(data, label, 1)
computeInfoGain(data, label, 2)
computeInfoGain(data, label, 3)
computeInfoGain(data, label, 4)

