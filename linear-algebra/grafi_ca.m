clear;clc;
f = 'x-exp(1-x).*(1+log(x))';
h = ezplot(f);
hold on
x = [0.4967 1];
y = eval(f);
plot(x,y,'ro');
grid on