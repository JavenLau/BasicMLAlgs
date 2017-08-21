% function[] = pruningTree()
alpha=500;

T = sum(sum(subsetNum(1:10,:)~=0));

% all the leaf nodes
count=0;
for l = layer:-1:1
    for ln = (2^(l-1)):-1:1 %the numbers 
        
        Nt = subsetNum(l, ln);
        if(Nt ~= 0)
            count = count+1;
            ll(count)=l;
            lln(count)=ln;
        end;     
        
    end;   
end;

count_temp = 20;
% compute the loss function
CT=0;
temp = 0;
Ht_temp=0;
for l = 1:layer 
    for ln = 1:(2^(l-1)) %the numbers 
        
        Nt = subsetNum(l, ln);
        if(Nt ~= 0)
            temp = temp+1;
            for k = 1:types
                Ntk = sum(ntrainLabel(subset{l, ln})==k);
                if(Ntk==0)
                    Htt(k)=0;
                else
                    Htt(k)=-Ntk*log(Ntk/Nt);
                end;
            end;            
            Ht=sum(Htt);
            CT = CT+Ht;
            if(temp >= count_temp)
                Ht_temp=Ht_temp+Ht;
            end;
        end; 
              
    end;   
end;
CTbefore = CT+alpha*T;
CTafter = CT-Ht_temp +alpha*(T-1);

% =
% ln=
% if(CTafter< CTbefore)
%     subsetNum(ll, lln) = 0;
%     subsetNum(ll+1, lln*2) = 0;
%     subsetNum(ll+1, lln*2-1) = 0;
%     
%     labelTree(ll+1, lln*2) = labelTree(ll, lln);
%     labelTree(ll+1, lln*2-1) = labelTree(ll, lln);    
% end;

