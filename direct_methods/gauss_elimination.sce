function x = upper_triangular(A, b)
    
    n = size(A, 1);
    m = size(b, 2);
    x = zeros(n, m);
    
    if ~es_cuadrada(A) then
        disp("La matriz no es cuadrada");
        x = [];
        return;
    end
    
    x(n, :) = b(n, :)./A(n, n);
    
    for i = n-1:-1:1
        x(i, :) = (b(i, :) - A(i, i+1:n) * x(i+1:n, :))./A(i, i);
    end
    
endfunction

function x = lower_triangular(A, b)
    
    [m, n] = size(A);
    x = zeros(m, 1);
    
    if ~es_cuadrada(A) then
        disp("La matriz no es cuadrada");
        x = [];
        return;
    end
    
    x(1) = b(1, 1) / A(1, 1);
    
    for i = 2:m
        x(i) = (b(i, 1) - A(i, 1:i-1) * x(1:i-1, 1))/A(i, i);
    end
    
endfunction

function [U, d] = GaussElim(A, b)
    
    n = size(A, 1);
    
    if ~es_cuadrada(A) then
        disp("La matriz no es cuadrada");
        x = [];
        return;
    end
    
    for k = 1:n-1
        
        for i = k+1:n
            
            m = A(i, k)/A(k, k);
            
            A(i, :) = A(i, :) - m * A(k, :);
            b(i, :) = b(i, :) - m * b(k, :);
                
        end
        
    end
    
    U = A;
    d = b;
    
endfunction


function d = det_Gauss_Elim(A)
    
    dim_A = size(A);
    
    b = zeros(dim_A(1), 1);
    
    C = GaussElim(A, b)
    
    diagonal = diag(C);
    
    d = prod(diagonal);
    
endfunction

function [C, d] = pivoteo_parcial(A, b)
    
    n = size(A, 1);
    
    for j = 1:n-1
        
        mayor = [j abs(A(j,j))]
        
        h = j;
            
        while (h <= n)
            if abs(A(h, j)) > mayor(2) then
                mayor(2) = abs(A(h, j));
                mayor(1) = h; 
            end    
            h = h + 1;
        end
        
        if (mayor(2) == 0) then
            disp("la matriz es singular");
            return;
        end
       
        temp_A = A(j, :);
        temp_b = b(j, :);
    
        A(j, :) = A(mayor(1), :);
        b(j, :) = b(mayor(1), :);
    
        A(mayor(1), :) = temp_A;
        b(mayor(1), :) = temp_b;
         
        for i = j+1:n
            
            m = A(i, j)/A(j, j);
            
            A(i, :) = A(i, :) - m * A(j, :);
            b(i, :) = b(i, :) - m * b(j, :);
                
        end
        
    end
    
    C = A;
    d = b;
    
endfunction

function s = tridiagonal(A, b)
    
    n = size(A, 1);
    
    s = zeros(n, size(b, 2));
    
    for k = 1:n-1
        
        //pivoteo
        
        if abs(A(k, k)) < abs(A(k+1, k)) then
            
            temp = A(k, :);
            A(k, :) = A(k+1, :);
            A(k+1, :) = temp;
            temp = b(k, :);
            b(k, :) = b(k+1, :);
            b(k+1, :) = temp;
            
        end    
        
        //fin pivoteo
        
        m = A(k+1, k)/A(k, k);
        
        A(k+1, :) = A(k+1, :) - m * A(k, :);
        
        b(k+1, :) = b(k+1, :) - m * b(k, :);
        
    end
    
    s(n, :) = b(n, :)./A(n, n);
    
    for k = n-1:-1:1
        
        s(k, :) = (b(k, :) - A(k, k+1:$) * s(k+1:$, :))./A(k, k);
        
    end
    
endfunction

function x = solve_system(A, b)
    
    [C, d] = pivoteo_parcial(A, b);
    
    x = upper_triangular(C, d);
    
endfunction

function ok = es_cuadrada(A)
    
    [m, n] = size(A);
    
    if (m<>n) then
        ok = %F;
    else
        ok = %T;         
    end
    
endfunction

