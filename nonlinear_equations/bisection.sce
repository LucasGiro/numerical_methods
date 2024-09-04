function alpha = bisection(f, a, b, epsilon)
    deff("y=g(x)", "y=" + f);
    k = 1;
    tolerance = log((b-a)/epsilon)/log(2);
    while k < tolerance
        
        c = (a+b)/2;
        
        if b-c <= epsilon || (g(c) == 0) then
            break;
        end
        if b-c > epsilon then
            
            if (g(b) * g(c)) <= 0 then
                a = c
            else
                b = c        
            end
        end
        k = k+1;    
    end
    
    alpha = [c k];
    
endfunction
