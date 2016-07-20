clear all;clc;
t=linspace(0,6*pi);
x=t-sin(t);
y=1-cos(t);
hg=plot(x,y);
set(hg,'Color','y','linewidth',3);
set(gca,'Color','r');
axis equal