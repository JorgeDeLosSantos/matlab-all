function RKS = rks4(F,a,b,Z0,h)
 % Método Runge-Kutta 4 para sistemas de ecuaciones diferenciales
% Programa para sistemas de ecuaciones del tipo:
% x' = f(t,x,y)   x(t0) = x0
% y' = f(t,x,y)   y(t0) = y0
 
% Introducimos Ecuaciones (function_handle):
% fx = input( 'Introduce la función f(t,x,y) de la 1ª Ecuación:\nfx:' );
% fy = input( 'Introduce la función f(t,x,y) de la 2ª Ecuación:\nfy:' );
% % Introducimos condiciones iniciales:
% Z0 = input( 'Introduce condiciones iniciales Z0 = [ x0 , y0 ]:\n');
% % Introducimos valores:
% h = input( 'Introduce el tamaño de paso:\nh:' );
% a = input( 'Introduce el extremo inferior del intervalo:\na:' );
% b = input( 'Introduce el extremo superior del intervalo:\nb:' );
% Número de pasos
fx=F{1};
fy=F{2};
M = ( b - a ) / h ;
 
% Cálculo:
T = zeros( 1 , M + 1 );     % Vector de Abscisas
X = zeros( 1 , M + 1 );     % Vector de Ordenadas Xk
Y = zeros( 1 , M + 1 );     % Vector de Ordenadas Yk
T = a : h : b ;
X(1) = Z0(1,1);
Y(1) = Z0(1,2);
for j = 1 : M
    f1 = feval( fx , T(j) , X(j) , Y(j) );
    g1 = feval( fy , T(j) , X(j) , Y(j) );
    f2 = feval( fx , T(j) + h/2 , X(j) + h/2 * f1 , Y(j) + h/2 * g1 );
    g2 = feval( fy , T(j) + h/2 , X(j) + h/2 * f1 , Y(j) + h/2 * g1 );
    f3 = feval( fx , T(j) + h/2 , X(j) + h/2 * f2 , Y(j) + h/2 * g2 );
    g3 = feval( fy , T(j) + h/2 , X(j) + h/2 * f2 , Y(j) + h/2 * g2 );
    f4 = feval( fx , T(j) + h , X(j) + h * f3 , Y(j) + h * g3);
    g4 = feval( fy , T(j) + h , X(j) + h * f3 , Y(j) + h * g3);
    X( j + 1 ) = X( j ) + ( h/6 )*( f1 + 2 * f2 + 2 * f3 + f4 );
    Y( j + 1 ) = Y( j ) + ( h/6 )*( g1 + 2 * g2 + 2 * g3 + g4 );
end
 
% Resultado:
RKS = [ T' X' Y' ];
end