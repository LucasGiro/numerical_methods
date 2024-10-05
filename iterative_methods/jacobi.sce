function s = Jacobi(A, b, iter)
    
    n = size(A, 1);
    
    s = zeros(n, 1);
    
    k = 0;
    
    while k < iter
        
        for i = 1:n
            
            s(i) = (b(i) - (A(i, :)*s(:, 1) - A(i, i) * s(i, 1)))/A(i, i);
            
        end
        
        k = k + 1;    
         
    end
    
endfunction
