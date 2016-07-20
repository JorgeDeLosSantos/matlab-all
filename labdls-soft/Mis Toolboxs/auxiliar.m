clear all;clc;
A=rgb2gray(imread('ittg.jpg'));
B=uint8(zeros(size(A)));
for i=1:size(A,2)
    B(1:size(A,1),i)=(i/5)^2-2*i;
    imshow(A+B);
    pause(0.01);
end