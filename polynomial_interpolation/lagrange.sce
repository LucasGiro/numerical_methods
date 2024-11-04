function p = Lagrange(x, y)
    
    n = size(x, 1);
    
    L = ones(n, 1);
    
    for k = 1:n
        
        L(k) = poly([x(1:k-1); x(k+1:n)], "x", "roots");
        
        L(k) = L(k) / horner(L(k), x(k));
         
    end
    
    p = L' * y;
    
endfunction
