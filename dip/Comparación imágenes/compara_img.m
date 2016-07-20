clear all;close all;clc;
A=imread('colores1.PNG');
B=imread('colores2.PNG');
A=rgb2gray(A);
B=rgb2gray(B);
% all(all(A==B))
if all(all(A==B))==0
    [f,c]=find(A~=B);
end
figure();
imshow(B);
for i=1:length(f)
    imrect(gca,[c(i)-20,f(i)-20,40,40]);
end