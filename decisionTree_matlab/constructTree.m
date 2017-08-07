
function[trainData, ssubset, ssubsetNum, featureTree] = constructTree(ig, trainData, data, label, ssubset, l, ln, featureTree)

rawl=l;
rawln=ln;
l=l+1;
ln=ln*2-1;
[unused, mmax] = max(ig);
[fNum, unused]=size(unique(data(:,mmax)));%the possible values of the feature with the max ig
ssubsetNum = 0;
subset =  [];
for i = 1:fNum

    subset =  find(data(:,mmax)==i); %the subset
    [unused, lnum]=size(unique( label(subset) ));
    [subnum, unused] = size(subset); %the numbers of subsets
    if(lnum == 1)   %lnum demonstrates the subset only has one label
%         disp(['max infoGain feature ' ,num2str(mmax) ,' subset ' ,num2str(i) , '/', num2str(fNum), ' ', num2str(subnum), ' only has one label']);
        ssubsetNum = 0;
        ssubset(l, ln) = {subset};
        ln=ln+1;
        continue; 
    end;
    
%     disp(['max infoGain feature ' ,num2str(mmax) ,' subset ' ,num2str(i) , '/', num2str(fNum),  ' ', num2str(subnum), '  not has one label']);
    ssubsetNum = ssubsetNum+1;
    ssubset(l, ln) = {subset};
    ln=ln+1;
    
end;
trainData(:,mmax) = 0;
featureTree(rawl, rawln)= mmax;