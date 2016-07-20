clear;clc;
X=imread('macro\M4_LS.png');
% imshow(X);
XG=rgb2gray(X);
XB=im2bw(XG,0.09);
XB=bwareaopen(~XB,300);
se = strel('disk',2);
XB=imerode(~XB,se);
imshow(XB);
ST=regionprops(~XB,'area');
area=[];
for i=1:length(ST)
    area=[area ST(i).Area];
end

