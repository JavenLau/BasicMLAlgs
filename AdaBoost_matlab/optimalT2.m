
function[errorRate, weightG, cy] = optimalT(x, y, w, T)

for i = 1:10
    if(x(i)<T)
        cy(i) = -1;
    else
        cy(i) = 1;
    end;
end;
temp = cy - y;
temp(temp~=0) = 1;
errorRate = sum(temp.*w);
weightG = 0.5*log((1-errorRate)/errorRate);