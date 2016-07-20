% Calcula las raices de una ecuacion cuadratica de la forma:
%       a*x^2+b*x+c=0
% Siendo las entradas los coeficientes a, b y c.
clear all;clc;
a=input('a = ');
b=input('b = ');
c=input('c = ');
x1=(-b+sqrt(b^2-4*a*c))/(2*a);
x2=(-b-sqrt(b^2-4*a*c))/(2*a);
fprintf('x1 = %s \n',num2str(x1));
fprintf('x2 = %s \n',num2str(x2));