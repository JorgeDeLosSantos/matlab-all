clear all;clc;
n=input('¿Cuántos términos necesita? ');
F=[1 1]; % Primeros dos términos de la sucesión
for i=3:n
    F=[F F(i-1)+F(i-2)];
end
disp(F);