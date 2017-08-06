

function[ig] = computeInfoGain(data, label, feature)

[unused, num] = size(label);
[fNum, unused]=size(unique(data(:,feature)));

for i = 1:2
    Ck = sum(label(:,:)==i);
    H(i) = -(Ck/num)*log2(Ck/num);
end;
ee = sum(H); %empirical  entropy

tempi=0;
for i = 1:fNum    %the possible values of feature
    temp = sum(data(:,feature)==i);
    
    tempk = 0; 
    for k = 1:2    %the possible values of label
              
        count = 0;       
        for n = 1:num
            if(label(n)==k && data(n,feature)==i)
                count=count+1;
            end;           
        end;
%         disp([count,temp]);
        if(count == 0)
            log = 0;
        else
            log = log2(count/temp);
        end;
        tempk=tempk+(count/temp)*log;
    end;

    tempi=tempi-(temp/num)*tempk;
end;
ece = tempi; %empirical  conditional entropy

ig = ee - ece; % information gain

% tempigr = 0;
% for i = 1:fNum    %the possible values of feature
%     temp = sum(data(:,feature)==i);
%     tempigr = tempigr-(temp/num)*log2(temp/num);
% end;
% ig = ig/tempigr; % information gain ratio

