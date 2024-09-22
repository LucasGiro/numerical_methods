function s = serie(expression, inicio, fin)
    
    deff("y=f(x)", "y="+expression);
    s = 0;
    for n = inicio:fin
        s = s + f(n);
        disp(s);
    end
    
endfunction


function alpha = convergencia(f, g, a, b)
    
    deff("y=h(x)", "y="+f);
    deff("y=t(x)", "y="+g);
    
    root = bisection(f, a, b, 0.000000001, 10000);
    
    derivative_abs = abs(numderivative(t, root));
    
    if derivative_abs < 1 then
        disp("converge");
    elseif derivative_abs > 1
        disp("no converge");
    elseif derivative_abs == 1
        disp("no decide");
    end
    
    alpha = derivative_abs;
    
endfunction

function c = find_c(f, deriv_value, a, b)
    
    deff("y=h(x)", "y="+f);
    
    alpha = bisection(f, a, b, 0.000000001, 10000);
    
    c = (deriv_value-1)/numderivative(h, alpha);
    
endfunction
