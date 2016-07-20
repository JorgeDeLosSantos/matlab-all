clear;clc;
X=imread('macro\M2_F_small.png');
XG=rgb2gray(X);
XB=im2bw(XG,0.42);
p=nnz(~XB)/numel(XB)*100;
imshow(XB);
% imwrite(XB,'macro/M2_F_small_bin.png','png');