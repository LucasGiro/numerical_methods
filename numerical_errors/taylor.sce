function y = g(x)
    y = exp(x)
endfunction

function value = taylor(f, n, v)
    
    value = []
    
    for k=0:n
        a = derivative(f, v, k, 0.1)/factorial(k);
        value = [value a]
    end
    
endfunction
