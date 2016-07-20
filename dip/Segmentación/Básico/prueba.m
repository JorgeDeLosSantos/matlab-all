close all;clear all;clc;
A=rgb2gray(imread('figuras.jpg'));
A=~im2bw(A,0.96);
A=bwareaopen(A,100);
C=regionprops(A);
imshow(A)
hold on
for i=1:length(C)
    rectangle('Position',C(i).BoundingBox,'EdgeColor','y');
    plot(C(i).Centroid(1),C(i).Centroid(2),'rx');
end
hold off

% B=bwareaopen(A,2000);
% figure;
% imshow(A);
% figure;
% imshow(B);