clear;clc;
f = 'x-exp(1-x)*(1+log(x))';
x0 = 0.8; % Valor inicial 
x1 = 1.5; % Valor inicial
ep = 0.1; % Error propuesto
ea = 100; % Error calculado
k = 1; % Contador de iteraciones
disp('k        xi          %e');
while ea>ep
    x = x0;
    fx0 = eval(f);
    x = x1;
    fx1 = eval(f);
    xi = x1 - ((fx1*(x1-x0))/(fx1-fx0));
    ea = abs((xi-x1)/xi)*100;
    fprintf('%d     %0.6f     %0.6f\n',k,xi,ea);
    x0 = x1;
    x1 = xi;
    k = k + 1;
end
fprintf('\n\nRaíz aproximada: %0.6f\n\n',xi);