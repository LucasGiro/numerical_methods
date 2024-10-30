function espectro = HouseHolder(A)
    
    [m, n] = size(A);
    
    [z, lambda] = mpotencia(A, rand(m, 1), 1e-9, 100000);
        
    espectro(1) = lambda;
    
    for i = 2:m
        
        [m, n] = size(A);
        
        H = MatrizHouseHolder(A, lambda, z);
    
        Bk = (H*A*H')(2:m, 2:m);

        [z, lambda] = mpotencia(Bk, rand(m-1, 1), 1e-9, 100000);
        
        espectro(i) = lambda;
        
        A = Bk;
         
    end
    
endfunction

//Recibe la matriz A, su autovalor dominante y el autovector asociado.

function H = MatrizHouseHolder(A, lambda, z)
    
    [m, n] = size(A);
    
    z = z / norm(z, 2);
    
    v = z - norm(z, 2) * [1; zeros(m-1, 1)];
    
    H = eye(m, m) - (2*v*v')/(v'*v);
    
endfunction
