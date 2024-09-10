function y = g(x)
    y = exp(x)
endfunction

function value = taylor(f, n, v)
    
    value = []
    
    for k=0:n
        a = derivative(f, v, k, 0.1)/factorial(k);
        value = [value a]
    end
    
endfunction

function y = taylor2(f, n, v, v0)
    fact = 1;
    v_v0 = v - v0;
    deff("y=DF0(x)", "y="+f);
    y = DF0(v0);
    
    for i=1:n
        
        fact = fact*i;
        deff("y=DF"+string(i)+"(x)", "y=numderivative(DF"+string(i-1)+", x, 0.1, 2)");
        deff("y=temp(x)", "y= DF"+string(i)+"(x)");
        y = y + (temp(v0)*(v_v0)/fact);
        v_v0 = v_v0*(v-v0);
        
    end
endfunction
