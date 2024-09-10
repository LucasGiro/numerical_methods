function alpha = aproximate(f, x0, epsilon)
    
    k = 2^(x0-1);
    disp(k);
    
    while abs(x0 - k) > epsilon
        disp(2*k-2^k);
        x0 = k;
        k = 2^(x0-1);
    end
    
endfunction
