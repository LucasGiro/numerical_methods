function alpha = secant(f, a, b, tolerance, iter)
    
    deff("y=g(x)", "y="+f);
    
    alpha = b - g(b)*((b-a)/(g(b)-g(a)));
    
    k = b;
    
    i = 1;
    
    delta = abs(alpha - k);
    
    while delta > tolerance && i < iter
        a = b;
        b = alpha
        alpha = b - g(b)*((b-a)/(g(b)-g(a)));
        k = b;
        i = i + 1;
        delta = abs(alpha - k);
    end
    
    if delta > tolerance then
         disp("se superó el máximo de iteraciones");
    end
    
endfunction
