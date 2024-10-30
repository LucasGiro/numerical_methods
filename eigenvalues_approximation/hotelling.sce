function espectro = Hotelling(A)
    
    [m, n] = size(A);
    
    for i = 1:m
        
        [p, lambda] = mpotencia(A, rand(m, 1), 1e-9, 100000);
        p = p / norm(p, 2);
        espectro(i) = lambda;
    
        A = A - lambda*p*p';
        
    end
    
endfunction
