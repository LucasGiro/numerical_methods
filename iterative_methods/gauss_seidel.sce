function x = Gauss_Seidel(A, b, x0, eps, iter)
    
    n = size(A, 1);
    
    x = x0;
    
    x(1) = (b(1, 1) - A(1, 2:n) * x(2:n, 1))/A(1, 1);
        
    for i = 2:n-1
        
        x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n, 1))/A(i, i);
    
    end
    
    x(n) = (b(n) - A(n, 1:n-1) * x(1:n-1))/A(n, n);
    
    delta = norm(x - x0);
    
    k = 1;
    
    while delta > eps && k < iter
        
        x0 = x;
        
        x(1) = (b(1, 1) - A(1, 2:n) * x(2:n, 1))/A(1, 1);
        
        for i = 2:n-1
            
            x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n, 1))/A(i, i);
        
        end
    
        x(n) = (b(n) - A(n, 1:n-1) * x(1:n-1))/A(n, n);    
        
        k = k + 1;
        
        delta = norm(x - x0);
        
    end
    
    disp("numero de iteraciones: " + string(k));
    
endfunction

function T = matriz_iteracion_gauss_seidel(A)
    [m, n] = size(A);
    T = eye(m, m) - inv(tril(A))*A;
endfunction

function s = closed_Gauss_Seidel(A, b, iter)
    
    n = size(A, 1);
   
    D = diag(diag(A));
    
    L = tril(A) - D;
    U = triu(A) - D;
    
    inversa = inv(L+D);
    
    s = zeros(n, 1);
    
    for i = 1:iter
        
        s = inversa*b + (eye(n, n) - inversa*A)*s;
        
    end
    
endfunction


