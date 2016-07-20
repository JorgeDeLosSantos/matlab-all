%% Leer imagen
%Bordes
img=imread('uobs.png');
imgg=rgb2gray(img);
BW1 = edge(imgg,'prewitt');
BW2 = edge(imgg,'canny');
subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(imgg);
subplot(2,2,3);
imshow(BW1);
subplot(2,2,4);
imshow(BW2);
