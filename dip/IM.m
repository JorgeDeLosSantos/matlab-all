clear all;clc;
A(:,:,1)=uint8(randint(200,200,[0 255]));
A(:,:,2)=uint8(randint(200,200,[0 255]));
A(:,:,3)=uint8(randint(200,200,[0 255]));
% imwrite(A,'im.tif');
imshow(A)