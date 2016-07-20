clear all;clc;
A=imread('ipexbatch_01.png');
A=rgb2gray(A);
[c,r] = imfindcircles(A,[15 50]);
c=round(c);
imshow(A);
pause(0.5)
[x,y]=meshgrid(1:size(A,2),1:size(A,1));
for i=1:length(r)
    cx=c(i,2);
    cy=c(i,1);
    A(cx,cy)=255;
%     A(abs(((x-cy).^2+(y-cx).^2)-r(i)^2)<(r(i)+2))=0;
    A((x-cy).^2+(y-cx).^2<r(i)^2)=255;
end
imshow(A==255)
% imdistline(gca,c(1:2,2),c(1:2,1));