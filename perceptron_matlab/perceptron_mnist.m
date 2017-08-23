
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

%%
%data pre-pocessing for logistic regression
w = ones(1,784);
b = 1;
learningStep = 0.05;

[num, unused] = size(testData);
testData(testData~=0)=1;
trainData(trainData~=0)=1;

%%
%train
iteration = 50;
for it = 1:iteration
    
    errorData = [];
    errorLabel = [];
    errorNum = 0;
    for i = 1:num
        if( ssign1(w, b, trainData(i,:)) ~= trainLabel(i) )
            errorNum = errorNum +1;
            errorData(errorNum,:) = trainData(i,:);
            errorLabel(errorNum) = trainLabel(i);
        end;
    end;
    disp([it, errorNum, sum(w), b]);
    temp3=rrand(1,1,1,errorNum);
    w = w - learningStep * errorData(temp3,:)*errorLabel(temp3);
	b = b - learningStep * errorLabel(temp3);
end;
    
    





