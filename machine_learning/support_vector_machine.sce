X = [1 -2 3; 9 2 -1; 0.5 -0.6 -2; -3.6 2.5 1.3; 2.5 -6.3 2.2; -5.3 .1 0.6];
Y = [1; -1; -1; 1; 1; -1]

function l = loss(w, X, Y, lambda)
    
    n = size(X, 1);
    
    l = 0;
    
    for i = 1:n
        
        l = l + (max(0, (1- Y(i, 1)*(X(i, :)*w)))**2)/2;        
    end
    
    l = l + (lambda/2) * norm(w)**2;
    
endfunction

function grad = gradients_sum(w, X, Y)
    
    n = size(X, 1);
    
    grad = zeros(size(X, 2), 1);
    
    for i = 1:n
        
        grad = grad + Y(i)*X(i, :)'*max(0, 1-Y(i, 1)*X(i, :)*w);
        
    end
    
endfunction

function w = train(X, Y, iter, alpha)
    
    d = size(X, 2);
    
    lambda = 10e-9;
    
    w = rand(d, 1);
    
    for i= 1:iter
        
        w = w * (1-alpha*lambda) + alpha * gradients_sum(w, X, Y);
        
        disp("error: " + string(loss(w, X, Y, lambda)));
        
    end
    
endfunction
