clear;clc;
X=imread('gray\M1-50X.png');
% XB = im2bw(X,0.5);
% imshow(XB);
[m,n]=size(X);
area_um = m*(200/110)*n*(200/110);
area_mm = area_um*(1/(1e3)^2);

