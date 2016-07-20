clear all;clc;
t=linspace(0,6*pi);
x=t-sin(t);
y=1-cos(t);
z=sin(t);
plot3(x,y,z,'r--','linewidth',3);