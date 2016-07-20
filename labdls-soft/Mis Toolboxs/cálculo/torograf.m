clear all;clc;
x=0:0.1:2;
f1=sqrt(1-(x-1).^2)+2;
f2=-sqrt(1-(x-1).^2)+2;
hold on
cylinder(f1)
cylinder(f2)
daspect([1 1 1])
view(3)