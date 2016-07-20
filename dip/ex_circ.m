close all;clear all;clc;
npx=250;
for i=1:npx
    for j=1:npx
        r=sqrt((npx/2-i)^2+(npx/2-j)^2);
        if r<125 & r>110
            R(i,j)=255;
            G(i,j)=192;
            B(i,j)=203;
        elseif r<110 & r>90
            R(i,j)=255;
            G(i,j)=165;
            B(i,j)=0;
        elseif r<90 & r>70
            R(i,j)=255;
            G(i,j)=0;
            B(i,j)=255;
        elseif r<70 & r>50
            R(i,j)=255;
            G(i,j)=255;
            B(i,j)=0;
        elseif r<50 & r>20
            R(i,j)=0;
            G(i,j)=255;
            B(i,j)=255;
        elseif r<20
            R(i,j)=0;
            G(i,j)=255;
            B(i,j)=0;
        else
            R(i,j)=255;
            G(i,j)=255;
            B(i,j)=255;
        end
    end
end
R=uint8(R);
G=uint8(G);
B=uint8(B);
IM(:,:,1)=R;
IM(:,:,2)=G;
IM(:,:,3)=B;
imwrite(IM,'conc_circ.png');