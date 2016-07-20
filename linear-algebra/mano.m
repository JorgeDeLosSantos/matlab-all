clear all;clc
figure();
axes('position',[0 0 1 1])
axis(10*[-1 1 -1 1])
k=1;
hold on
while ~strcmp(get(gcf,'SelectionType'),'open')
    [x(k),y(k)] = ginput(1);
    plot(x(k),y(k),'.');
    axis(10*[-1 1 -1 1])
    k=k+1;
end
plot(x,y);