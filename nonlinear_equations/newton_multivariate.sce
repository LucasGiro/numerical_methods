function salida = f(x)
    salida = [1 + x(1)**2 - x(2)**2 + exp(x(1))*cos(x(2))- x(3)**3; 2*x(1)*x(2)+exp(x(1))*sin(x(2)); x(3)**2+x(3)*(x(4)**3)-9 + x(3)**3; 3*x(3)**2*x(4)-4-x(4)**3];
endfunction

function solution_vector = newton_multivariate(f, x0, tol, iter)
    
    J = numderivative(f, x0);
    
    x1 = x0 - inv(J) * f(x0);
    
    delta = norm(x1 - x0, 2);
    i = 0;
    while delta > tol && i < iter
        x0 = x1;
        J = numderivative(f, x0);
        x1 = x0 - inv(J) * f(x0);
        delta = norm(x1 - x0, 2);
        i = i + 1;
        disp("f(x) = " + string(f(x0)));
    end
    
    if delta > tol then
        disp("se superó el número de iteraciones");
    end
    
    solution_vector = x1;
    
endfunction
