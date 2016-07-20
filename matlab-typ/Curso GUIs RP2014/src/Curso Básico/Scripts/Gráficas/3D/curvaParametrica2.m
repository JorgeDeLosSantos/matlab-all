clear all;clc;
t=linspace(0,10*pi,1000);
x=sin(t).*(exp(cos(t))-2*cos(4*t)-(sin(t/12)).^5);
y=cos(t).*(exp(cos(t))-2*cos(4*t)-(sin(t/12)).^5);
z=t;
plot3(x,y,z);