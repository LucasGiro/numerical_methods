function x = Jacobi(A, b, x0, eps, iter)
    
    n = size(A, 1);
    
    s = zeros(n, 1);
    
    x = x0;
    
    for i = 1:n
            
          x(i) = (b(i) - (A(i, :)*x0(:, 1) - A(i, i) * x0(i, 1)))/A(i, i);
            
    end
    
    k = 0;
    
    delta = norm(x - x0); 
    
    while delta > eps && k < iter
        
        x0 = x;
        
        for i = 1:n
            
            x(i) = (b(i) - (A(i, :)*x0(:, 1) - A(i, i) * x0(i, 1)))/A(i, i);
            
        end
        
        delta = norm(x - x0);
        
        k = k + 1;    
         
    end
    
    disp("numero de iteraciones: " + string(k));
    
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
    
    I = diag(ones(n, 1)./diag(D));
    
endfunction
