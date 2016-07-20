clear;clc;
X=imread('gray/50x/M3-50X.png');
subplot(1,2,1);
% imshow(X)
XB=im2bw(X,0.32);
XB=bwareaopen(~XB,200);
se = strel('disk',10);
XB=imerode(~XB,se);
subplot(1,2,2);
imshow(XB)
imwrite(XB,'M3_micro_bin.png');
% ST=regionprops(~XB,'area');
% area=[];
% for i=1:length(ST)
%     area=[area ST(i).Area];
% end