clear all;clc;
[x,y]=meshgrid(1:10);
mesh(x,y,cos(x./y));
xlabel('X');
ylabel('Y');
zlabel('Z');