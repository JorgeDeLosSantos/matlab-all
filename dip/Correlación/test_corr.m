clear;clc;
X=imread('coins.png');
s=imread('mask.png');
[m,n]=size(s);
ip=[];
jp=[];
for i=m:size(X,1)-m
    for j=n:size(X,2)-n
        k=corr2(X(i:i+m-1,j:j+n-1),s);
        if k>0.5
            X(i,j)=255;
        end
    end
end
imshow(X);