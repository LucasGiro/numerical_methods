function [L, U] = factorizacion_LU(A)
    
    n = size(A, 1);
    
    L = eye(n, n);
    
    for j = 1:n-1
        
        for i = j+1:n
            
            m = A(i, j)/A(j, j);
            
            A(i, :) = A(i, :) - m * A(j, :);
            
            L(i, j) = m;
                
        end
        
    end
    
    U = A;
    
endfunction