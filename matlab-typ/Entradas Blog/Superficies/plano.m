clear all;clc
hold on
ezsurf('x^2+y^2',[-5 5]);
k=20;
A=[-5 -5 k];
B=[-5 5 k];
C=[5 5 k];
D=[5 -5 k];
X=[A(1) B(1) C(1) D(1)];
Y=[A(2) B(2) C(2) D(2)];
Z=[A(3) B(3) C(3) D(3)];
fill3(X,Y,Z,[0.7 0.7 0.7]);
view(3);