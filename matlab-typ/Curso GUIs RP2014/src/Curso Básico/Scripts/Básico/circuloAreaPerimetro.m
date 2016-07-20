% Calcula el area y perimetro de un circulo
% usando como dato de entrada el radio.
clear all;clc;
r=input('Radio: ');
A=pi*r^2; % Area del circulo
P=2*pi*r; % Perimetro del circulo
fprintf('Area: %g \n',A);
fprintf('Perimetro: %g \n',P);