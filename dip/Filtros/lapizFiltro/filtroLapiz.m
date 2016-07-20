clear;clc;
X = imread('alima.jpg');
X = rgb2gray(X);
filtro = [0, 1, 0; 1.5, -4, 0.5; 0, 1, 0];
X = imfilter(X,filtro);
imshow(~X);