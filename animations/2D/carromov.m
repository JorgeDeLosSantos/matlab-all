function carromov
persistent M
f=figure('MenuBar','none','NumberTitle','off','Name','Mov Cuad',...
    'position',[400 300 700 300],'resize','off','color',[0.5 0.6 0.3]);
%% Panel & Axes
pp=uipanel(f,'units','normalized','position',[0.01 0.01 0.98 0.98]);
ax=axes('parent',pp,'units','normalized','position',[0 0 1 1]);
set(ax,'xtick',[],'ytick',[]);

%% Inicio
px0=0;
py0=0;
cx=0.1*cos(0:0.1:2*pi);
cy=0.05*sin(0:0.1:2*pi);
h=fill(cx,cy,[1 0 0]);
dt=0.1;
a=-0.1;
v0=2;
t=0;
while 1
    axis([0 10 -1 2]);
    if t>5
        break;
    end
    set(h,'xdata',cx+v0*t+0.5*a*t^2);
    t=t+dt;
    pause(0.1);
    drawnow();
end

end