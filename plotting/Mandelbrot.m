clear all;close all;clc;
puntos=200;
puntosx=linspace(-2.1,0.9,puntos);
puntosy=linspace(-1.5,1.5,puntos);
[X,Y]=meshgrid(puntosx,puntosy);
C=X+Y*i;
Z=zeros(puntos);
iteraciones=10;
for k=1:iteraciones
    Z=Z.^2+C;
    W=exp(-abs(Z));
end
imagesc(cos(W)+sin(W))
% shading interp
colormap(flipud(hot))