clear all;clc;
X=imread('pedlal.jpg');
X=rgb2gray(X);
X=X(210:480,380:520);
% imshow(X+uint8(sin(double(X))))
k=uint8(log(double(X)));
imshow(X+k);