% Resuelve numericamente la ecuacion diferencial
% de primer orden  dy/dt=-0.3*y(t) en el intervalo
% [0 10] con las condiciones iniciales y(0)=1, y(0)=2,
% y(0)=3,...,y(0)=10.
clear all;clc;
dydt=@(t,y) -0.3*y;
[T,Y]=ode45(dydt,[0 10],[1:10]);
plot(T,Y);
