clear all;clc
A=imread('ittg.jpg');
for i=1:size(A,1)
    for j=1:size(A,2)
        k1=max(A(i,j,1),A(i,j,2));
        k2=max(A(i,j,3),k1);
        B(i,j)=k2;
    end
end
imshow(B)
figure()
imshow(rgb2gray(A));
% C=rgb2gray(A);