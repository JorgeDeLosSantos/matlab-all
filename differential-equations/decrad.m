close all;clear all;clc;
dydt=@(t,y) -0.10*y; %Definimos una funci�n "an�nima" que contiene la ED
[t,y]=ode45(dydt,[0 10],[4]); 
hold on
plot(t,y);
%% Simb�lico
syms x;
sol=dsolve('Dy=-0.1*y','y(0)=4');
ezplot(sol,[0,10]);