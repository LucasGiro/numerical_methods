function [L, U] = Doolittle(A)
    
    n = size(A, 1);
    
    L = eye(n, n);
    
    U = zeros(n, n);
    
    U(1, :) = A(1, :);
    
    L(:, 1) = A(:, 1)./U(1, 1);
    
    for k = 2:n
        
        for j = 1:n
           
           U(k, j) = A(k, j) - L(k, 1:k-1) * U(1:k-1, j);
            
        end
        
        for i = 1:n
            L(i, k) = (A(i, k) - L(i, 1:k-1) * U(1:k-1, k))./U(k, k);
        end         
        
    end
    
endfunction
