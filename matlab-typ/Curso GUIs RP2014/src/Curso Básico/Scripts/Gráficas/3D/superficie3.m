clear all;clc;
[x,y]=meshgrid(-5:0.2:5);
z=x.^2+y.^2;
mesh(x,y,z);
colormap(hot);
xlabel('X');
ylabel('Y');
zlabel('Z');