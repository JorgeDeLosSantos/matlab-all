clear;clc;
hold on
t= linspace(0,2*pi,100);
y = cos(t);
extrude(t,y,1);
