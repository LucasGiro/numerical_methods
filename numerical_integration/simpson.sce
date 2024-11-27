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

function w = simpson_aux(f, a, b, y, n)
    
    h = (b-a)/n;
    
    p = a+2*h:2*h:b-2*h;
    i = a+h:2*h:b-h;
    p = 2 * f(p, y);
    i = 4 * f(i, y);
    
    w = (h/3) * sum([f(a, y) p i f(b, y)]);
    
endfunction


function w = simpson_extendida(f, a, b, c, d, n, m)
    
    h = (b-a)/n;
    
    p = a+2*h:2*h:b-2*h;
    i = a+h:2*h:b-h;
    
    w = (simpson_aux(f, c(a), d(a), a, m) + simpson_aux(f, c(b), d(b), b, m));
    for j = 1:length(p)
        
        w = w + 2 * simpson_aux(f, c(p(j)), d(p(j)), p(j), m);
        
    end
    
    for j = 1:length(i)
         w = w + 4 * simpson_aux(f, c(i(j)), d(i(j)), i(j), m);
    end
    
    w = (h/3) * w;
    
endfunction

function w = uno(x, y)
    w = ones(1, length(x));
endfunction

function w = cx(x)
    w = -sqrt(2*x-x.^2);
endfunction

function w = dx(x)
    w = sqrt(2*x-x.^2);
endfunction
