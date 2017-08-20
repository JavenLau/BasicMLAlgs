
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
layer = 7;

% featureTree=zeros(layer, 2^layer);
featureTree=[];
labelTree=zeros(layer, 2^layer);
fid=fopen('test.txt','wb');
for l = 1:layer 
    l
    fprintf('\n');
    temp = subset{l,:};
%     disp([size(subset(l,:)), sum(temp==0)]);
    for ln = 1:(2^(l-1)) %the numbers 

        if( isempty(subset{l,ln}) )
%             disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(0)]);
            subset(l+1, ln*2-1) = {[]};
            subset(l+1, ln*2) = {[]};
            continue;
        end;
        
        %% feature selection
        [unused, lnum]=size(unique( ntrainLabel(subset{l,ln}) ));
        [lnNum, unused] = size(trainData(subset{l,ln},:));
        if(lnum == 1)
%             disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(lnNum)]);
            subset(l+1, ln*2-1) = {[]};
            subset(l+1, ln*2) = {[]};
            continue;
        end;
        ig = featureSelection( trainData(subset{l,ln},:), ntrainLabel(subset{l,ln}') );   
        
        %% construct decision tree
%             disp(['construct decision tree']);
        [lnNum, unused] = size(trainData(subset{l,ln},:));
%         disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(lnNum)]);
        ll=[l ln lnNum];
        fprintf(fid,'%d  %d %d\r\n',ll);
        [trainData, subset, featureTree] = constructTree(ig, trainData, trainData(subset{l,ln},:), ...
                                                                                               ntrainLabel(subset{l,ln}'), subset, l, ln, featureTree);

    end;

end;
 fclose(fid) ;

%% label tree
for i = 1:layer+1
    for  j = 1:(2^(i-1))
        if(isempty(subset{i,j}'))
            labelTree(i,j)=ceil(labelTree(i-1,ceil(j/2)));
            continue;
        end;
        labelTree(i,j)=mode(ntrainLabel(subset{i,j}'));
    end;
end;

%% feature tree
% featureTree;

%% start test
error = 0;
jj=featureTree(1,1);
for i = 1:10000
    jjnum = [];
    for j = 1:layer-1
        
        if(jj == 0)
            break;
        end;
        
        if(testData(i,jj) == 1)
            jjnum(j) = 0;
            jj=featureTree(j+1,binery2decimal(jjnum));
            label = labelTree(j+1,binery2decimal(jjnum));
        else
            jjnum(j) = 1;
            jj=featureTree(j+1,binery2decimal(jjnum));
            label = labelTree(j+1,binery2decimal(jjnum));          
        end;
        
    end;
%     label
%     pause;
    if(label ~= ntestLabel(i))
        error=error+1;
    end;
end;
error


