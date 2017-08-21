
function[ig] = computeInfoGain(data, label, feature, types)

[unused, num] = size(label);
[fNum, unused]=size(unique(data(:,feature)));

for i = 1:types % the types of lables
    Ck = sum(label(:,:)==i);
    if(Ck==0 || num==0)
        H(i)=0;
    else
        H(i) = -(Ck/num)*log2(Ck/num);
    end;
end;
ee = sum(H); %% empirical  entropy

tempi=0;
for i = 1:fNum    %the possible values of feature
    temp = sum(data(:,feature)==i);   %Di
    
    tempk = 0; 
    for k = 1:types    %the possible values of label
              
        count = 0;       
        for n = 1:num   %Dik
            if(label(n)==k && data(n,feature)==i)       
                count=count+1;
            end;           
        end;
%         disp([count,temp]);
        if(count == 0 || temp == 0)
            log = 0;
        else
            log = (count/temp)*log2(count/temp);
        end;
        tempk=tempk+log;
    end;

    tempi=tempi-(temp/num)*tempk;
end;
ece = tempi; %empirical  conditional entropy

ig = ee - ece; % information gain

% % information gain ratio
% tempigr = 0;
% for i = 1:fNum    %the possible values of feature
%     temp = sum(data(:,feature)==i);
%     tempigr = tempigr-(temp/num)*log2(temp/num);
% end;
% ig = ig/tempigr; % information gain ratio

