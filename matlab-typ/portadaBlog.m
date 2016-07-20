clear all;clc;
[x,y]=meshgrid(-5:0.1:5);
z=peaks;
contourf(z,20)
axis off
colormap(hsv);
% saveas(gca,'imag.png');