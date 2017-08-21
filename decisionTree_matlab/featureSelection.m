
function[ig] = featureSelection(data, label, types)

[unused, f] = size(data); %the numbers of features

% f
for i = 1:f
    [fNum, unused]=size(unique(data(:,i)));%the possible values of feature
    if( max(data(:,i))==4 || fNum==1)
        ig(i) = 0;
        continue;
    end;
    ig(i)=computeInfoGain(data, label, i, types);
end;
% fprintf('info gain %s\n', num2str(ig));