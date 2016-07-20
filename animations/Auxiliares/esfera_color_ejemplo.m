clear all;clc;
v=[1 1 0];
C=repmat(v,21,1);
[x,y,z]=sphere(20);
set(gca,'nextplot','add');
surf(x,y,z,'FaceColor',v);
view([30 10 10]);
