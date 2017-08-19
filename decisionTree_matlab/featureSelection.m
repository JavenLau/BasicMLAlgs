
function[ig] = featureSelection(data, label)

[unused, f] = size(data); %the numbers of features
% f
for i = 1:f
    if(max(data(:,i))==3 || isenpty(data))
        ig(i) = 0;
        continue;
    end;
    ig(i)=computeInfoGain(data, label, i);
end;
% fprintf('info gain %s\n', num2str(ig));