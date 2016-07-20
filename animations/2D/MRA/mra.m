%  Programa que contiene las ecuaciones de estado de un sistema
%  masa-resorte-amortiguador.
%  Los parametros se pueden modificar.
%  La entrada es un escalon, pero es posible modificarla.
%  No cambiar el nombre de la variables.

%  Realizo: Ricardo Cuesta
%  Fecha: 15/11/12
%  Version: 0.1
function xp = mra(t,x)

m = 1;      % masa
b = 0.75;   % amortiguador
k = 10;     % resorte

u = 1;      % entrada: escalon

xp(1,:) = x(2);
xp(2,:) = (u-b*x(2)-k*x(1))/m; 