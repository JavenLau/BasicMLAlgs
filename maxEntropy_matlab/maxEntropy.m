
clc
clear all;
close all;

% addpath('.././data/mnist');%read the upper path
addpath('.././data/mnist_subset');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');
trainLabel(trainLabel==0) = -1;
testLabel(testLabel==0) = -1;

