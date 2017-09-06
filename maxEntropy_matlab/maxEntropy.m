
clc
clear all;
close all;

% addpath('.././data/mnist');%read the upper path
addpath('.././data/mnist_subset');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');

w = ones(1,784)*0.05;

[hig, wid]  = size(trainData);
iteration = 10;

for it = 1: iteration
    for j = 1:hig
        for k = 1:wid
            
            

        end
        w = w - g;
    end
    
    if(sqrt(g*g')<precision)
        break;
    end
end

