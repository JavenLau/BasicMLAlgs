
function[trainData, ssubset, featureTree] ...
= constructTree(ig, trainData, data, label, ssubset, l, ln, featureTree)

[unused, mmax] = max(ig);
featureTree(l, ln)= mmax;
subset = ssubset{l,ln};
l=l+1;
ln=ln*2-2;
[fNum, unused]=size(unique(data(:,mmax)));%the possible values of the feature with the max ig
subset_temp =  [];
for i = 1:fNum
    subset_temp =  find(data(:,mmax)==i); %the subset    
	ln=ln+1;
    ssubset(l, ln) = {subset(subset_temp)};  
end;

trainData(:,mmax) = 4;  %mark the mmax column, so that in the next feature selection the mark column will be jumped. 
