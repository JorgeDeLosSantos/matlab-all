clear;clc;
X=imread('macro\M3_F_small.png');
XG=rgb2gray(X);
XG(300:end,:)=XG(300:end,:)*1.2;
XB=im2bw(XG,0.5);
p=nnz(~XB)/numel(XB)*100;
% imshow(XB);
% imwrite(XB,'macro/M3_F_small_bin.png','png');