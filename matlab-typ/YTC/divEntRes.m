clear all;clc;
a=input('Inserte 1er n�mero: ');
b=input('Inserte 2do n�mero: ');
k=0;
while a >= b
    a=a-b;
    k=k+1;
end
fprintf('\nDivisi�n entera: %d',k);
fprintf('\nResiduo: %d\n\n',a);