clear all;clc;
a=input('Inserte 1er número: ');
b=input('Inserte 2do número: ');
k=0;
while a >= b
    a=a-b;
    k=k+1;
end
fprintf('\nDivisión entera: %d',k);
fprintf('\nResiduo: %d\n\n',a);