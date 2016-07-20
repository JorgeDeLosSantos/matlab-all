clear all;clc;
ancho=255;
alto=255;
V=linspace(0,255,4);
for i=1:ancho
    for j=1:alto
        k=max(find(V<i & V<j));
        A(i,j)=uint8(V(k));
    end
end
imshow(A');
