
clc
clear all;
close all;

data = [2 2 2 2 2 3 3 3 3 4 5 5 5 5 6 6 7 7 7 7 7 8 8 8 9 9 9  10 10 11;
           2 3 4 5 6 2 3 4 5 4 8 9 10 11 9 10 2 3 8 9 10 3 4 9 3 4 5 4 5 5]';
label = [1 1 1 1 1 1 1 1 1 1, 2 2 2 2 2 2 3 3 2 2 2 3 3 2 3 3 3 3 3 3]';

%randomize data
[num, dim] = size(data);   %numbers, dimension
temp = randperm(num); 
data = data(temp(1:num), :);
label = label(temp(1:num));

K = 3;
[gdd, alpha] = GMM(data, K);
[~, index] = min(gdd, [], 2);

for i = 1:num
    temp1(data(i,1),data(i,2)) = index(i);
end;
