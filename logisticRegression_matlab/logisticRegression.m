
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
learningStep = 0.00001;

w = [w,b];

[num, unused] = size(testData);
temp1 = ones(num,1);
testData = double([testData, temp1]);

[num, unused] = size(trainData);
temp2 = ones(num,1);
trainData = double([trainData, temp2]);

%%
%data pre-pocessing for logistic regression
iteration = 200;
for it = 1:iteration
    
    errorData = [];
    errorLabel = [];
    errorNum = 0;
    for i = 1:num
        if( ssign(w,trainData(i,:)) ~= trainLabel(i) )
            errorNum = errorNum +1;
            errorData(errorNum,:) = trainData(i,:);
            errorLabel(errorNum) = trainLabel(i);
        end;
    end;
    disp([it, errorNum]);
    temp3=rrand(1,1,1,errorNum);
    w = w - learningStep * lossGrd(w, errorData(temp3,:), errorLabel(temp3));
end;
    
    





