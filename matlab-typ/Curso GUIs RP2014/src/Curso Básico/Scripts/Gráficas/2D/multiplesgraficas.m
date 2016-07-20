clear all;clc;
hold on;
x=0:1/100:10;
y1=cos(x);
y2=sin(x);
plot(x,y1,x,y2,'linewidth',3);
legend('cos(x)','sin(x)');
grid on;