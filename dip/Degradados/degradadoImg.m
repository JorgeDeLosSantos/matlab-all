clear all;clc;
ancho = 250;
alto = 250;

%% Degradado Der -> Izq
% subplot(2,2,1)
for i=1:ancho
    A(1:alto,i)=uint8(ancho-i);
end
imshow(A);

%% Degradado Izq -> Der
% subplot(2,2,2)
for i=1:ancho
    A(1:alto,i)=uint8(i);
end
imshow(A);

%% Degradado radial Ad -> Af
% subplot(2,2,3)
for i=1:ancho
    for j=1:alto
        distr = sqrt((ancho/2-i)^2+(alto/2-j)^2);
        A(j,i)=uint8(distr);
    end
end
imshow(A);

%% Degradado radial Af -> Ad
% subplot(2,2,4)
for i=1:ancho
    for j=1:alto
        distr = sqrt((ancho/2-i)^2+(alto/2-j)^2);
        A(j,i)=uint8(0.5*ancho-distr);
    end
end
imshow(A);