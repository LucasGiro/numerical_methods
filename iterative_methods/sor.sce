function x = SOR(A, b, x0, w, eps, iter)
    
    n = size(A, 1);
    
    x = x0;
    
    x(1) = (1 - w) * x0(1) + (b(1, 1) - A(1, 2:n) * x0(2:n, 1)) * (w/A(1, 1));
        
    for i = 2:n-1
        
        x(i) = (1 - w) * x0(i) + (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x0(i+1:n, 1)) * (w/A(i, i));
    
    end
    
    x(n) = (1 - w) * x0(n) + (b(n) - A(n, 1:n-1) * x(1:n-1))* (w/A(n, n));
    
    delta = norm(x - x0);
    
    k = 1;
    
    while delta > eps && k < iter
        
        x0 = x;
        
        x(1) = (1 - w) * x0(1) + (b(1, 1) - A(1, 2:n) * x0(2:n, 1)) * (w/A(1, 1));
        
        for i = 2:n-1
            
            x(i) = (1 - w) * x0(i) + (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x0(i+1:n, 1)) * (w/A(i, i));
        
        end
    
        x(n) = (1 - w) * x0(n) + (b(n) - A(n, 1:n-1) * x(1:n-1)) * (w/A(n, n));    
        
        k = k + 1;
        
        delta = norm(x - x0);
        
    end
    
    disp("numero de iteraciones: " + string(k));
    
endfunction

function T = calculo_T(A, w)
    
    D = diag(diag(A));
    
    L = tril(A) - D;
    
    U = triu(A) - D;
    
    T = inv(D+w*L)*((1-w)*D-w*U);
    
endfunction

function k = radio_espectral(A)
    k = max(abs(spec(A)));
endfunction

function m = minimizar_radio_espectral(A, w, step, iter)
    
    T = calculo_T(A, w);
    
    min_r = radio_espectral(T);
    
    m = w;
    
    for i = 1:iter
        
        w = w-step;
        
        T = calculo_T(A, w);
    
        k = radio_espectral(T);
        
        if k < min_r then
            min_r = k;
            m = w;
        end     
        
    end
    
endfunction

