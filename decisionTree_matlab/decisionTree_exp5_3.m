
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

% 
% feature selection
[unused, f] = size(data); %the numbers of features
for i = 1:f
    ig(i)=computeInfoGain(data, label, i);
end;

% 
% construct decision tree
[unused, mmax] = max(ig);
[fNum, unused]=size(unique(data(:,mmax)));%the possible values of the feature with the max ig
subset =  [];
for i = 1:fNum
    
    subset =  find(data(:,mmax)==i); %the subset    
    [unused, lnum]=size(unique( label(subset) ));
    if(lnum == 1)
        continue;
    end;
    
    computeInfoGain(data(subset,:), label(subset), 4)
end;

