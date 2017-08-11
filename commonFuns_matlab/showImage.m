function[ ] = showImage(trainLabel, trainData)

% show the sample image
trainImage = zeros(28,28);
[unused, num] = size(trainData);

for j=1:num
    
    jj = rem(j,28);
    if(rem(j,28) == 0)
        jj=28;
    end;
    trainImage(ceil(j/28), jj) = trainData(1,j);   
    
end;
fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b');  %delete the previous content 
fprintf('label = %04d', trainLabel);   
imshow(trainImage, []);   
