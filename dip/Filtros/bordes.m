% function X=bordes(I)
clear all;clc
I=imread('Jellyfish.jpg');
I=double(rgb2gray(I));
I(end+1,end+1)=0;
for i=1:size(I,1)-1
    for j=1:size(I,2)-1
        X(i,j)=sqrt((I(i+1,j)-I(i,j))^2+(I(i,j+1)-I(i,j))^2);
    end
end
X=uint8(X);
imshow(X)