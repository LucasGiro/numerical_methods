funcprot(0);

function w = trapecio(F, a, b, n)
    
    h = (b - a)/n;
    
    w = F(a)/2;
    
    for i = 1:n-1
        w = w + F(a + i*h);
    end
    
    w = w + F(b)/2;
    w = h * w;
    
endfunction

function w = trapecio_v2(F, a, b, n)
    
    h = (b - a)/n;
    
    x = a:h:b;
    
    v = F(x);
    l_v = length(v);
    
    if l_v == 1 | l_v == 0 then
        w=0;
        return;
    end
    
    v(1) = v(1)/2;
    
    v(l_v) = v(l_v)/2;
    
    w = h * sum(v);
    
endfunction


function w = trapecio_extendida(f, a, b, c, d, n, m)
    
    h = (b-a)/n;
    
    y = a:h:b;
    deff("z=g0(t)", "z=f(t, "+string(y(1))+")");
    deff("z=gn(t)", "z=f(t, "+string(y(n+1))+")");
    w = (trapecio_v2(g0, c(y(1)), d(y(1)), m) + trapecio_v2(gn, c(y(n+1)), d(y(n+1)), m))/2;
    for i = 2:n
        
        deff("z=g(t)", "z=f(t, "+string(y(i))+")");
        
        w = w + trapecio_v2(g, c(y(i)), d(y(i)), m);
        
    end
    
    w = h * w;
    
    
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

















