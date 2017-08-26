
% sth is wrong with this example
clc
clear all;
close all;

addpath('.././data/mnist_subset');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
% trainData(trainData~=0)=10;
% trainData(trainData==0)=1;
data = trainData;
label = trainLabel;

%randomize data
[num, dim] = size(data);   %numbers, dimension
temp = randperm(num); 
data = data(temp(1:num), :);
label = label(temp(1:num));

K = 2;
[gdd, alpha] = GMM(data, K);
[~, index] = min(gdd, [], 2);
