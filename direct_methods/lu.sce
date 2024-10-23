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

function [L, U, P] = LU_Gauss(A)
    
    n = size(A, 1);
     
    U = A;
    L = eye(n, n);
    P = eye(n, n);
    
    for k = 1:n-1
        
        mayor = [k abs(A(k,k))]
        
        h = k;
            
        while (h <= n)
            if abs(A(h, k)) > mayor(2) then
                mayor(2) = abs(A(h, k));
                mayor(1) = h; 
            end    
            h = h + 1;
        end
        
        temp_U = U(k, k:n);
        U(k, k:n) = U(mayor(1), k:n);
        U(mayor(1), k:n) = temp_U;
        temp_L = L(k, 1:k-1);
        L(k, 1:k-1) = L(mayor(1), 1:k-1);
        L(mayor(1), 1:k-1) = temp_L;
        temp_P = P(k, :);
        P(k, :) = P(mayor(1), :);
        P(mayor(1), :) = temp_P;
        
        for j = k+1:n
           
           L(j, k) = U(j, k)/U(k, k);
           U(j, k:n) = U(j, k:n) - L(j, k) * U(k, k:n);
            
        end 
    end
    
endfunction
