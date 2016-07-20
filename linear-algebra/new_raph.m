clear;clc;
ec = 'x-exp(1-x)*(1+log(x))'; % Original
der = 'exp(1-x)*(1+log(x))-(exp(1-x)/x)+1'; % Derivada
ep = 0.1; % Error propuesto
ea = 100; % Error calculado
x0 = 0.1; % Punto inicial
k = 1; % Contador de iteraciones
disp('k        xi           %e');
while ea > ep
    x = x0;
    xi = x0 - eval(ec)/eval(der);
    ea = abs((xi-x0)/xi)*100;
    fprintf('%d     %0.6f     %0.6f\n',k,xi,ea);
    x0 = xi;
    k = k + 1;
end
fprintf('\n\nLa raíz encontrada es: %0.6f\n\n',xi);