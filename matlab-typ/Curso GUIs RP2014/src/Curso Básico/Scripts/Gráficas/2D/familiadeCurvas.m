clear all;clc;
% Grafica de la familia de curvas y = sin(x) + k
hold on;
x=-10:1/10:10;
for k=1:10
    plot(x,sin(x)+k,'color',rand(1,3));
end