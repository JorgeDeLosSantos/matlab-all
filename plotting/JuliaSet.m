close all;clear all;clc;
puntos=200;
puntosx=linspace(-2.1,0.9,puntos);
puntosy=linspace(-1.5,1.5,puntos);
[X,Y]=meshgrid(puntosx,puntosy);
c=0.27334-0.00742*i;
% c=pi/10-pi/100*i;
Z=X+Y*i;
iteraciones=10;
for k=1:iteraciones
    Z=Z.^2+c;
    W=exp(-abs(Z));
end
pcolor(W);
shading interp
colormap(hot)

