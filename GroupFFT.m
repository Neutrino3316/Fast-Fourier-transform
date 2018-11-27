function [F] = GroupFFT(f, radix)
    if nargin == 1
        radix = 'f';
    end
    
    f = double(f);
    F = decomposeDFT(f, radix);
end

% f：一维数组
function [F] = decomposeDFT(f, radix)
    M = length(f);
    if isprime(M) || (isfloat(radix) && mod(M, radix) ~= 0)
        F = primeDFT(f);
        return
    end
    
    % H：陪集个数， K：子群的阶
    fac = factor(M);
    if radix == 'f'
        H = fac(1);
    elseif radix == 'b'
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