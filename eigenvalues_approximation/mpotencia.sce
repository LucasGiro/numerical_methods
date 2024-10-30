function [autovec, autoval] = mpotencia(A, z0, eps, iter)
    
    w0 = A*z0;
    
    autovec = w0/norm(w0, %inf);
    
    [m, k] = max(abs(w0));
    
    autoval = w0(k)/z0(k);
    
    autovec = w0/autoval; // acelera la convergencia
    
    i = 1;
    
    while (i < iter && norm(autovec - z0, %inf) > eps)
        
        z0 = autovec;
        
        w = A*z0;
    
        autovec = w/norm(w, %inf);
        
        [m, k] = max(abs(w0));
        
        autoval = w(k)/z0(k);
        
        autovec = w/autoval; // acelera la convergencia
        
        w0 = w;
        
        i = i + 1;
        
    end
   
    disp("Numero de iteraciones: " + string(i));
    
endfunction
