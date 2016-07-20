clear;clc;
g = 'exp(1-x)*(1+log(x))'; % Función despejada
x0 = 0.8; % Valor inicial de iteración
ep = 0.1; % Error propuesto (% porcentaje)
k = 1; % Contador de iteraciones
ea = 100; % Error calculado
disp(' k        xi             f(x)              Ea ');
while ea>ep
    x = x0;
    xi = eval(g);
    ea = abs((xi-x0)/xi)*100;
    fprintf(' %d      %1.5f        %1.5f           %g \n',k,x0,xi,ea);
    x0 = xi;
    k = k + 1;
end
fprintf('\n La raiz de la función es: %g \n\n',xi');