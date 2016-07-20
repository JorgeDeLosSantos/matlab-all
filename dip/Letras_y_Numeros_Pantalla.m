%% Letras y Números en Pantalla
close all;clear all;clc;
img=imread('Pat.png');
bina=im2bw(img);
gris=rgb2gray(img);
imhsv=im2uint16(img);
subplot(2,2,1);
imshow(img,'InitialMagnification','fit');
subplot(2,2,2);
imshow(gris,'InitialMagnification','fit');
subplot(2,2,3);
imshow(bina,'InitialMagnification','fit');
subplot(2,2,4);
imshow(imhsv,'InitialMagnification','fit');
