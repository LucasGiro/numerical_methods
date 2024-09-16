function alpha = regula_falsi(f, a, b, tolerance, iter)
    deff("y=g(x)", "y="+f);
    a1 = a;
    b1 = b;
    
    c = b1 - g(b1)*((b1-a1)/(g(b1)-g(a1)));
       
    if g(a1)*g(c) < 0 then
        a2 = a1;
        delta = abs(b1-c);
        b2 = c;
    elseif g(b1)*g(c) < 0
        delta = abs(a1-c);
        a2 = c;
        b2 = b1;
    else
        alpha = c;
        delta = 0;    
    end

    i = 1;
    
    while delta > tolerance && i < iter
        
         a1 = a2;
         b1 = b2;
    
         c = b1 - g(b1)*((b1-a1)/(g(b1)-g(a1)));
       
         if g(a1)*g(c) < 0 then
               a2 = a1;
               delta = abs(b2-c);
               b2 = c;
         elseif g(b1)*g(c) < 0
               delta = abs(a2-c);
               a2 = c;
               b2 = b1;
         else
               alpha = c;
               break;    
         end
         
         i = i + 1;
        
    end
    
    disp("number of iterations: " + string(i));
    
    alpha = c;
    
endfunction
