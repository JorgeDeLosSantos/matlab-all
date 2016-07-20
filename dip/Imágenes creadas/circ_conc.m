clear all;clc;
ancho = 500;
alto = 500;
k=255/10;
dmax=sqrt((0.5*ancho)^2+(0.5*alto)^2);
for i=1:ancho
    for j=1:alto
        distc = sqrt((ancho/2-i)^2+(alto/2-j)^2);
        A(i,j)=uint8(round(distc/k*255/dmax)*k);
    end
end
imshow(A);