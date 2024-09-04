function value = raices(p)
    c = p(1);
    b = p(2);
    a = p(3);
    
    delta = (b^2)-4*a*c;
    
    if b < 0 then
        x_negative = (2*c)/(-b+sqrt(delta));
        x_posisitive = ((-b)+sqrt(delta))/(2*a);
        value = [x_negative x_posisitive];
    else
        x_negative = (-b-sqrt(delta))/(2*a);
        x_posisitive = (2*c)/(-b-sqrt(delta));
        value = [x_negative x_posisitive];
    end
    
endfunction

function r = resolvente(p)
    a = coeff(p, 2)
    b = coeff(p, 1)
    c = coeff(p, 0)

    delta = b^2 - 4*a*c
    x1 = (-b - sqrt(delta)) / 2*a
    x2 = (-b + sqrt(delta)) / 2*a
    r = [x1; x2]
endfunction
