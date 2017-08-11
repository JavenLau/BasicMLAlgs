clc
clear all;
close all;

% addpath('.././data/mnist');%read the upper path
addpath('.././data/mnist_subset');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');

%% 
% %data pre-pocessing
% [num, unused] = size(testLabel);
% for i= 1:num
%     [unused, label] = max( testLabel(i,:) );
%     ntestLabel(i) = label-1;
% end;
% clear testLabel;
% testLabel = ntestLabel;
% clear ntestLabel;
% 
% [num, unused] = size(trainLabel);
% for i= 1:num
%     [unused, label] = max( trainLabel(i,:) );
%     ntrainLabel(i) = label-1;
% end;
% clear trainLabel;
% trainLabel = ntrainLabel;
% clear ntrainLabel;

% % 
%%
for i = 1:100
    temp = rrand(1, 1, 1, 2000);
    showImage(trainLabel(temp), trainData(temp,:));
    pause;
end;