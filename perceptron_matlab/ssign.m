
function [y] = ssign(w, x, b)

if(w*x'+b>=0)
    y=1;
else
    y=-1;
end;







