
function [y] = ssign(w, b, x)

if(exp( w*x'+ b) >= 100)
    y=-1;
else
    y=1;
end;



