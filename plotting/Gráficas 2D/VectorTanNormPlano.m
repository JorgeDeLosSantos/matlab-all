clear all;clc;
hold on
x=linspace(-10,10,100);
y=x.^2;
plot(x,y);
i=30;
% Recta Tangente Ec: y=m(x-x0)+y0
m=(y(i)-y(i-1))/(x(i)-x(i-1));
rt=m*(x-x(i))+y(i);
plot(x,rt,'r',x(i),y(i),'ro');