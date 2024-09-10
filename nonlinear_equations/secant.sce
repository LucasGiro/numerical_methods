function alpha = secant(f, a, b, epsilon)
    
    deff("y=g(x)", "y="+f);
    
    alpha = b - g(b)*((b-a)/(g(b)-g(a)));
    
    k = b;
    
    while abs(alpha - k) > epsilon
        a = b;
        b = alpha
        alpha = b - g(b)*((b-a)/(g(b)-g(a)));
        k = b;
    end
    
endfunction
