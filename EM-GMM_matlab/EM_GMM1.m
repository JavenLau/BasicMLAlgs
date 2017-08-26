
clc
clear all;
close all;


load('trainImage.mat');
trainImage(trainImage~=0)=1;
[r, c] = size(trainImage);
data =[];
for i = 1:r
    for j = 1:c
        if(trainImage(i,j)==1)
            data = [data; [i,j]];
        end;
    end;       
end; 
%randomize data
[num, dim] = size(data);   %numbers, dimension
temp = randperm(num); 
data = data(temp(1:num), :);

K = 3;
[gdd, alpha] = GMM(data, K);
[~, index] = min(gdd, [], 2);

for i = 1:num
    temp1(data(i,1),data(i,2)) = index(i);
end;
