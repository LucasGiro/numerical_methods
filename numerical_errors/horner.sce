function value = Horner(p, x0)
    
    n = length(p) - 1;
    bn = p(n+1);
    bi = bn;
    
    deriv = 0;
    
    for i=n:-1:1
        deriv = deriv + bi * x0**(i-1)
        bi = p(i) + x0*bi
    end
    
    value = [bi deriv]
    
endfunction
