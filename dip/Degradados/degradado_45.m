clear all;clc;
ancho = 250;
alto = 250;
theta = 45; % Ángulo gradiente
a = cos(theta*(pi/180));
b = sin(theta*(pi/180));
for i=1:ancho
    for j=1:alto
        k = a*i + b*j;
        A(j,i)=uint8(ancho-k);
    end
end
imshow(A);