function [F] = GroupFFT2(f, radix)
    if nargin == 1
        radix = 'f';
    end
    
    f = double(f);
    [M, N] = size(f);
    F = zeros(M, N);
    for i=1:M
        F(i, :) = decomposeDFT(f(i, :), radix);
    end
    
    for j=1:N
        F(:, j) = decomposeDFT(F(:, j).', radix).';
    end
end

% f：一维数组
function [F] = decomposeDFT(f, radix)
    M = length(f);
    if (isfloat(radix) && mod(M, radix) ~= 0) || isprime(M)
        F = primeDFT(f);
        return
    end
    
    % H：陪集个数， K：子群的阶
    if radix == 'f'
        fac = factor(M);
        H = fac(1);
    elseif radix == 'b'
        fac = factor(M);
        H = fac(end);
    elseif isfloat(radix)
        H = radix;
    else
        error('Error:wrong parameter!');
    end
    
    K = M / H;
    
    F_mat = zeros(H, K);
    u = linspace(0, K-1, K);
    v = linspace(0, H-1, H);
    Wm = exp(-2i * pi * u ./ M);
    Wh = exp(-2i * pi * v ./ H);
    
    for i=1:H
        f_mat = f(i:H:M);
        F_mat(i, :) = decomposeDFT(f_mat, radix) .* Wm .^ (i-1);
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
    W = exp(-2i * pi * x ./ M);
    for u=0:M-1
        F(u+1) = dot(f, W .^ u);
    end
end