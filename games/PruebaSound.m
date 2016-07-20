clear all;clc;
Fs=6000;
x=0:0.1:1000;
y=sin(x)-cos(x.^2);
% plot(y)
sound(y,Fs)