
function[ig] = featureSelection(data, label)

[unused, f] = size(data); %the numbers of features
% f
for i = 1:f
    ig(i)=computeInfoGain(data, label, i);
end;
% fprintf('info gain %s\n', num2str(ig));