function alpha = newton(f, x0, epsilon)
    
    deff("y=g(x)", "y="+f);
    deff("y=Dg(x)", "y=numderivative(g, x, 0.1, 1)");
    
    alpha = x0 - (g(x0)/Dg(x0));
    
    disp("x = " + string(alpha) + ", g(x) = " + string(abs(g(alpha))));
    
    while abs(g(alpha)) > epsilon
        alpha = alpha - (g(alpha)/Dg(alpha));
        disp("x = " + string(alpha) + ", g(x) = " + string(abs(g(alpha))));
    end
    
endfunction

//newton("(cos(x)*cosh(x))+1", -1.4, 0.0000000000000001)
