clear all;clc
[x,y]=meshgrid(0:0.2:5);
z=exp(x+y);
hold on
surf(x,y,z);
surfnorm(x,y,z);
view(3)