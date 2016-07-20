clear all;clc;
x=linspace(0,10,100);
y=sin(x);
hold on
plot(x,y);
for i=1:length(x)
    plot(x(i),y(i),'bo','MarkerFaceColor','b');
    drawnow;
end