clear all;clc
% t=linspace(0,10*pi,200);
% x=cos(t);
% y=sin(t);
% z=t;
% plot3(x,y,z,'linewidth',2);
ezplot3('cos(t)','sin(t)','t',[0 10*pi]);
set(h,'linewidth',3);