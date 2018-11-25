function [F] = myFFT(f)
    f = double(f);
    [M, N] = size(f);
    F = zeros(M, N);
    for i=1:M
        F(i, 1:N) = decomposeDFT(f(i, 1:N));
        %F(i, :) = primeDFT(f(i, :));
    end
    
    for j=1:N
        F(1:M, j) = decomposeDFT(F(1:M, j)')';
        %F(:, j) = primeDFT(F(:, j)')';
    end
end

% f：一维数组
function [F] = decomposeDFT(f)
    M = length(f);
    if isprime(M)
        F = primeDFT(f);
        return
    end
    
    % H：陪集个数， K：子群的阶
    fac = factor(M);
    H = fac(1);
    K = M / H;

    F_mat = zeros(H, K);
    u = linspace(0, K-1, K);
    v = linspace(0, H-1, H);
    Wm = exp(-2i * pi * u ./ M);
    Wh = exp(-2i * pi * v ./ H);
    
    for i=1:H
        f_mat = f(i:H:M);
        F_mat(i, :) = decomposeDFT(f_mat) .* Wm .^ (i-1);
    end
    
    for t=1:H
       F((t-1)*K+1 : t*K) = Wh .^ (t-1) * F_mat;
    end
end

% f：一维数组
function [F] = primeDFT(f)
    M = length(f);
    F = zeros(1, M);
    x = linspace(0, M-1, M);
    for u=0:M-1
        F(u+1) = sum(f .* exp(-2i * pi * u * x ./ M));
    end
end