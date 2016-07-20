clear all;clc;
ancho=500;
alto=500;
dmax = sqrt(ancho^2+alto^2);
k=255/10;
for i=1:ancho
    for j=1:alto
        dpi=sqrt(i^2+j^2);
        A(i,j)=uint8(round(dpi/k*(255/dmax))*k);
    end
end
imshow(A');