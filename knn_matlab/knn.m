clc;
close all;
clear all;

addpath('.././data/mnist');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');

k=30;
numA = 2;
numB = 8;
num = 100;

% reconstruct the data
[newTrainLabel, newTrainData] = consData(trainLabel, trainData, num, numA, numB);
[newTestLabel, newTestData] = consData(testLabel, testData, num, numA, numB);

tstart = tic;
% 
% compute the distance & learning and classify
distance = zeros(num*2,1);
kNearst = zeros(k,1);
kNearstValue = zeros(k,1);
kNearstLabel = zeros(k,1);
error = 0;
for i = 1:num*2
%     i
    for ii = 1:num*2  %compute the distance
        diff = abs( newTestData(i,:)-newTrainData(ii,:) );
        distance(ii) = sum(sum(diff));
    end;
    [kNearst, kNearstValue] = kMin(distance, k); % the k nearest neighbors
    for j=1:k
        kNearstLabel(j) = newTrainLabel(kNearst(j));
    end;
    
    label = mode(kNearstLabel); % the decision rule
    if(label ~= newTestLabel(i))
        error = error+1;
    end;
end;
errorRate = error*100/(num*2)

time = toc(tstart)































