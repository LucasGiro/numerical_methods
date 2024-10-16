function circ(r, x, y)
    rect = [-5, -5, 5, 5]
    plot2d(0,0,0,rect=rect,frameflag=3,axesflag=5);
    xarc(x-r,r+y,r*2,r*2,1,64*360);
    plot(x, y, 'o');
endfunction

function Gers(A)
    
    [m, n] = size(A);
   
    r = sum(abs(A(1, 2:$)));
    
    circ(r, abs(A(1, 1)), 0);
    
    for i = 2:n-1
   
        r = sum(abs([A(i, 1:i-1) A(i, i+1:$)]));
        
        circ(r, abs(A(i, i)), 0);
        
    end
    
     r = sum(abs(A(n, 1:n-1)));
    
     circ(r, abs(A(n, n)), 0);
    
endfunction

function CircGersValor(A)
    
    Gers(A);
    
    autovalores = spec(A);
    
    n = size(autovalores, 1);
    
    disp(n);
    
    for i = 1:n
        
        plot(real(autovalores(i)), imag(autovalores(i)), 'o', 'MarkerFaceColor', 'r');
        
    end
    
endfunction
