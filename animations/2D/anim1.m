function anim1
% Animación de una espiral logarítmica
% Por: Jorge De Los Santos
% http://matlab-typ.blogspot.com

f=figure('NumberTitle','off','name','Animación Espiral',...
    'MenuBar','none','color',[1 1 1]);
t=linspace(0,2*pi,100);
r=0.5;
a=10;
b=0.85;
x=r*cos(t);
y=r*sin(t);
h=fill(x,y,[0 1 0]);axis equal;
dt=0.1;
t_anim=20;
i=0;j=t_anim;
while 1
    axis([1-a a+1 -10 10]);
    if i<t_anim
        set(h,'xdata',x+(a*b^i*cos(i)),'ydata',y+(a*b^i*sin(i)));
        hold on
        plot(a*b^i*cos(i),a*b^i*sin(i),'-bo','Markersize',2);
        set(gca,'visible','off');
        drawnow;
        pause(0.01);
        i=i+dt;
    else
        set(h,'xdata',x+(a*b^j*cos(j)),'ydata',y+(a*b^j*sin(j)));
        drawnow;
        pause(0.01);
        j=j-dt;
    end
    
    if i>1 & j<0,break,end;
end
end