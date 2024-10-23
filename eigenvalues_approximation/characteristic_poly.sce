function A = A_eps(eps)
    
    A = [1 -1 0; -2 4 -2; 0 -1 1+eps];
    x = poly(0, "x");
    p_A = det(eye(3, 3)*x-A);
    disp("polinomio característico: ");
    disp(p_A);
    disp("sus raices son: ");
    disp(roots(p_A));
    disp("sus autovalores son: ");
    disp(spec(A)); 
    
endfunction
