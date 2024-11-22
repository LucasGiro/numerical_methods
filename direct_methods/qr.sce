function [Q, R] = QR(A)
    
    n = size(A, 1);
    
    Q = zeros(n, n);
    R = zeros(n, n);
    
    z = norm(A(:, 1));
    Q(1:n, 1) = A(:, 1)/z;
    R(1, 1) = z;
    
    for k = 2:n
        
         s = zeros(n, 1);
    
        for i = 1:k-1;
            R(i, k) = A(:, k)'*Q(:, i);
            s = s + R(i, k) * Q(:, i);
        end
        
        v = (A(:, k) - s);
        z = norm(v);
        Q(1:n, k) = v/z;
        R(k, k) = z;

    end
    
endfunction

function [Q, R] = QR_v2(A)
    
    [m, n] = size(A);
    
    Q = zeros(m, n);
    R = zeros(n, n);
    
    a1 = A(:, 1);
    a1_norm = norm(A(:, 1));
    
    Q(:, 1) = a1 / a1_norm;
    R(1, 1) = a1_norm;
    
    for k = 2:n
        
        v = A(:, k)' * Q(:, 1:k-1);
        qk = A(:, k) - (v * Q(:, 1:k-1)')';
        qk_norm = norm(qk);
        
        Q(:, k) = qk / qk_norm;
        R(k, k) = qk_norm;
        R(1:k-1, k) = v';
        
    end
    
endfunction

function s = solve_system(A, b)
    
    [Q, R] = QR(A);
    
    s = upper_triangular(R, Q'*b);
    
endfunction
