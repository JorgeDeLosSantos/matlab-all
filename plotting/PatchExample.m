%% Patch Ejemplo
clear all;clc;
% set(gcf,'outerposition',[0 0 1 1]);
x=[1 1 320 320];
y=[1 240 240 1];
img=imread('imagen.jpg');
imshow(img);
pat=patch(x,y,[1 1 0],'FaceAlpha',0.3);
% saveas(gca,'mmm.png');