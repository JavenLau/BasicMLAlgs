clc
clear all
close all

data = [5 5; 4 4; 4 3; 1 2; 2 2];
label = [1; 1; 1; -1; -1];

w=[3 2];
b=2;
step=1;
error = 15;

iteration = 0;
while( max(max(error)) ~= 0 )
        
    error = [];
    errorLabel = [];
    errorNum = 0;
    for i=1:5        
        if( ssign(w, data(i,:), b) ~= label(i) )
            errorNum = errorNum+1;
            error(errorNum,:)=data(i,:);
            errorLabel(errorNum)=label(i);
        end;
    end;
    [unused, ii]=size(errorLabel);
    
%     ii = input('ii = ');
    if(ii>0)
        w = w + step*errorLabel(ii)*error(ii,:);
        b = b + step*errorLabel(ii);
    end;
    disp([iteration, w(1), w(2), b, errorNum])
    iteration = iteration + 1;
    
end;





