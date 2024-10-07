function s = Gauss_Seidel(A, b, iter)
    
    n = size(A, 1);
    
    s = rand(n, 1);
    
    for k = 1:iter
        
        s(1) = (b(1, 1) - A(1, 2:n) * s(2:n, 1))/A(1, 1);
        
        for i = 2:n-1
            
            s(i) = (b(i) - A(i, 1:i-1) * s(1:i-1) - A(i, i+1:n) * s(i+1:n, 1))/A(i, i);
        
        end
    
        s(n) = (b(n) - A(n, 1:n-1) * s(1:n-1))/A(n, n);    
        
    end
    
endfunction

function s = closed_Gauss_Seidel(A, b, iter)
    
    n = size(A, 1);
    
    L = tril(A);
    U = triu(A);
    D = diag(diag(A));
    
    inversa = inv(L+D);
    
    s = zeros(n, 1);
    
    for i = 1:iter
        
        s = inversa*b + (eye(n, n) - inversa*A)*s;
        
    end
    
endfunction


