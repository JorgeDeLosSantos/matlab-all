function rebotball
f=figure('MenuBar','none','NumberTitle','off','Name','Mov Cuad',...
    'position',[400 300 400 400],'resize','off','color','w');

ax=axes('parent',f,'units','normalized','position',[0.05 0.05 0.9 0.9]);
set(ax,'xtick',[],'ytick',[]);

px1=0;
py1=0;
vx1=0.1;
vy1=0.2;
dirx1=1;
diry1=1;

px2=2;
py2=1;
vx2=0.3;
vy2=0.2;
dirx2=-1;
diry2=1;

r=0.5;
t=0:0.01:2*pi;
x1=r*cos(t)+px1;
y1=r*sin(t)+py1;
x2=r*cos(t)+px2;
y2=r*sin(t)+py2;
h1=fill(x1,y1,'r');
hold on
h2=fill(x2,y2,'b');
axis([-10 10 -10 10]);
axis square

while 1
    px1=px1+vx1*dirx1;
    py1=py1+vy1*diry1;
    px2=px2+vx2*dirx2;
    py2=py2+vy2*diry2;
    if px1>(10-r) || px1<r-10
        dirx1=dirx1*-1;
    end
    if py1>(10-r) || py1<r-10
        diry1=diry1*-1;
    end
    if px2>(10-r) || px2<r-10
        dirx2=dirx2*-1;
    end
    if py2>(10-r) || py2<r-10
        diry2=diry2*-1;
    end
    if abs(px1-px2)<r && abs(py1-py2)<r
        dirx1=dirx1*-1;
        diry1=diry1*-1;
        dirx2=dirx2*-1;
        diry2=diry2*-1;
    end
        
    set(h1,'xdata',x1+px1,'ydata',y1+py1);
    set(h2,'xdata',x2+px2,'ydata',y2+py2);
    drawnow;
    pause(0.005);
end
end