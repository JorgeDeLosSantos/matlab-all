%% Contar objetos
Imagen=imread('imagen.png');Im_R=Imagen(:,:,1);
Im_G=Imagen(:,:,2);
Im_B=Imagen(:,:,3);
[m,n,p]=size(Imagen);
% m=489;
% n=323;
% p=3;
Im_gris=rgb2gray(Imagen);
Im_bin=im2bw(Imagen,0.3);
figure,imshow(Imagen);
figure,imshow(Im_gris);
figure,imshow(Im_bin);
Im_etiqueta=bwlabel(Im_bin);
total_objetos=max(max(Im_etiqueta));
disp('El numero total de objetos en la imagen es:')
disp(total_objetos)