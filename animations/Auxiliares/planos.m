close all;clear all;clc
set(gca,'NextPlot','Add');
xlabel('X'),ylabel('Y'),zlabel('Z');
M= [0 0 0;
    0 1 0;
    0 1 1;
    0 0 1;
    1 0 0;
    1 1 0;
    1 1 1;
    1 0 1];
K= [1 5 6 2;
    3 4 8 7;
    5 6 7 8;
    1 2 3 4;
    2 3 7 6;
    1 4 8 5];
for n=1:6
    for i=1:4
        X(i)=M(K(n,i),1);
        Y(i)=M(K(n,i),2);
        Z(i)=M(K(n,i),3);
    end
    fill3(X,Y,Z,[1 1 0]);
end
axis([0 5 0 5 0 5]);
view(3);