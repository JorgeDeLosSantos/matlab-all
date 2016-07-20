close all;clear all;clc
A=imread('char.jpg');
A=rgb2gray(A);
% f=[-1 -1 -1;
%     0  0  0;
%     1  1  1];
% imshow(imfilter(A,f));
%%
for i=3:size(A,1)-3
    for j=3:size(A,2)-3
        B(i,j)= -A(i+1,j-1) + 3*A(i+1,j+1)+...
                -A(i,j-1)   + 3*A(i,j+1)+...
                -A(i-1,j-1) + 3*A(i-1,j+1);
    end
end
imshow(B)