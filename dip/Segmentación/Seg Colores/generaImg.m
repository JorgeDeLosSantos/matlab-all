clear all;clc;
N=1000;
[x,y]=meshgrid(1:N);
z=(x-N/2).^2+(y-N/2).^2;
% imshow(uint8(z/(N)),jet);
imwrite(uint8(z/N),jet,'img.png','png');