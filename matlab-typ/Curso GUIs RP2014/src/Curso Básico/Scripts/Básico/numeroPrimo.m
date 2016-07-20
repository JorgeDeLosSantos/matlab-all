% Determina si un numero es primo
clear all;clc;
N=input('Inserta un numero: ');
x=2:N/2;
if any(rem(N,x)==0)
    disp('No primo');
else
    disp('Primo');
end