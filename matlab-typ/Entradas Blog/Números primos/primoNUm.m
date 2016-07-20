clear all;clc;
n=input('Introduzca un número: ');
L=1:n; 
if nnz(rem(n,L)==0)==2
    disp('Número primo');
else
    disp('Número no primo');
end