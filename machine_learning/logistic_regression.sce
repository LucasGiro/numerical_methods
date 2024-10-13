X = [1 -2 3; 9 2 -1; 0.5 -0.6 -2; -3.6 2.5 1.3; 2.5 -6.3 2.2; -5.3 .1 0.6];
Y = [1; -1; -1; 1; 1; -1]

function s = suma_gradientes(X, Y, W, n, d)
    
    s = zeros(d, 1);
    
    for i = 1:n
        
        s = s + (Y(i)/(1+exp(Y(i) * X(i, :) * W))) * X(i, :)';
        
    end
    
endfunction

function l = loss(X, Y, W, n, d, lambda)
    
    l = 0;
    
    for i = 1:n
        
        l = l + log(1+exp(-Y(i)*X(i, :)*W));
        
    end
    
    l = l + (lambda/2)*norm(W)**2;
    
endfunction

function W = logistic_regression(X, Y, iter, alpha)
    
    d = size(X, 2);
    n = size(X, 1);
    
    W = rand(d, 1);
    
    lambda = 1e-9;
    
    for k = 1:iter
        
        W = W*(1-alpha*lambda) + alpha * suma_gradientes(X, Y, W, n, d);
        
        disp("loss: " + string(loss(X, Y, W, n, d, lambda)));
        
    end
    
endfunction
