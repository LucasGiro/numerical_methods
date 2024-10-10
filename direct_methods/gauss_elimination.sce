function solution = upper_triangular(A, b)
    
    dim_A = size(A);
    dim_b = size(b)
    
    if (dim_A(1) ~= dim_A(2)) then
        disp("La matriz no es cuadrada");
        solution = [];
        return;
    end
    
    solution = zeros(dim_A(1), dim_b(2));
    
    solution(dim_A(1), :) = b(dim_A(1), :)./A(dim_A(1), dim_A(1));
    
    for i = dim_A(1)-1:-1:1
        
        solution(i, :) = (1/A(i, i)) * (b(i, :) - A(i, i+1:$) * solution(i+1:$, :));
        
    end
    
endfunction

function solution = lower_triangular(A, b)
    
    dim_A = size(A);
    
    if (dim_A(1) ~= dim_A(2)) then
        disp("La matriz no es cuadrada");
        solution = [];
        return;
    end
    
    solution = zeros(dim_A(1), 1);
    
    solution(1) = b(1)/A(1, 1);
    
    for i = 2:dim_A(1)
        
        solution(i) = (1/A(i, i)) * (b(i) - A(i, 1:i-1) * solution(1:i-1));
        
    end
    
endfunction

function [C, d] = GaussElim(A, b)
    
    n = size(A, 1);
    
    for j = 1:n-1
        
        for i = j+1:n
            
            m = A(i, j)/A(j, j);
            
            A(i, :) = A(i, :) - m * A(j, :);
            b(i, :) = b(i, :) - m * b(j, :);
                
        end
        
    end
    
    C = A;
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

