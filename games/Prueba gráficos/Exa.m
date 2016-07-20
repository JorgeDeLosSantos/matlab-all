clear all;clc;
x=linspace(0,10,100);
plot(x,cos(x),'r','linewidth',3);
grid;
print('-dtiff','imagen')