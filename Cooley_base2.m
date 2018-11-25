function [F] = Cooley_base2(f)
    [M, N] = size(f);
    F = zeros(M, N);
    for i=1:M
        F(i, 1:N) = myfft(f(i, 1:N));
    end
    
    for j=1:N
        F(1:M, j) = myfft(F(1:M, j));
    end
end

function [F] = myfft(f)
    M= length(f);

    if M == 1
        F = f;
        return
    end
    
    K = M/2;
    u = linspace(0, K-1, K);
    
    f_even = f(1:2:M);
    f_odd = f(2:2:M);
    
    F_even = myfft(f_even);
    F_odd = myfft(f_odd);
    
    W = exp(-2i*pi*u ./ M);
    F(1:K) = F_even + F_odd .* W;
    F(K+1:M) = F_even - F_odd .* W;
end

