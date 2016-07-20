close all;clear all;clc;
Z=membrane;
h=surf(Z);
shading('interp');
for i=1:50
    colormap(rand(64,3));
    pause(0.05);
end