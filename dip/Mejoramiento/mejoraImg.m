clear all;clc;
X=imread('100408192547.jpg');
X=rgb2gray(X);
imshow(X);
pause(0.5);
beep
X=medfilt2(X,[10 10]);
imshow(X)