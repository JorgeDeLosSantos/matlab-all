clear all;clc;
hold on
% n=4;
for n=1:100
    t=0:2*pi/n:2*pi;
    x=cos(t);
    y=sin(t);
    plot(x,y);
end
axis('square');