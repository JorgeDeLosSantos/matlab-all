clear all;clc;
A=rgb2gray(imread('imfindcircles_coins1.png'));
X=im2bw(A,0.5);
out=regionprops(X,'BoundingBox');
imshow(X)
hold on
k=1;
while k~=length(out)
    if (out(k).BoundingBox(3)*out(k).BoundingBox(4))<20
        out(k)=[];
        k=k-1;
    end
    k=k+1;
end

for i=1:length(out)
    h(i)=rectangle('Position',out(i).BoundingBox);
end
set(h,'EdgeColor','r');