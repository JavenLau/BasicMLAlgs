% kNearst: the index of k nearst value
% kNearstValue: the k nearst value
% distance: the distance vector
% k: k

function[kNearst, kNearstValue] = kMin(distance, k)

maxNum = max(distance);
kNearst = zeros(k,1);

for i = 1:k    
    [unused, index]= min(distance);
    distance(index) = maxNum;
    kNearst(i)=index;
    kNearstValue(i)=unused;
end;