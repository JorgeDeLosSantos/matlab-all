clear all;clc
A=imread('char.jpg');
for i=1:10
    C(:,:,:,i)=A+i*20;
end
for i=1:10
    imshow(C(:,:,:,i))
    pause(0.1);
end