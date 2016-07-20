clear all;clc;
N=input('Introduzca un número entero: ');
k=1;
fact=1;
while k<=N
    fact=k*fact;
    k=k+1;
end
fprintf('\nFactorial: %d\n\n',fact);