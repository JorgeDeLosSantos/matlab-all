clear all;clc;
n=input('N�mero de filas: ');
A='';
for i=1:n
    A(i,1:2:2*i)='*';
end
disp(A);