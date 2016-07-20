clear all;clc;
[x,y]=meshgrid(1:100,1:100);
X=zeros(100,'uint8');
X(abs(((x-50).^2+(y-50).^2)-50^2)<53)=uint8(255);
imshow(X);