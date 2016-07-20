clear all;clc;
ancho=300;
alto=300;
dmax=ancho+alto;
for i=1:ancho
    for j=1:alto
        d=i+j;
        A(i,j)=uint8(roundn(((d/dmax)*255),1));
    end
end
imshow(A');