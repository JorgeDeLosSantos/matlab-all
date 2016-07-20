clear all;clc;
r=getrect(gca);
X=[r(1) r(1)+r(3) r(1)+r(3) r(1) r(1)];
Y=[r(2) r(2) r(2)+r(4) r(2)+r(4) r(2)];
line(X,Y);