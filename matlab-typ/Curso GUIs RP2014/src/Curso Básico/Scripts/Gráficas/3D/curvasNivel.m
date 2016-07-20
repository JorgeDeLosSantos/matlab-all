clear all;clc;
[x,y]=meshgrid(-5:0.2:5);
z=x.^2+y.^2;
contour(x,y,z);