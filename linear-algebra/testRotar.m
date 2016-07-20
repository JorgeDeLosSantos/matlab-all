close all;clear;clc;
x = 5;
y = 5;
z = 1;
set(gca,'XLim',[-10 10],'YLim',[-10 10]);
while 1
    esfera(1,x,y,z);
    [x,y,z] = rotar3D(x,y,z,10);
    set(gca,'XLim',[-10 10],'YLim',[-10 10]);
    daspect([1 1 1]);
    pause(0.1);
end



% x = 1;
% y = 1;
% h = plot(x,y,'ro','MarkerSize',4);
% set(gca,'XLim',[-2 2],'YLim',[-2 2]);
% hold on
% while ishandle(h)
%     [x,y] = rotar(x,y,randi(10));
%     h = plot(x,y,'ro','MarkerSize',4);
%     pause(0.3);
% end