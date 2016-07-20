function soled
% Animación de una espiral logarítmica
% Por: Jorge De Los Santos
% matlab-typ.blogspot.com

f=figure('NumberTitle','off','name','Animación Espiral','MenuBar','none','color',[1 1 1]);
[t,y]=ode45(@psimple,[0 10],[0.5 1]);
s=linspace(0,2*pi,100);
r=0.5;
x1=r*cos(s);
y1=r*sin(s);
h=fill(x1,y1,[0 1 0]);axis equal;
dt=0.1;
t_anim=size(t,1);
for i=1:t_anim
    axis([0 12 -10 10]);
    set(h,'ydata',y1+y(i,2),'xdata',x1+t(i));
    set(gca,'visible','off');
    drawnow;pause(0.05);
end
end