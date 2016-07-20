clear all;clc;
A=rgb2gray(imread('cianobacterias.jpg'));
X=im2bw(A,graythresh(A));
SE=strel('disk',2);
XX=imerode(X,SE);
imshow(XX)
% out=regionprops(X,'BoundingBox');
% imshow(X)
% hold on
% for i=1:length(out)
%     h=rectangle('Position',out(i).BoundingBox);
%     set(h,'linewidth',2,'EdgeColor','r');
% end
