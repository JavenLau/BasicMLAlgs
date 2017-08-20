% clc

% for l = 1:layer+1 
%     temp = [];
%     for ln = 1:(2^(l-1)) %the numbers
%         temp = [temp;subset{l,ln}];       
%     end;
%     disp([l, ln, size(unique(temp))]);
% %     pause;
% end;

fprintf('\n');
fprintf('\n');

for l = 1:layer+1 
    for ln = 1:(2^(l-1)) %the numbers
        [num, unused]=size(subset{l,ln});
        subsetNum(l,ln) = num;
    end;
        disp([l, ln, sum(subsetNum(l,:))]);
end;

error = 0;
jj=featureTree(1,1);
for i = 1:10000
    jjnum = [];
    for j = 1:layer-1
        
        if(jj == 0)
            break;
        end;
        
        if(testData(i,jj) == 1)
            jjnum(j) = 0;
            jj=featureTree(j+1,binery2decimal(jjnum));
            label = labelTree(j+1,binery2decimal(jjnum));
        else
            jjnum(j) = 1;
            jj=featureTree(j+1,binery2decimal(jjnum));
            label = labelTree(j+1,binery2decimal(jjnum));          
        end;
        
    end;
%     label
%     pause;
    if(label ~= ntestLabel(i))
        error=error+1;
    end;
end;
error