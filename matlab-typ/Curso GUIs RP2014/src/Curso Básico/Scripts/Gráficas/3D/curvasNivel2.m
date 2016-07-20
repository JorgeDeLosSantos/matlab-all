clear all;clc;
[x,y]=meshgrid(-5:0.2:5);
z=exp(-(x+y)/100)+x.*y;
[C,h]=contourf(x,y,z);
clabel(C,h);
colormap(hsv);