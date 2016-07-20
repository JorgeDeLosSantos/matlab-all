clear all;clc;
hold on;
r1=1;
r2=1.5;
r3=2;
[x,y,z]=sphere;
surf(r1*x+4,r1*y,r1*z+2);
surf(r2*x+1,r2*y,r2*z-1);
surf(r3*x-4,r3*y,r3*z);
daspect([1 1 1]);
view(3);