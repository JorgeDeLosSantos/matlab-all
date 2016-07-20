clear;clc;
X=imread('gray/50x/M2-50X.png');
subplot(1,2,1);
imshow(X)
XB=im2bw(X,0.42);
XB=bwareaopen(~XB,200,18);
se = strel('disk',8);
XB=imerode(~XB,se);
XB=imclose(XB,se);
subplot(1,2,2);
imshow(XB)
imwrite(XB,'M2_micro_bin.png');
% ST=regionprops(~XB,'area');
% area=[];
% for i=1:length(ST)
%     area=[area ST(i).Area];
% end