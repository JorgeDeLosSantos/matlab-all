clear all;clc;
n=input('Introduzca un n�mero: ');
L=1:n; 
if nnz(rem(n,L)==0)==2
    disp('N�mero primo');
else
    disp('N�mero no primo');
end