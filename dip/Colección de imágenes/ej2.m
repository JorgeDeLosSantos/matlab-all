close all;clear all;clc
X=imread('DSC00854.JPG');
X=rgb2gray(X);
% X=sort(X);
mesh(double(X))
% colormap(hot)
