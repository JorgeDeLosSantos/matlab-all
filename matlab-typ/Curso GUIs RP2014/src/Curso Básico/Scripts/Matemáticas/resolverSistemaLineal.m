% Ejemplo de solucion de un sistema de ecuaciones lineales
% de la forma  A*x = b
clear all;clc;
A=[3   2   1;
   2   2   4;
  -1  0.5 -1];
b=[1,-2,0]';
x=A\b;
disp(x);