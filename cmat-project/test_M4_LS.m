clear;clc;
clear;clc;
X=imread('macro/small/M4_LS_small.png');
XG=rgb2gray(X);
XB=im2bw(XG,0.12);
imwrite(XB,'macro/small_bin/M4_LS_small_bin.png','png');
% subplot(1,2,1)
% imshow(XG);
% subplot(1,2,2)
imshow(XB);
p=nnz(~XB)/numel(XB)*100;