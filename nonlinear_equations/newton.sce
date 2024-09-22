function alpha = newton(f, x0, tol, iter, h)
    
    deff("y=g(x)", "y="+f);
    
    gx0 = g(x0);
    
    dgx0 = (g(x0+h)-gx0)/h;
    
    x1 = x0 - (gx0/dgx0);
    
    disp("x = " + string(x1) + ", g(x) = " + string(abs(g(x1))));
    
    i = 0;
    
    delta = abs(x1-x0);
            
    while delta > tol && i < iter
        i = i + 1;
        x0 = x1;
        gx1 = g(x1);
        dgx1 = (g(x1+h)-gx1)/h;
        x1 = x1 - (gx1/dgx1);
        delta = abs(x1-x0);
        disp("x = " + string(x1) + ", g(x) = " + string(abs(g(x1))));
    end

    if delta > tol then
         disp("se superó el máximo de iteraciones");
    end
    
    alpha = x1;
    
endfunction
