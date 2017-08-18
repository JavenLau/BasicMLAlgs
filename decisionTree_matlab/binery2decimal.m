function [tt] = binery2decimal(xBin)
tt = 0;
[unused, temp] = size(xBin);
for i = temp:-1:1
    tt = 2^(temp-i)*xBin(i)+tt;
end;
tt = 1+tt;