function alpha = bisection(f, a, b, epsilon, iter)
    deff("y=g(x)", "y=" + f);
    k = 1;
    i = 0;
    tolerance = log((b-a)/epsilon)/log(2);
    while k < tolerance && i < iter
        
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
        i = i + 1;     
    end
    
    alpha = c;
    
endfunction


function alpha = bisection_iter(f, a, b, iter)
    deff("y=g(x)", "y=" + f);
    k = 0;
    while k < iter
        
        c = (a+b)/2;
        
        disp(c);
        
        if g(c) == 0 then
            break;
        end    
        if (g(b) * g(c)) <= 0 then
                a = c
            else
                b = c        
        end
        k = k+1;
     end    
    
    alpha = c;
    
endfunction

function k = number_of_iterations(a, b, digits)
    
    k = ceil(log((b-a)/(10**(-digits)))/log(2));
    
endfunction
