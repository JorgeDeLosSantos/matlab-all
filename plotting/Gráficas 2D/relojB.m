function relojB
clear all;clc;
figure('MenuBar','None','Color','w');
stopb = uicontrol('style','toggle','str','STOP',...
    'Position',[10 10 40 20]);
t=pi/2:-pi/30:-3/2*pi;
L=length(t);
i=clock;
x=cos(t);
y=sin(t);
while 1
    if get(stopb,'value')
        break;
    end
    cla;
    i = clock;
    pS=ceil(i(end)*L/60);
    pM=ceil(i(end-1)*L/60);
    pH=ceil(i(end-2)*5*L/60);
    hold on
    plot(x(1:round(L/12):end),y(1:round(L/12):end),'o');
    plot(x(1:round(L/60):end),y(1:round(L/60):end),'m.');
    if all([pS,pM,pH]~=0)
        line([0 x(pS)],[0 y(pS)],'color','b');
        line([0 x(pM)],[0 y(pM)],'color','r','linewidth',2);
        line([0 x(pH)*0.5],[0 y(pH)*0.5],'color','g','linewidth',3);
    end
    hold off
    set(gca,'visible','off');
    axis([-1 1 -1 1]);
    axis('square');
    drawnow;
end
end