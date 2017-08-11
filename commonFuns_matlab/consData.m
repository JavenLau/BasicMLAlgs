
function[newTrainLabel, newTrainData] = consData(trainLabel, trainData, num, numValue)

% 
% choose sample
[nnum, unused] = size(trainData);
newTrainData = zeros(num, 784);

num1 = 0;
for i = 1:nnum
    
    label = trainLabel(i);    
    if( label == numValue)
        num1 = num1+1;
        if(num1 > num)
            continue;
        end;
        newTrainData(num1,:)=trainData(i,:);        
    end;      
 	
end;
newTrainLabel = ones(1, num)*numValue;

