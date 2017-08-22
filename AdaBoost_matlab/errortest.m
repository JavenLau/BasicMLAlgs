
function[errornum] = errortest(G, y)

G(G>0) = 1;
G(G<0) = -1;
temp = G-y;
temp(temp~=0)=1;
errornum=sum(temp);