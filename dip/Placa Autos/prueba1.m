clear all;clc
A=rgb2gray(imread('p2.jpg'));
A=~(im2bw(A,graythresh(A)));
imshow(A),pause(0.5)
SE=strel('disk',3);
A=imdilate(A,SE);
imshow(A)