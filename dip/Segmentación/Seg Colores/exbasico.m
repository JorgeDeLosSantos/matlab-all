clear all;clc
A=imread('arroz.jpg');
A=double(rgb2gray(A));
imshow(uint8(A))
% M(700,700)=0;
for i=3:size(A,1)-3
    for j=3:size(A,2)-3
        M(i,j)=A(i,j+1)-A(i,j-1)-A(i+1,j)+A(i-1,j);
    end
end
pause(0.5)
imshow(uint8(M));