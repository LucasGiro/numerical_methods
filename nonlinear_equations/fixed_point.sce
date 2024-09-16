function salida = fixed_point(f, x0, tol, iter)
    deff("y=g(x)", "y = "+f);
    x1 = x0 - 1/100 * g(x0);
    
    delta = abs(x1-x0);
    i = 0;
    while delta > tol && i < iter
        x0 = x1
        x1 = x0 - 1/100 * g(x0);
        delta = abs(x1-x0);
        disp("f(x) = " + string(g(x1)));
        i = i + 1;
    end
    
    if delta > tol then
        disp("se superó el número de iteraciones");
    end
    
    disp("número de iteraciones: "+ string(i));
    
    salida = x1;
    
endfunction
