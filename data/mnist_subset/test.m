clc
clear all;
close all;

addpath('.././data/mnist');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');

%% 
%data pre-pocessing
[num, unused] = size(testLabel);
for i= 1:num
    [unused, label] = max( testLabel(i,:) );
    ntestLabel(i) = label-1;
end;
clear testLabel;
testLabel = ntestLabel;
clear ntestLabel;

[num, unused] = size(trainLabel);
for i= 1:num
    [unused, label] = max( trainLabel(i,:) );
    ntrainLabel(i) = label-1;
end;
clear trainLabel;
trainLabel = ntrainLabel;
clear ntrainLabel;

%% 
%imshow i rows of trainData
num = 1000;
[trainLabel1, trainData1] = consData(trainLabel, trainData, num, 1);
[trainLabel0, trainData0] = consData(trainLabel, trainData, num, 0);
[testLabel1, testData1] = consData(testLabel, testData, num, 1);
[testLabel0, testData0] = consData(testLabel, testData, num, 0);
% for i = 1:1000
%     showImage(testLabel1(i), testData1(i,:));
%     pause;
% end;

clear trainData
clear trainLabel
clear ntrainLabel
clear testData
clear testLabel
clear ntestLabel

trainData = [trainData1;trainData0];
trainLabel = [trainLabel1, trainLabel0];
testData = [testData1;testData0];
testLabel = [testLabel1, testLabel0];

clear trainData0
clear trainLabel0
clear testData0
clear testLabel0
clear trainData1
clear trainLabel1
clear testData1
clear testLabel1

% for i = 1:100
%     temp = rrand(1, 1, 1, 2000);
%     showImage(trainLabel(temp), trainData(temp,:));
%     pause;
% end;

save('trainData.mat','trainData');
save('trainLabel.mat','trainLabel');
save('testData.mat','testData');
save('testLabel.mat','testLabel');