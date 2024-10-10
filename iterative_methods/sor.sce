function x = SOR(A, b, x0, w, eps, iter)
    
    n = size(A, 1);
    
    x = x0;
    
    x(1) = (1 - w) * x(1) + (b(1, 1) - A(1, 2:n) * x(2:n, 1)) * (w/A(1, 1));
        
    for i = 2:n-1
        
        x(i) = (1 - w) * x(i) + (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n, 1)) * (w/A(i, i));
    
    end
    
    x(n) = (1 - w) * x(n) + (b(n) - A(n, 1:n-1) * x(1:n-1))* (w/A(n, n));
    
    delta = norm(x - x0);
    
    k = 0;
    
    while delta > eps && k < iter
        
        x0 = x;
        
        x(1) = (1 - w) * x(1) + (b(1, 1) - A(1, 2:n) * x(2:n, 1)) * (w/A(1, 1));
        
        for i = 2:n-1
            
            x(i) = (1 - w) * x(i) + (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n, 1)) * (w/A(i, i));
        
        end
    
        x(n) = (1 - w) * x(n) + (b(n) - A(n, 1:n-1) * x(1:n-1)) * (w/A(n, n));    
        
        k = k + 1;
        
        delta = norm(x - x0);
        
    end
    
    disp("numero de iteraciones: " + string(k));
    
endfunction
