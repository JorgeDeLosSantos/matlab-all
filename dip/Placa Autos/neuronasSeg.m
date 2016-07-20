clear all;clc
A=imread('fig.png');
D=uint8(diff(double(A)));
[gx,gy]=gradient(double(A));
G=uint8(sqrt(gx.^2+gy.^2));
pause(1)
imshow(D)
pause(1)
figure()
imshow(G)