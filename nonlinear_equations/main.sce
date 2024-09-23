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
    
    disp("la raiz encontrada con biseccion es: " + string(root));
    
    alpha2 = secant(f, a, b,  0.0000000000001, 10000);
    
    disp("la raiz encontrada con secante es: " + string(alpha2));
    
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
    
    alpha = bisection(f, a, b, 0.0000000000001, 10000);
    
    disp("la raiz encontrada con biseccion es: " + string(alpha));
    
    alpha2 = secant(f, a, b,  0.0000000000001, 10000);
    
    disp("la raiz encontrada con secante es: " + string(alpha2));
    
    c = (deriv_value-1)/numderivative(h, alpha);
    
endfunction

function alpha = graficar(f, a, b)
    deff("y=h(x)", "y="+f); //x.^2 - 2*x
    x = linspace(a, b, 1000);
    y = h(x);
    x0 = linspace(a, b, 1000);
    y0 = linspace(a, b, 1000);
    plot(x, y, x0, y0);
endfunction
