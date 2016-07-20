clear all;clc;
N=input('Cantidad de elementos: ');
F(1:2)=1;
for i=3:N
    F(i)=F(i-1)+F(i-2);
end
disp(F)