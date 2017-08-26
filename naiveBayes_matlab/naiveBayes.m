
% the accuracy is lower than normal situation
clc
clear all;
close all;

addpath('.././data/mnist');%read the upper path

load('trainData.mat');
load('trainLabel.mat');
load('testData.mat');
load('testLabel.mat');

% % 
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
testData(testData~=0)=1;

% % 
% % compute the prior probability & conditional probability
for label=1:10
    disp([label]);
    %take out all the data with the given label
    tempData=[];    %matrix init
    rows=0;
    for i=1:60000
%         disp([label, i]);
        if(ntrainLabel(i) == label)
            rows=rows+1;
            tempData(rows,:)=trainData(i,:);
        end;
    end;
%     size(tempData)
    
    labelNum = sum(ntrainLabel == label);
    PP(label) = (labelNum+1)/(num+10);   %% prior probability
    for fd=1:784 %feature dimension        
        for fdv=0:1         %feature value
            temp = sum( tempData(:,fd)==fdv )+1;
%             if(temp > labelNum+2)
%                 disp([temp, labelNum+2]);
%             end;
            CP(fd,fdv+1,label) = temp / (labelNum+2);     %% conditional probability           
        end;
    end;   
end;

% % 
% % compute the posterior probability
error = 0;
for num=1:10000
%     disp([num])
    POP=ones(1,10);
    for label=1:10        
        for fd=1:784 %feature dimension
            temp = CP(fd,testData(num,fd)+1,label)/10000+1.0002; %set the conditional probability between 1.0001 and 1.0002
%             if(temp>1.0002 || temp<1.0001)
%                 disp([temp]);
%             end;
            POP(label)= POP(label)*temp;    
        end;
%         POP(label)= temp;
%         POP(label)= PP(label)*POP(label);
    end;
    [unused, cLabel] = max(POP);
    if(cLabel ~= ntestLabel(num))
        error = error+1;
    end;   
end;

accuracy = 100-error*100/10000
