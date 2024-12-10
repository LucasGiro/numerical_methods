function L = Cholesky_L(A)
    
    eps = 1.0e-8;
    
    n = size(A);
    
    L = zeros(n(1), n(1));
    
    t = A(1, 1);
    
    if t <= eps then
        printf("Matriz no definida positiva\n");
        return;
    end
    
    L(1, 1) = sqrt(t);
    
    for i = 2:n(1)
            L(i, 1) = (A(i, 1))/L(1, 1); 
    end  
    
    for j = 2:n(1)
        
        t = A(j, j) - L(j, 1:j-1) *  L(j, 1:j-1)';
        
        if t <= eps then
             printf("Matriz no definida positiva\n");
             return;
        end
        
        L(j, j) = sqrt(t);
        
        for i = j+1:n(1)
            L(i, j) = (A(i, j) - L(i, 1:j-1) * L(j, 1:j-1)')/L(j, j); 
        end    
        
    end
    
    
endfunction

function [U, ind] = Cholesky_U(A)
        eps = 1.0e-8
        n = size(A,1)
        U = zeros(n,n)
        
        t = A(1,1);
        if t <= eps
            printf("Matriz no definida positiva.\n")
            ind = 0
            return
        end
        U(1,1)= sqrt(t);
        for j = 2:n
             U(1,j) = A(1,j)/U(1,1);
        end
        
        for k = 2:n
                t = A(k,k) - U(1:k-1,k)'*U(1:k-1,k)
                if t <= eps
                    printf("Matriz no definida positiva.\n")
                    ind = 0
                    return
                end
                U(k,k)= sqrt(t)
                for j = k+1:n
                     U(k,j) = ( A(k,j) - U(1:k-1,k)'*U(1:k-1,j) )/U(k,k)
                end
        end
    ind = 1
endfunction

function x = upper_triangular(A, b)
    
    n = size(A, 1);
    m = size(b, 2);
    x = zeros(n, m);
    
    x(n, :) = b(n, :)./A(n, n);
    
    for i = n-1:-1:1
        x(i, :) = (b(i, :) - A(i, i+1:n) * x(i+1:n, :))./A(i, i);
    end
    
endfunction

function x = lower_triangular(A, b)
    
    n = size(A, 1);
    m = size(b, 2);
    x = zeros(n, m);
    
    x(1, :) = b(1, :) ./ A(1, 1);
    
    for i = 2:n
        x(i, :) = (b(i, :) - A(i, 1:i-1) * x(1:i-1, :))./A(i, i);
    end
    
endfunction

function s = solve_system(A, b)
        
      L = Cholesky_L(A);
      
      g = lower_triangular(L, b);
      
      s = upper_triangular(L', g);
    
endfunction


function x = solve_system_v2(A, b)
        
      [R, ind] = Cholesky_U(A);
      
      g = lower_triangular(R', b);
      
      x = upper_triangular(R, g);
    
endfunction
