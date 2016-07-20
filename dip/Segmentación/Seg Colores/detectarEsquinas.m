clear all;clc;
A=imread('figcolor.png');
A=rgb2gray(A);
X=corner(A);
xc=sort(X(:,1));
yc=sort(X(:,2));
kx=1;ky=1;
for i=2:length(xc)
    if xc(i-1)==xc(i)
        vx(kx)=xc(i);
        kx=kx+1;
    end
    if yc(i-1)==yc(i)
        vy(ky)=yc(i);
        ky=ky+1;
    end
end