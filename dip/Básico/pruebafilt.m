function pruebafilt
A=imread('Jorge1.PNG');
subplot(1,2,1);
imshow(A);
A=rgb2gray(A);
A=qfilt(A,2);
% imwrite(A,'img.png','png');
subplot(1,2,2);
imshow(A)
end