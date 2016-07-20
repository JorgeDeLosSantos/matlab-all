clear;clc;
X=imread('M4_small_test.png');
XG=rgb2gray(X*1.5);
XB=im2bw(X,0.09);
subplot(1,2,1);
imshow(XG);
se = strel('disk',2);
XB=imerode(~XB,se);
XB=bwareaopen(XB,50);
subplot(1,2,2);
imshow(~XB);
ST=regionprops(XB,'area');
area=[];
for i=1:length(ST)
    area=[area ST(i).Area];
end