//Recibe los regresores y una lista de funciones base
funcprot(0);

function A = create_design_matrix(x, basis_functions)
    
    m = size(x, 1);
    n = length(basis_functions);
    A = zeros(m, n);
    for j = 1:n
        A(:, j) = basis_functions(j)(x);
    end
    
endfunction

function w = least_squares(x, y, basis_functions)
    
    A = create_design_matrix(x, basis_functions);
    
    w = solve_system(A'*A, A'*y);
    
    disp("Error: " + string(norm(A*w-y)));
    
endfunction

function w = least_squares_QR(x, y, basis_functions)
    
    A = create_design_matrix(x, basis_functions);
    
    [Q, R] = QR_v2(A);
    
    w = upper_triangular(R, Q'*y);
    
    disp("Error: " + string(norm(A*w-y)));
    
endfunction

function basis = create_poly_basis(n)
    
    basis = list();
    
    deff("y=p(x)", "y=ones(size(x, 1), 1)");
    basis(1) = p;
    
    for i = 2:n+1
        deff("y=p(x)", "y=x.^"+string(i-1));
        basis(i) = p;
    end
    
endfunction

function basis = create_multivar_linear_basis(n)
    basis = list();
    
    deff("y=f(x)", "y=ones(size(x, 1), 1)");
    basis(1) = f;
    
    for i = 2:n+1
        deff("y=f(x)", "y=x(:,"+string(i-1)+")");
        basis(i) = f; 
    end
    
endfunction

function basis = create_trigonometric_basis(n)
    basis = list();
    
    deff("y=p(x)", "y=ones(size(x, 1), 1)");
    basis(1) = p;
    
    for i = 2:n+1
         deff("y=p(x)", "y=cos("+string(i-1)+".*x)");
          basis(i) = p;
    end
    
    for i = n+2:2*n+1
         deff("y=p(x)", "y=sin("+string(i-1-n)+".*x)");
          basis(i) = p;
    end
    
endfunction

function basis = create_exponential_basis(n)
    basis = list();
    
    for i = 1:n
         deff("y=p(x)", "y=exp("+string(i)+"*x)");
          basis(i) = p;
    end
   
endfunction

function y = evaluate_trigonometric_basis(x, w, n)
     y = ones(size(x, 2)) * w(1);
    
     for i = 2:n+1
         y = y + w(i)*cos((i-1).*x);
    end
    
    for i = n+2:2*n+1
         y = y + w(i)*sin((i-1-n).*x);
    end
endfunction

function basis = create_multivar_poly_basis(n)
    basis = list();
    
    deff("y=f(x)", "y=ones(size(x, 1), 1)");
    basis(1) = f;
    deff("y=f(x)", "y=x(:, 1)");
    basis(2) = f;
    deff("y=f(x)", "y=x(:, 2)");
    basis(3) = f;
    deff("y=f(x)", "y=x(:, 1).^2");
    basis(4) = f;
    deff("y=f(x)", "y=x(:, 1).*x(:, 2)");
    basis(5) = f;
    deff("y=f(x)", "y=x(:, 2).^2");
    basis(6) = f;
    
endfunction

/*X = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20];
Y = [14.5; 16.0; 12.2; 29.1; 23.0; 27.4; 30.2; 36.8; 38.5; 33.1; 45.8; 51.0; 50.1; 53.3; 57.0; 54.2; 60.3; 49.0; 66.2; 52.0];

// Visualización de los datos generados
clf
subplot(1,1,1)
plot(X, Y, 'o');
xlabel("X");
ylabel("Y");

p = poly(least_squares(X, Y, create_poly_basis(2)), "x", "coeff");

x_vals = linspace(-10, 30, 100);  // Rango de valores para 'x'
y_vals = horner(p, x_vals);       // Evaluación del polinomio en cada valor de x

subplot(1,1,1)
plot2d(x_vals, y_vals, style=2);
*/

// para graficar en 3d

/*
X = [0 0; 0 1; 1 0; 2 0; 2 1; 2 2];
Y = [1.42;1.85;0.78;0.18;0.60;1.05];
w = least_squares(X, Y, create_multivar_linear_basis(2));
disp(w);
deff("z=f(x, y)", "z=w(1)+w(2)*x+w(3)*y");

x_points = X(:, 1); // Primera columna de X
y_points = X(:, 2); // Segunda columna de X
z_points = Y;       // Coordenada z

// Graficar los puntos 3D
clf(); // Limpiar la figura
scatter3d(x_points, y_points, z_points, 100); // Gráfico de puntos

// Crear un rango para graficar el plano
x_plane = linspace(-2, 4, 100); // Rango de x
y_plane = linspace(-2, 4, 100); // Rango de y
[X_plane, Y_plane] = meshgrid(x_plane, y_plane); // Crear malla de puntos
Z_plane = f(X_plane, Y_plane); // Evaluar la función del plano en la malla

// Graficar el plano sobre los puntos
surf(X_plane, Y_plane, Z_plane);

// Etiquetas de los ejes y título
xlabel("x");
ylabel("y");
zlabel("z");
title("Gráfico 3D de puntos y plano ajustado");
*/
