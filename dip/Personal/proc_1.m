clear;clc;
X = imread('pat.JPG');
X = imresize(X,0.8);
% X = fpixel(X,5);
X = flapiz(X*3.5);
imshow(X);
imwrite(X,'pat_mod.png');