close all;clear all;clc
A=imread('DSC00951.JPG');
fl = fspecial('disk',2);
B=imfilter(A,fl);
figure();
imshow(A);
figure();
imshow(B);