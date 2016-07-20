clear all;clc;
hold on;
[x,y]=meshgrid(-5:0.5:5);
z=cos(x)+sin(y);
[dx,dy]=gradient(z);
h=quiver(x,y,dx,dy);
set(h,'Color','r','linewidth',2);