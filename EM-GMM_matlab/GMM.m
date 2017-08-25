function [gdd, alpha] = GMM(data, K)

[num, dim] = size(data); 
threshold = 0.01;
Qpre = inf;

%% initParameters
[miu sigma alpha]= initParameters(); % EM algs is sensltive to the initial parameters

%%
iteration = 10;
for it = 1:iteration
    
    %% compute gaussian distribution density
    gdd = cmpGDD();
    
    temp = repmat(alpha, num, 1) .* gdd;
    gamma =  temp ./ repmat(sum(temp, 2), 1, K);      %the respond function
   
    %% update
    miu =  diag(1./sum(gamma, 1)) * gamma' * data;
    alpha = sum(gamma, 1)/num;

    Nk=sum(gamma, 1);
    for k = 1:K
        ttmp = data - repmat(miu(k,:), num, 1);
        sigma(:,:,k) = ttmp' * (diag(gamma(:, k)) * ttmp)/Nk(k);
    end;

    %% check whether the iteration could stop
    Q = sum(log(alpha*gdd'));
    if(abs(Q - Qpre) < threshold)
        break;
    end
    Qpre = Q;

end

function [miu sigma alpha] = initParameters()

    miu = data(1:K, :);
     
    datak = repmat(sum(data, 2), 1, K);
    miuk = repmat(sum(miu, 2), 1, num)';
    distance = abs(datak - miuk);
    [~, index] = min(distance, [], 2);
    
    for k = 1:K
        tmp = data(index==k, :);
        sigma(:,:,k) = cov(tmp);
        alpha(k) = sum(index==k)/num;
    end;
    
end

function [gdd] = cmpGDD()
    
    for k = 1:K
        miuk = repmat(miu(k,:), num, 1);
        tmp = exp( -0.5 * (data - miuk) * inv(sigma(:,:,k)) .* (data - miuk) );
        tmp1 = sum(tmp, 2);
        tmp2 = (2*3.14)^(-dim/2) * sqrt(det(sigma(:,:,k)));
        gdd(:, k) = tmp1*tmp2;
    end;
   
end

end



