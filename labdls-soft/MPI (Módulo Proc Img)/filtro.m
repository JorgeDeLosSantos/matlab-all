clear all;clc
A=imread('monedas.jpg');
A=rgb2gray(A);
A=~im2bw(A,0.9);
% A=bwareaopen(A,100);
% xx=regionprops(A);
% f=fspecial('unsharp');
% f=[1 0 -1;
%    1 0 -1;
%    1 0 -1];
% A=imfilter(A,f);
% imshow(A);
imshow(A)
[centers, radii, metric] = imfindcircles(A,[30 40]);
centersStrong5 = centers(:,:);
radiiStrong5 = radii(:);
metricStrong5 = metric(:);
viscircles(centersStrong5, radiiStrong5,'EdgeColor','y');
