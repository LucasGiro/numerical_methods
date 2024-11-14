//Recibe los regresores y una lista de funciones base

function A = create_design_matrix(x, basis_functions)
    
    m = length(x);
    n = length(basis_functions);
    A = zeros(m, n);
    for i = 1:m
        
        for j = 1:n
            
            A(i, j) = basis_functions(j)(x(i, :));
             
        end    
        
    end
    
endfunction

function w = least_squares(x, y, basis_functions)
    
    A = create_design_matrix(x, basis_functions);
    
    w = solve_system(A'*A, A'*y);
    
endfunction

function basis = create_poly_basis(n)
    
    basis = list();
    
    deff("y=p(x)", "y=1");
    basis(1) = p;
    
    for i = 2:n+1
        deff("y=p(x)", "y=x**"+string(i-1));
        basis(i) =p;
    end
    
endfunction
