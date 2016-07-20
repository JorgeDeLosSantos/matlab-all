clear all;clc;
A=imread('diatomeas.PNG');
A=rgb2gray(A);
h=contour3(A);
% [dx,dy]=gradient(double(A));
% imshow(uint8(sqrt(dx.^2+dy.^2)))