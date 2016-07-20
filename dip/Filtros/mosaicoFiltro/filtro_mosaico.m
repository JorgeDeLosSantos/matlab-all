clear;clc;
X = imread('alima.jpg');
[m,n,~]=size(X);
NX = zeros(size(X));
k = 4;
for i=1:k:m-k
    for j=1:k:n-k
        NX(i:i+k-1,j:j+k-1,1)=mean(mean(X(i:i+k-1,j:j+k-1,1)));
        NX(i:i+k-1,j:j+k-1,2)=mean(mean(X(i:i+k-1,j:j+k-1,2)));
        NX(i:i+k-1,j:j+k-1,3)=mean(mean(X(i:i+k-1,j:j+k-1,3)));
    end
end
imshow(uint8(NX));