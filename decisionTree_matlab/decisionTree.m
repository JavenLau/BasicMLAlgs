
clc
clear all;
close all;

addpath('.././data/mnist');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');

%% 
% % data pre-pocessing
[num, unused] = size(testLabel);
for i= 1:num
    [unused, label] = max( testLabel(i,:) );
    ntestLabel(i) = label;
end;

[num, unused] = size(trainLabel);
for i= 1:num
    [unused, label] = max( trainLabel(i,:) );
    ntrainLabel(i) = label;
end;

trainData(trainData~=0)=1;%binaryzation
trainData(trainData==0)=2;%binaryzation
testData(testData~=0)=1;
testData(testData==0)=2;


%%
% % 
subset(1,1) = {[1:1:num]'};
subsetNum = 1;
layer = 3;

featureTree=zeros(layer, 2^layer);
labelTree=zeros(layer, 2^layer);
for l = 1:layer 
    l
    fprintf('\n');
    temp = subset{l,:};
%     disp([size(subset(l,:)), sum(temp==0)]);
    for ln = 1:(2^(l-1)) %the numbers 

        % %feature selection
%             disp(['feature selection']);
        ig = featureSelection( trainData(subset{l,ln},:), ntrainLabel(subset{l,ln}') );   
        
        %% construct decision tree
%             disp(['construct decision tree']);
        [lnNum, unused] = size(trainData(subset{l,ln},:));
            disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(lnNum)]);
        [trainData, subset, subsetNum, featureTree] = constructTree(ig, trainData, trainData(subset{l,ln},:), ntrainLabel(subset{l,ln}'), subset, l, ln, featureTree);

    end;

end;


%% label tree
for i = 1:layer+1
    for  j = 1:(2^(i-1))
        if(isempty(subset{i,j}'))
%             lableTree(i,j)=ceil(lableTree{i-1,ceil(j/2)});
            continue;
        end;
        labelTree(i,j)=mode(ntrainLabel(subset{i,j}'));
    end;
end;

%
% feature tree
% featureTree;

% start test
error = 0;
for i = 1:10000
    
    for j = 1:layer
        
        jj=featureTree(j,1);
        if(testData(i,jj) == 1)
            label = labelTree(j,2*j-1);
        else
            label = labelTree(j,2*j+1);
        end;
        
    end;
    label
    pause;
    if(label ~= ntestLabel(i))
        error=error+1;
    end;
end;
error


