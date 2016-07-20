clear all;clc;
ancho=500;
alto=500;
for i=1:ancho
    for j=1:alto
        k=cos(i/10)+sin(j/10);
        A(i,j)=uint8(k^-10);
    end
end
imshow(A');