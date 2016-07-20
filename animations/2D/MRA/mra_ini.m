%  Programa principal que grafica la posicion y velocidad de un sistema 
%  mecanico masa-resorte-amortiguador mediante la instruccion ode45. 
%  Tambien se incluye una animacion sencilla.
%  Requisitos: mra.m y dibujomasa.m

%  Realizo: Ricardo Cuesta
%  Fecha: 15/11/12
%  Version: 0.1

clc; clear; clf;            % limpia pantalla, variables y figura

t = linspace(0,10,1000);    % tiempo de simulacion
x0 = [0;0];                 % condiciones iniciales

[t,x] = ode45(@mra,t,x0);   % solucion de la EDO 
figure(1) 
subplot(2,1,1)
plot(t,x(:,1))              % grafica posicion
legend('posicion')

subplot(2,1,2)
plot(t,x(:,2))              % grafica velocidad
legend('velocidad')

figure(2)
dibujomasa(x(:,1))          % genera una sencilla animacion del MRA