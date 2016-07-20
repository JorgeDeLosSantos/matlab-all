% MATLAB TYP
% $ Por: Jorge De Los Santos $
close all;clear all;clc;
x=0:0.1:10;
for i=1:0.1:10
    plot(x,sin(2*x+i));
    pause(0.05);
end