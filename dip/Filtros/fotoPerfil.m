clear all;clc;
X=imread('Expo.jpg');
X=rgb2gray(X);
% X=imfilter(X,f);
X=X(180:340,70:190);
f=[1/4 -1/4 1/2];
f=repmat(f,3,1);
X1=imfilter(X,f);
imshow(X);
pause(1)
beep;
imshow(X1);
