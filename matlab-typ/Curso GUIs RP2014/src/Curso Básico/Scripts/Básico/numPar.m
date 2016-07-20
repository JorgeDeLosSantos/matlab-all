% Determina si un numero dado es par o impar
clear all;clc;
n=input('Numero: ');
if rem(n,2)==0
    disp('Par');
else
    disp('Impar');
end