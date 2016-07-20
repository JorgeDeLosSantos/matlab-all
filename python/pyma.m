clear all;clc;
system('python ejemplo.py');
A=importdata('archivo.txt');
imshow(uint8(A));