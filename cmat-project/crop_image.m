clear;clc;
X=imread('macro/M3_F.png');
X(40:540,1040:1041,:)=255;
X(40:540,1540:1541,:)=255;
X(40:41,1040:1540,:)=255;
X(540:541,1040:1540,:)=255;
% imshow(X);
imwrite(X,'macro/M3_F_segmented.png','png');
% X=rgb2gray(X);
% imshow(X(40:540,1040:1540,:));