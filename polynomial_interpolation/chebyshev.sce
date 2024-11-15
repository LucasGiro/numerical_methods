function p = chebyshev(n)
    
    if n == 0 then
        p = poly([1], "x", "coeff");
        return;
    end
    
    if n == 1 then
        p = poly([0, 1], "x", "coeff");
        return;
    end
    
    if n == 2 then
        p = poly([-1 0 2], "x", "coeff");
        return;
    end
    
    p = poly([0, 2], "x", "coeff")*chebyshev(n-1)-chebyshev(n-2);
    
endfunction

function w = roots_chebyshev(n)
    
    for i = 0:n-1
        w(i+1) = cos(((2*i+1)*%pi)/(2*n));
    end
    
endfunction

function w = roots_chebyshev_ab(n, a, b)
    
    for i = 0:n-1
        w(i+1) = cos(((2*i+1)*%pi)/(2*n));
    end
    
    w = ((b-a)*w+(a+b))./2;
    
endfunction



