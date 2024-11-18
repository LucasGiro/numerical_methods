function w = simpson(f, a, b, n)
    
    h = (b-a)/n;
    
    w = f(a);
    
    for i = 2:2:n-2
        w = w + 2*f(a+i*h);
    end
    
    for i = 1:2:n-1
        w = w + 4*f(a+i*h);
    end
    
    w = w + f(b);
    
    w = (h/3) * w;
    
endfunction

function w = simpson_v2(f, a, b, n)
    
    h = (b-a)/n;
    
    p = a+2*h:2*h:b-2*h;
    i = a+h:2*h:b-h;
    p = 2 * f(p);
    i = 4 * f(i);
    
    w = (h/3) * sum([f(a) p i f(b)]);
    
endfunction
