%  sepiaImg.m
%
%  Copyright 2014 Jorge De Los Santos <delossantosmfq@gmail.com>

clear;
clc;

img='playa.jpg';
X = imread(img);

R = X(:,:,1);
G = X(:,:,2);
B = X(:,:,3);

% NR=0.93*R+0.769*G+0.189*B;
% NG=0.349*R+0.686*G+0.168*B;
% NB=0.272*R+0.534*G+0.131*B;

for i=1:10
    K1=rand(1,3);
    K2=rand(1,3);
    K3=rand(1,3);
    NR=K1(1)*R+K2(1)*G+K3(1)*B;
    NG=K1(2)*R+K2(2)*G+K3(2)*B;
    NB=K1(3)*R+K2(3)*G+K3(3)*B;
    imshow(cat(3,NR,NG,NB));
    pause(0.1);
end

