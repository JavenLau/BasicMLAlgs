% construct a new database from the mnist
% trainLabel:the label of the data 
% trainData: the data
% num: the number of sample from the mnist
% numA: the sample num A 
% numB: the sample num B
% newTrainLabel: the sample label
% newTrainData: the sample data
function[newTrainLabel, newTrainData] = consData(trainLabel, trainData, num, numA, numB)

% 
% choose sample
i = 1;
newi=1;
newTrainData = zeros(num*2, 784);
newTrainLabel = zeros(num*2, 1);
num1 = 0;
num2 = 0;
while (num1 <= num || num2 <= num)
    
    [unused, label] = max( trainLabel(i,:) );
    i = i+1;    
    if( label == numA)
        if(num1 > num)
            continue;
        end;
        newTrainData(newi,:)=trainData(i-1,:);
        newTrainLabel(newi, :)=numA;
        newi = newi+1;
        num1 = num1+1;
    end;
    if( label == numB)
        if(num2 > num)
            continue;
        end;            
        newTrainData(newi,:)=trainData(i-1,:);
        newTrainLabel(newi)=numB;
        newi = newi+1;
        num2 = num2+1;
    end;        
 	
end;
newTrainData(newTrainData~=0)=1; %binary

% length(find(newTrainLabel(:,:)==1))
% length(find(newTrainLabel(:,:)==2)) 

% % 
% % show the sample image
% trainImage = zeros(28,28);
% for i=1:num*2
%     for j=1:784
%         jj = rem(j,28);
%         if(rem(j,28) == 0)
%             jj=28;
%         end;
%         trainImage(ceil(j/28), jj) = newTrainData(i,j);      
%     end;
%     fprintf('Disparity = %04d', newTrainLabel(i)-1);   
%     imshow(trainImage, []);   
%     pause;
%     fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b');  %delete the previous content 
% end;






























