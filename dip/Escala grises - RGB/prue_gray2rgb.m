clear all;clc
A=imread('caribe.png');
A=rgb2gray(A);
A=diff(A);
imshow(A>60)
