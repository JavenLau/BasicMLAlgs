
function[r1, r2, c1, c2] = separateRegion(x, y, s)

[unused, num] = size(x);
r1 = [];
r2 = [];
for i = 1:num
    if(x(i)<=s)
        r1= [r1, x(i)];
    else
        r2= [r2, x(i)];
    end;
end;

c1 = mean(y(r1));
c2 = mean(y(r2));