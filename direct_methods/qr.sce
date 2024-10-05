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
        s = suma_vec(A, Q, k);
        Q(1:n, k) = v/z;
        R(k, k) = z;

    end
    
endfunction

function s = solve_system(A, b)
    
    [Q, R] = QR(A);
    
    s = upper_triangular(R, Q'*b);
    
endfunction
