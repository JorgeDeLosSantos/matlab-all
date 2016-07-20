clear all;clc;
A=imread('ITTG.PNG');
A=rgb2gray(A);
[c,r] = imfindcircles(A,[2 50]);
c=round(c);
imshow(A);
pause(0.1);
[x,y]=meshgrid(1:size(A,2),1:size(A,1));
for i=1:length(r)
    cx=c(i,2);
    cy=c(i,1);
    A(cx,cy)=255;
%     A(abs(((x-cy).^2+(y-cx).^2)-r(i)^2)<(r(i)+2))=0;
    A((x-cy).^2+(y-cx).^2<r(i)^2)=255;
end
pause(2);
imshow(A==255)