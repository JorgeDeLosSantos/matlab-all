clear all;clc;
n=input('�Cu�ntos t�rminos necesita? ');
F=[1 1]; % Primeros dos t�rminos de la sucesi�n
for i=3:n
    F=[F F(i-1)+F(i-2)];
end
disp(F);