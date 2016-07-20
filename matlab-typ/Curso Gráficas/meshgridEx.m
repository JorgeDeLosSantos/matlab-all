clear all;clc;
x=-5:0.5:5;
y=-5:0.5:5;
f=@(X,Y) cos(X)+sin(Y);
for i=1:length(x)
    for j=1:length(y)
        z(i,j)=f(x(i),y(j));
    end
end
surf(z);