clear all;clc;
% [X,Y]=meshgrid(-5:0.1:5);
% Z=X.^2+Y.^2;
% surf(X,Y,Z);
% figure
ezsurf('x^2+y^2',[-5 5]);
