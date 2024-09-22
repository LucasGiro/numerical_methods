//calculo con diferencias finitas

function valor = derivar(f, v, n, h)
    if n == 0 then
        valor = f(v);
    else
        valor = (derivar(f, v+h, n-1, h)-derivar(f, v, n-1, h))/h;    
    end
endfunction

//definiendo las derivadas simbólicamente

function valor = derivada(f, v, n, h)
    deff("y=DF0(x)", "y = " + f);
    if n == 0 then
        valor = DF0(v);
    else
        for i=1:(n-1)
            deff("y=DF"+string(i)+"(x)", "y = (DF"+string(i-1)+"(x+"+string(h)+")-DF"+string(i-1)+"(x))/"+string(h));
        end
        deff("y=DFn(x)","y = (DF"+string(n-1)+"(x+"+string(h)+")-DF"+string(n-1)+"(x))/"+string(h));
        valor = DFn(v);       
    end
endfunction

//usando numderivative

function valor = derivative(f, v, n, h)
    deff("y=DF0(x)", "y = " + f);
    if n == 0 then
        valor = DF0(v);
    else
        for i=1:(n-1)
            deff("y=DF"+string(i)+"(x)", "y = numderivative(DF"+string(i-1)+", x,"+string(h)+", 4)");
        end
        deff("y=DFn(x)","y=numderivative(DF"+string(n-1)+",x,"+string(h)+",4)");
        valor = DFn(v);       
    end
endfunction


