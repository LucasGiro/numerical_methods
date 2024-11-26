function w = DD(x, y)
    
    n = length(x);
    
    if n == 1 then
        w = y(1);
        return;
    end
    
    w = (DD(x(2:n), y(2:n))-DD(x(1:n-1), y(1:n-1)))/(x(n)-x(1));
    
endfunction

function A = matriz_DD(x, y)
    
    n = length(x);
    
    A = zeros(n, n);
    
    A(:, 1) = y;
    
    for j = 2:n
        
        for i = j:n
            
            A(i, j) = (A(i, j-1) - A(i-1, j-1))/(x(i)-x((i-j)+1));
             
        end    
        
    end
    
endfunction

function p = DD_newton(x, y)
    r = poly(0, "x");
    p = 0;
    n = length(x);
    
    A = matriz_DD(x, y);
    
    for i = n:-1:2
        
        p = (p + A(i, i)) * (r-x(i-1));
        
    end
    
    p = p + y(1);
    
    
endfunction
