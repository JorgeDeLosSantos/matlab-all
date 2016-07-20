clear all;clc;
x=sym('x');
f=1/(x-3);
Df=diff(f,x); % Derivada
If=int(f,x); % Integral
Lim=limit(f,x,3);
% Grafica de las curvas
hold on;
h(1)=ezplot(f,[0 10]);
h(2)=ezplot(Df,[0 10]);
h(3)=ezplot(If,[0 10]);
set(h(1),'color','r');
set(h(2),'color','g');
set(h(3),'color','b');