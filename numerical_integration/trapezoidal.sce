function w = trapecio(f, a, b, n)
    
    h = (b - a)/n;
    
    w = f(a)/2;
    
    for i = 1:n-1
        w = w + f(a + i*h);
    end
    
    w = w + f(b)/2;
    w = h * w;
    
endfunction

function w = trapecio_v2(f, a, b, n)
    
    h = (b - a)/n;
    
    x = a:h:b;
    
    v = f(x);
    
    v(1) = v(1)/2;
    v(n+1) = v(n+1)/2;
    
    w = h * sum(v);
    
endfunction

