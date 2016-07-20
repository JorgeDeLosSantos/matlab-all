% Inserta elementos de una matriz uno a uno
clear all; clc;
nf=input('Cantidad de filas: ');
nc=input('Cantidad de columnas: ');
A=zeros(nf,nc);
for i=1:nf
    for j=1:nc
        A(i,j)=input(['Elemento a',num2str(i),num2str(j),': ']);
    end
end
disp(A);