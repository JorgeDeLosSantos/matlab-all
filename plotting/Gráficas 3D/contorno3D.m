clear all;clc
% [x,y]=meshgrid(0:0.1:20);
% z=sin(x)+cos(y)+csc(x./y);
% imagesc(abs(z));
% % colormap('hot');
% % a=getframe;
% % imwrite(a.cdata,'img.png','png');
A=imread('img.png');
imagesc(A>50 & A<100);
