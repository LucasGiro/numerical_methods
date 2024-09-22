function salida = fixed_point(f, x0, tol, iter)
    deff("y=g(x)", "y = "+f);
    x1 = g(x0);
    
    delta = abs(x1-x0);
    i = 1;
    while delta > tol && i < iter
        x0 = x1
        x1 = g(x0);
        delta = abs(x1-x0);
        i = i + 1;
    end
    
    if delta > tol then
        disp("se superó el número de iteraciones");
    end
    
    disp("número de iteraciones: "+ string(i));
    
    salida = x1;
    
endfunction
