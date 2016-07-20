clear all;clc
[A,map]=imread('Imag/paisaje01.jpg');
if isempty(map)
    clearvars('map');
else
    A=ind2rgb(A,map);
    A=uint8(A*255);
end
imshow(A);
impixelinfo;
pause(1)
[f,c]=find(A(:,:,1)>100 & A(:,:,2)<70 & A(:,:,3)<70);
for i=1:length(f)
    A(f(i),c(i),3)=255;
    A(f(i),c(i),[2,1])=0;
end
imshow(A);
impixelinfo;