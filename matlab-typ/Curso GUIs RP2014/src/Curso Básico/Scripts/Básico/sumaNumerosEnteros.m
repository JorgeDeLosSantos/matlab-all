% Calcula la suma de los primeros N numeros enteros positivos
clear all;clc;
N=input('N = ');
suma=0;
for i=1:N
    suma=suma+i;
end
fprintf('\n Suma = %g \n\n',suma);
