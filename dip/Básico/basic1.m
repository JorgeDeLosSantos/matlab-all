clear all;clc
X=imread('dls.jpg');
X=rgb2gray(X);
n=10;
for i=1:size(X,1)-n
    for j=1:size(X,2)-n
        SM=X(i:i+n,j:j+n);
        A(i,j)=mean(SM(:));
    end
end
imshow(uint8(A));