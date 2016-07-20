clear all;clc;
[x,y]=meshgrid(-5:0.2:5);
z=cos(x)+sin(y);
surf(x,y,z);