function s = Jacobi(A, b, iter)
    
    n = size(A, 1);
    
    s = zeros(n, 1);
    
    k = 0;
    
    while k < iter
        
        for i = 1:n
            
            s(i) = (b(i) - (A(i, :)*s(:, 1) - A(i, i) * s(i, 1)))/A(i, i);
            
        end
        
        k = k + 1;    
         
    end
    
endfunction

function s = closed_Jacobi(A, b, iter)
    
    n = size(A, 1);
    
    D = diag(diag(A));
    
    D_I = inverse_diagonal(D);
    
    s = zeros(n, 1);
    
    for i = 1:iter
        
        s = D_I * b + (eye(n, n) - D_I*A)*s;
        
    end
    
endfunction

function I = inverse_diagonal(D)
    
    n = size(D, 1);
    
    I = zeros(n, n);
    
    for k = 1:n
        I(k, k) = 1/D(k, k);
    end
    
endfunction
