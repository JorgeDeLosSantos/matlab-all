close all;clear all;clc;
hold on
t=linspace(0,2*pi);
x=cos(t);
y=sin(t);
for r=1:0.1:10
    axis([-10 10 -10 10]);
    axis('square');
    fill(r*x,r*y,rand(1,3));
    pause(0.05);
end
