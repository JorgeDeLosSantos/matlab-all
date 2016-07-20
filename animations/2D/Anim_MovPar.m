clear all;clc;
t=linspace(0,2,200);
theta=45*pi/180;
v0=12;
g=9.81;
x=v0*cos(theta)*t;
y=v0*sin(theta)*t-(0.5*g*t.^2);
xlim([0 (v0^2*sin(2*theta)/g)]);
ylim([0 (v0^2*(sin(theta))^2/(2*g))*1.05]);
i=1;
set(gca,'NextPlot','replaceChildren');
F = struct('cdata',[],'colormap',[]);
while i<length(t)
    plot(x(i),y(i),'o');
%     drawnow;
    i=i+1;
    F(i)=getframe;
    if y(i)<0
        break;
    end 
end
