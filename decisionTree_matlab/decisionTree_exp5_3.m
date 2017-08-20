
clc
clear all;
close all;

data = [ 1 2 2 1;
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

subset(1,1) = {[1:1:15]};


layer=3;
featureTree=[];

for l = 1:layer 
    fprintf('\n');
    for ln = 1:(2^(l-1)) %the numbers
        
        if( isempty(subset{l,ln}) )
            disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(0)]);
            subset(l+1, ln*2-1) = {[]};
            subset(l+1, ln*2) = {[]};
            continue;
        end;
        
        %% feature selection
        [unused, lnum]=size(unique( label(subset{l,ln}) ));
        [lnNum, unused] = size(data(subset{l,ln},:));
        if(lnum == 1)
            disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(lnNum)]);
            subset(l+1, ln*2-1) = {[]};
            subset(l+1, ln*2) = {[]};
            continue;
        end;
        ig = featureSelection( data(subset{l,ln},:), label(subset{l,ln}') )
        
        %% construct decision tree
        [lnNum, unused] = size(data(subset{l,ln},:));
        disp(['layer-',num2str(l) , ',node-', num2str(ln),', the numbers of leaf node is ',num2str(lnNum)]);
        [data, subset, featureTree] = constructTree(ig, data, data(subset{l,ln},:), label(subset{l,ln}'), subset, l, ln, featureTree);
    end;
end;

%
%% label tree
for i = 1:layer+1
    for  j = 1:(2^(i-1))
        if(isempty(subset{i,j}'))
            labelTree(i,j)=ceil(labelTree(i-1,ceil(j/2)));
            continue;
        end;
        labelTree(i,j)=mode(label(subset{i,j}'));
    end;
end;



