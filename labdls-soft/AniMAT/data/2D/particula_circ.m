clear all;clc;
set(gca,'NextPlot','replacechildren');
t=linspace(0,2*pi);
x=cos(t);
y=sin(t);
axis([-2 2 -2 2]);
axis('square');
for i=1:length(t)
    cla;
    hold on
    plot(x(i),y(i),'ro','MarkerFaceColor','r');
    plot(x(1:i),y(1:i),'b');
    pause(0.05);
end
